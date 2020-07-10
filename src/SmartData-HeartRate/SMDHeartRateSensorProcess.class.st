Class {
	#name : #SMDHeartRateSensorProcess,
	#superclass : #Object,
	#instVars : [
		'dataStore',
		'role',
		'sensorProcess',
		'sensorDataTransmissionProcess',
		'availableDataForSending',
		'availableDataForSendingConditing',
		'availableDataForSendingMutex',
		'random',
		'sensorUI'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #accessing }
SMDHeartRateSensorProcess >> dataStore [
	^ dataStore
]

{ #category : #accessing }
SMDHeartRateSensorProcess >> dataStore: anObject [
	dataStore := anObject
]

{ #category : #queue }
SMDHeartRateSensorProcess >> dequeueBatchForSending [
	| result |
	result := nil.
	[
		availableDataForSendingConditing wait.
		availableDataForSendingMutex critical: [
			(self isDataBatchSuitableForSending: availableDataForSending) ifTrue: [
				result := availableDataForSending.
				availableDataForSending := OrderedCollection new.
			].
		].
		availableDataForSendingConditing consumeAllSignals.	
	] doWhileTrue: [ result isNil ].
	
	^ result
]

{ #category : #queue }
SMDHeartRateSensorProcess >> isDataBatchSuitableForSending: dataBatch [
	| firstTimestamp lastTimestamp deltaTime |
	dataBatch size < 2 ifTrue: [ ^ false ].
	firstTimestamp := dataBatch first timestamp.
	lastTimestamp := dataBatch last timestamp.
	deltaTime := lastTimestamp - firstTimestamp.
	^ deltaTime >= 10 seconds "1 minute"
]

{ #category : #'as yet unclassified' }
SMDHeartRateSensorProcess >> openUI [
	sensorUI := SMDHeartRateSensorUI new
		sensor: self;
		openWithSpec;
		yourself
]

{ #category : #'sensor polling process' }
SMDHeartRateSensorProcess >> pushNewSample: aSample [
	availableDataForSendingMutex critical: [
		availableDataForSending add: aSample.
		availableDataForSendingConditing signal.
	].
	sensorUI ifNotNil: [ sensorUI lastSample: aSample ].

]

{ #category : #accessing }
SMDHeartRateSensorProcess >> role [
	^ role
]

{ #category : #accessing }
SMDHeartRateSensorProcess >> role: anObject [
	role := anObject
]

{ #category : #'sensor polling process' }
SMDHeartRateSensorProcess >> sensorPollingIteration [
	| now bpm timestamp |
	random ifNil: [ random := Random seed: 42 ].
	now := Time microsecondClockValue *1e-6.
	bpm := 80 + (20 * (now * Float twoPi *(1/14567.0)) sin) + ((random next * 2.0 - 1.0) * 5).
	timestamp := DateAndTime now.
	self pushNewSample: (SMDHeartRateSensorSample new
		timestamp: timestamp;
		beatsPerMinute: bpm;
		yourself).
	(Delay forMilliseconds: (300 + (200 * random next)) floor ) wait
]

{ #category : #accessing }
SMDHeartRateSensorProcess >> sensorUI [
	^ sensorUI
]

{ #category : #accessing }
SMDHeartRateSensorProcess >> sensorUI: anObject [
	sensorUI := anObject
]

{ #category : #'process actions' }
SMDHeartRateSensorProcess >> start [
	self stop.

	availableDataForSending := OrderedCollection new.
	availableDataForSendingConditing := Semaphore new.
	availableDataForSendingMutex := Semaphore forMutualExclusion.
	
	sensorProcess := self startSensorPollingLoop.
	sensorDataTransmissionProcess := self startSensorDataTransmissionProcess.
]

{ #category : #'data transmission process' }
SMDHeartRateSensorProcess >> startSensorDataTransmissionProcess [
	^ [
		[self submitDataBatch: self dequeueBatchForSending] repeat
	] fork
]

{ #category : #'sensor polling process' }
SMDHeartRateSensorProcess >> startSensorPollingLoop [
	^ [ [ self sensorPollingIteration ] repeat ] fork
]

{ #category : #'process actions' }
SMDHeartRateSensorProcess >> stop [
	sensorProcess ifNotNil: [
		sensorProcess terminate.
		sensorProcess := nil.
	].
	sensorDataTransmissionProcess ifNotNil: [ 
		sensorDataTransmissionProcess terminate.
		sensorDataTransmissionProcess := nil.
	].
]

{ #category : #'data transmission process' }
SMDHeartRateSensorProcess >> submitDataBatch: batchToSend [
	dataStore withRole: role doTransactionWith: [ :transaction |
		| sensor patient |
		sensor := role lastVersion.
		patient := sensor patient value lastVersion.
		
		patient heartRateSamples addAll: (batchToSend collect: [ :each | SMDHeartRateSample new
				timestamp: each timestamp;
				beatsPerMinute: each beatsPerMinute;
				yourself]).
		transaction commit
	].

]
