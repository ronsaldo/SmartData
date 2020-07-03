Class {
	#name : #SMDDateAndTimeType,
	#superclass : #SMDEncodedAtomicType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDDateAndTimeType >> convertFromSerialized: value [
	^ DateAndTime readFromString: value
]

{ #category : #serialization }
SMDDateAndTimeType >> convertToSerialize: value [
	^ value asStringYMDHM
]

{ #category : #accessing }
SMDDateAndTimeType >> name [
	^ #DateAndTime
]
