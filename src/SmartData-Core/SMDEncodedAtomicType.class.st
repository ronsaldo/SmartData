Class {
	#name : #SMDEncodedAtomicType,
	#superclass : #SMDAtomicType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDEncodedAtomicType >> convertFromSerialized: value [
	self subclassResponsibility
]

{ #category : #serialization }
SMDEncodedAtomicType >> convertToSerialize: value [
	self subclassResponsibility
]
