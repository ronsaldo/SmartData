Class {
	#name : #SMDHeartBeatSensorSample,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'beatsPerMinute'
	],
	#category : #'SmartData-HeartBeat'
}

{ #category : #accessing }
SMDHeartBeatSensorSample >> beatsPerMinute [
	^ beatsPerMinute
]

{ #category : #accessing }
SMDHeartBeatSensorSample >> beatsPerMinute: anObject [
	beatsPerMinute := anObject
]

{ #category : #printing }
SMDHeartBeatSensorSample >> printOn: aStream [
	aStream print: timestamp; space; print: beatsPerMinute.
]

{ #category : #accessing }
SMDHeartBeatSensorSample >> timestamp [
	^ timestamp
]

{ #category : #accessing }
SMDHeartBeatSensorSample >> timestamp: anObject [
	timestamp := anObject
]
