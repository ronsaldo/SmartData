Class {
	#name : #SMDAbstractValueHolder,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#instVars : [
		'owner',
		'value'
	],
	#category : #'SmartData-Core-Model'
}

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

{ #category : #evaluating }
SMDAbstractValueHolder >> value [
	^ value
]

{ #category : #accessing }
SMDAbstractValueHolder >> value: newValue [
	value := newValue.
	self setCurrentContextOriginatorRole.
	owner ifNotNil: [ owner contentModified ]
]
