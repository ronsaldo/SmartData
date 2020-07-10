Class {
	#name : #SMDListCollectionValue,
	#superclass : #SMDCollectionValue,
	#instVars : [
		'elements'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #adding }
SMDListCollectionValue >> add: anObject [
	elements add: anObject.
	self contentModified.

]

{ #category : #enumerating }
SMDListCollectionValue >> at: index [
	| concreteValue |
	concreteValue := self elementType concretizeValueForRead: (elements at: index).
	elements at: index put: concreteValue.
	^ concreteValue
]

{ #category : #'as yet unclassified' }
SMDListCollectionValue >> deserializeContentFrom: serializedValue [
	| elementType |
	elementType := self elementType.
	serializedValue do: [ :each |
		elements add: (elementType deserializeValue: each)
	].
]

{ #category : #'as yet unclassified' }
SMDListCollectionValue >> deserializeValue: serializedValue [
	| elementType |
	elementType := self elementType.
	serializedValue do: [ :each |
		elements add: (elementType deserializeValue: each)
	].
]

{ #category : #enumerating }
SMDListCollectionValue >> do: aBlock [
	1 to: elements size do: [:index |
		aBlock value: (self at: index)
	].
]

{ #category : #initialization }
SMDListCollectionValue >> initialize [
	super initialize.
	elements := OrderedCollection new.
]

{ #category : #adding }
SMDListCollectionValue >> remove: anObject [
	elements remove: anObject.
	self contentModified.
]

{ #category : #'as yet unclassified' }
SMDListCollectionValue >> serializeValue [
	| elementType |
	elementType := self elementType.
	^ (elements collect: [ :each | elementType serializeValue: each ]) asArray
]

{ #category : #enumerating }
SMDListCollectionValue >> size [
	^ elements size
]
