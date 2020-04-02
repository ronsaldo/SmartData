Class {
	#name : #SMDAtomicValueHolder,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#instVars : [
		'value'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #evaluating }
SMDAtomicValueHolder >> value [
	^ value
]

{ #category : #accessing }
SMDAtomicValueHolder >> value: newValue [
	value := newValue.
	self setCurrentContextOriginatorRole.
]
