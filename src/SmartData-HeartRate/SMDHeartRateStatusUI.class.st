Class {
	#name : #SMDHeartRateStatusUI,
	#superclass : #BorderedMorph,
	#instVars : [
		'dataStore',
		'role',
		'patient',
		'currentStatus'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #accessing }
SMDHeartRateStatusUI >> dataStore [
	^ dataStore
]

{ #category : #accessing }
SMDHeartRateStatusUI >> dataStore: anObject [
	dataStore := anObject
]

{ #category : #stepping }
SMDHeartRateStatusUI >> drawOn: aCanvas [
	super drawOn: aCanvas.
	currentStatus ifNotNil: [
		aCanvas drawString: currentStatus beatsPerMinute value asString in: self bounds 
	].
]

{ #category : #stepping }
SMDHeartRateStatusUI >> fillStyle [
	^ currentStatus
		ifNil: [ Color black ]
		ifNotNil: [ Color green ]
]

{ #category : #accessing }
SMDHeartRateStatusUI >> patient [
	^ patient
]

{ #category : #accessing }
SMDHeartRateStatusUI >> patient: anObject [
	patient := anObject
]

{ #category : #accessing }
SMDHeartRateStatusUI >> role [
	^ role
]

{ #category : #accessing }
SMDHeartRateStatusUI >> role: anObject [
	role := anObject
]

{ #category : #stepping }
SMDHeartRateStatusUI >> step [
	| newStatus samples |
	newStatus := nil.
	dataStore withRole: role doTransactionWith: [ :transaction |
		samples := patient lastVersion heartRateSamples.
		samples ifEmpty: [ transaction abort ].
		newStatus := samples last.
	].

	newStatus ~= currentStatus ifTrue: [ 
		currentStatus := newStatus.
		self changed.
	].

]

{ #category : #stepping }
SMDHeartRateStatusUI >> stepTime [
	^ 500
]
