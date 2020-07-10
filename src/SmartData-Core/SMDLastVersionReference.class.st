Class {
	#name : #SMDLastVersionReference,
	#superclass : #SMDAbstractVersionReference,
	#instVars : [
		'transactionContext',
		'storedVersionReference'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #testing }
SMDLastVersionReference >> isLastVersionReference [
	^ true
]

{ #category : #'as yet unclassified' }
SMDLastVersionReference >> retrieveIntoMemory [
	^ storedVersionReference retrieveIntoMemory
]

{ #category : #'as yet unclassified' }
SMDLastVersionReference >> serialized [
	^ storedVersionReference serialized
]

{ #category : #accessing }
SMDLastVersionReference >> storedVersionReference [
	^ storedVersionReference
]

{ #category : #accessing }
SMDLastVersionReference >> storedVersionReference: anObject [
	storedVersionReference := anObject
]

{ #category : #accessing }
SMDLastVersionReference >> transactionContext [
	^ transactionContext
]

{ #category : #accessing }
SMDLastVersionReference >> transactionContext: anObject [
	transactionContext := anObject
]
