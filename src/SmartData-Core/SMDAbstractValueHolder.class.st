Class {
	#name : #SMDAbstractValueHolder,
	#superclass : #Object,
	#instVars : [
		'type',
		'owner',
		'value'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDAbstractValueHolder class >> for: anOwner withType: type [
	^ self new type: type; owner: anOwner; yourself
]

{ #category : #accessing }
SMDAbstractValueHolder >> adaptNewValue: newValue [
	^ newValue
]

{ #category : #accessing }
SMDAbstractValueHolder >> contentModified [
	owner ifNotNil: [ owner contentModified ]
]

{ #category : #'as yet unclassified' }
SMDAbstractValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	self subclassResponsibility
]

{ #category : #accessing }
SMDAbstractValueHolder >> owner [
	^ owner
]

{ #category : #accessing }
SMDAbstractValueHolder >> owner: anOwner [
	owner := anOwner
]

{ #category : #'as yet unclassified' }
SMDAbstractValueHolder >> serializedField [
	self subclassResponsibility
]

{ #category : #accessing }
SMDAbstractValueHolder >> type [
	^ type
]

{ #category : #accessing }
SMDAbstractValueHolder >> type: aType [
	type := aType
]

{ #category : #'as yet unclassified' }
SMDAbstractValueHolder >> value [
	value ifNil: [ value := self type createInitialValueForValueHolder: self ].
	^ value := self type concretizeValueForRead: value
]

{ #category : #accessing }
SMDAbstractValueHolder >> value: newValue [
	value := self adaptNewValue: newValue.
	self contentModified
]
