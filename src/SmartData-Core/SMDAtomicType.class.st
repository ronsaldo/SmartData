"
I represent an atomic value type. I have a direct serializating.
"
Class {
	#name : #SMDAtomicType,
	#superclass : #SMDAbstractType,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDAtomicType class >> named: aSlotName [
	^ self uniqueInstance named: aSlotName
]

{ #category : #accessing }
SMDAtomicType class >> new [
	^ self error: 'Use uniqueInstance'
]

{ #category : #accessing }
SMDAtomicType class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #serialization }
SMDAtomicType >> convertFromSerialized: value [
	^ value
]

{ #category : #serialization }
SMDAtomicType >> convertToSerialize: value [
	^ value
]

{ #category : #serialization }
SMDAtomicType >> deserializeValue: value [
	^ value ifNotNil: [ self convertFromSerialized: value ]
]

{ #category : #'as yet unclassified' }
SMDAtomicType >> memberSlots [
	^ #()
]

{ #category : #accessing }
SMDAtomicType >> name [
	^ self class name
]

{ #category : #printing }
SMDAtomicType >> printOn: aStream [
	aStream nextPutAll: self class name
]

{ #category : #serialization }
SMDAtomicType >> serializeValue: value [
	^ value ifNotNil: [ self convertToSerialize: value ]
]
