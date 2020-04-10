Class {
	#name : #SMDAtomicValueHolder,
	#superclass : #SMDAbstractValueHolder,
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDAtomicValueHolder class >> for: anOwner [
	^ self new owner: anOwner; yourself
]

{ #category : #'as yet unclassified' }
SMDAtomicValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	originatorConcreteRole := SMDConcreteRole materializeWith: rawDeserializedValue first.
	value := rawDeserializedValue second.
]

{ #category : #'as yet unclassified' }
SMDAtomicValueHolder >> serializedField [
	^ {self originatorConcreteRole serialized . value}
]
