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

{ #category : #accessing }
SMDAbstractValueHolder >> owner [
	^ owner
]

{ #category : #accessing }
SMDAbstractValueHolder >> owner: anOwner [
	owner := anOwner
]

{ #category : #evaluating }
SMDAbstractValueHolder >> value [
	^ value
]

{ #category : #accessing }
SMDAbstractValueHolder >> value: newValue [
	value := newValue.
	self setCurrentContextOriginatorRole.
]
