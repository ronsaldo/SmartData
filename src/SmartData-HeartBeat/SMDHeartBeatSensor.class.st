Class {
	#name : #SMDHeartBeatSensor,
	#superclass : #Object,
	#instVars : [
		'sensorProcess',
		'sensorDataTransmissionProcess',
		'availableDataForSending',
		'availableDataForSendingConditing',
		'availableDataForSendingMutex',
		'random'
	],
	#category : #'SmartData-HeartBeat'
}

{ #category : #queue }
SMDHeartBeatSensor >> dequeueBatchForSending [
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
SMDHeartBeatSensor >> isDataBatchSuitableForSending: dataBatch [
	| firstTimestamp lastTimestamp deltaTime |
	dataBatch size < 2 ifTrue: [ ^ false ].
	firstTimestamp := dataBatch first timestamp.
	lastTimestamp := dataBatch last timestamp.
	deltaTime := lastTimestamp - firstTimestamp.
	^ deltaTime >= 10 seconds "1 minute"
]

{ #category : #'sensor polling process' }
SMDHeartBeatSensor >> pushNewSample: aSample [
	availableDataForSendingMutex critical: [
		availableDataForSending add: aSample.
		availableDataForSendingConditing signal.
	].

]

{ #category : #'sensor polling process' }
SMDHeartBeatSensor >> sensorPollingIteration [
	| now bpm timestamp |
	random ifNil: [ random := Random seed: 42 ].
	now := Time microsecondClockValue *1e-6.
	bpm := 80 + (20 * (now * Float twoPi *(1/7.0)) cos) + ((random next * 2.0 - 1.0) * 15).
	timestamp := DateAndTime now.
	self pushNewSample: (SMDHeartBeatSensorSample new
		timestamp: timestamp;
		beatsPerMinute: bpm;
		yourself).
	(Delay forMilliseconds: (1000 + (3000 * random next)) floor ) wait
]

{ #category : #'process actions' }
SMDHeartBeatSensor >> start [
	self stop.

	availableDataForSending := OrderedCollection new.
	availableDataForSendingConditing := Semaphore new.
	availableDataForSendingMutex := Semaphore forMutualExclusion.
	
	sensorProcess := self startSensorPollingLoop.
	sensorDataTransmissionProcess := self startSensorDataTransmissionProcess.
]

{ #category : #'data transmission process' }
SMDHeartBeatSensor >> startSensorDataTransmissionProcess [
	^ [
		[self submitDataBatch: self dequeueBatchForSending] repeat
	] fork
]

{ #category : #'sensor polling process' }
SMDHeartBeatSensor >> startSensorPollingLoop [
	^ [ [ self sensorPollingIteration ] repeat ] fork
]

{ #category : #'process actions' }
SMDHeartBeatSensor >> stop [
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
SMDHeartBeatSensor >> submitDataBatch: batchToSend [
	Transcript show: batchToSend; cr.
]
