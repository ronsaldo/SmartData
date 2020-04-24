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
SMDAbstractVersionReference >> isStoredVersionReference [
	^ false
]

{ #category : #'as yet unclassified' }
SMDAbstractVersionReference >> retrieveIntoMemory [
	^ self subclassResponsibility
]
