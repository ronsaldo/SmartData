Class {
	#name : #SMDHeartRateSensorUI,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'button',
		'label',
		'sensor'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #specs }
SMDHeartRateSensorUI class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #label;
		add: #button;
		yourself
]

{ #category : #accessing }
SMDHeartRateSensorUI >> button [
	^ button
]

{ #category : #initialization }
SMDHeartRateSensorUI >> connectPresenters [
	button action: [ sensor stop ]
]

{ #category : #TOREMOVE }
SMDHeartRateSensorUI >> initialExtent [
	^ 200 @ 100
]

{ #category : #initialization }
SMDHeartRateSensorUI >> initializePresenters [
	button := self newButton.
	button label: 'Turn Off'.
	
	label := self newLabel.

]

{ #category : #accessing }
SMDHeartRateSensorUI >> label [
	^ label
]

{ #category : #accessing }
SMDHeartRateSensorUI >> lastSample: sample [
	label label: ('BPM: {1}' format: {sample beatsPerMinute asString})
]

{ #category : #accessing }
SMDHeartRateSensorUI >> sensor [
	^ sensor
]

{ #category : #accessing }
SMDHeartRateSensorUI >> sensor: anObject [
	sensor := anObject
]

{ #category : #accessing }
SMDHeartRateSensorUI >> title [
	^ 'Heart rate sensor'
]
