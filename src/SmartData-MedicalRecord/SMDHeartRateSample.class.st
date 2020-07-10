Class {
	#name : #SMDHeartRateSample,
	#superclass : #SMDCompositeValue,
	#instVars : [
		'#timestamp => SMDDateAndTimeType',
		'#beatsPerMinute => SMDFloatType'
	],
	#category : #'SmartData-MedicalRecord-Entities'
}

{ #category : #printing }
SMDHeartRateSample >> = other [
	^ self class == other class and: [ timestamp value = other timestamp value and: [ beatsPerMinute value = other beatsPerMinute value ] ]
]

{ #category : #accessing }
SMDHeartRateSample >> beatsPerMinute [
	^ beatsPerMinute
]

{ #category : #accessing }
SMDHeartRateSample >> beatsPerMinute: anObject [
	beatsPerMinute := anObject
]

{ #category : #initialization }
SMDHeartRateSample >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #printing }
SMDHeartRateSample >> printOn: aStream [
	aStream print: timestamp value; space; print: beatsPerMinute value
]

{ #category : #accessing }
SMDHeartRateSample >> timestamp [
	^ timestamp
]

{ #category : #accessing }
SMDHeartRateSample >> timestamp: anObject [
	timestamp := anObject
]
