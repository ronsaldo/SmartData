Class {
	#name : #SMDAbstractVersionReference,
	#superclass : #Object,
	#category : #'SmartData-Core-Model'
}

{ #category : #testing }
SMDAbstractVersionReference >> isCurrentVersionReference [
	^ false
]

{ #category : #testing }
SMDAbstractVersionReference >> isLastVersionReference [
	^ false
]

{ #category : #testing }
SMDAbstractVersionReference >> isSMDAbstractObjectReference [
	^ true
]

{ #category : #testing }
SMDAbstractVersionReference >> isStoredVersionReference [
	^ false
]

{ #category : #'as yet unclassified' }
SMDAbstractVersionReference >> retrieveIntoMemory [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractVersionReference >> serialized [
	self subclassResponsibility
]
