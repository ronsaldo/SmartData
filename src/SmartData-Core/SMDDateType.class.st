Class {
	#name : #SMDDateType,
	#superclass : #SMDEncodedAtomicType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDDateType >> convertFromSerialized: value [
	^ Date readFromString: value
]

{ #category : #serialization }
SMDDateType >> convertToSerialize: value [
	^ value yyyymmdd
]

{ #category : #accessing }
SMDDateType >> name [
	^ #Date
]
