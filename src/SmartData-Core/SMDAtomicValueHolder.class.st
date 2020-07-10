Class {
	#name : #SMDAtomicValueHolder,
	#superclass : #SMDAbstractValueHolder,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDAtomicValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	value := type deserializeValue: rawDeserializedValue.
	value smdOwnerHolder: self
]

{ #category : #'as yet unclassified' }
SMDAtomicValueHolder >> serializedField [
	^ type serializeValue: self value
]
