Class {
	#name : #SMDHeartRateSensorSample,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'beatsPerMinute'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #accessing }
SMDHeartRateSensorSample >> beatsPerMinute [
	^ beatsPerMinute
]

{ #category : #accessing }
SMDHeartRateSensorSample >> beatsPerMinute: anObject [
	beatsPerMinute := anObject
]

{ #category : #printing }
SMDHeartRateSensorSample >> printOn: aStream [
	aStream print: timestamp; space; print: beatsPerMinute.
]

{ #category : #accessing }
SMDHeartRateSensorSample >> timestamp [
	^ timestamp
]

{ #category : #accessing }
SMDHeartRateSensorSample >> timestamp: anObject [
	timestamp := anObject
]
