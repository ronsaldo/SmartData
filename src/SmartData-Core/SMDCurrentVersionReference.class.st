Class {
	#name : #SMDCurrentVersionReference,
	#superclass : #SMDAbstractVersionReference,
	#instVars : [
		'memoryObject',
		'id'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #accessing }
SMDCurrentVersionReference >> fullId [
	^ { memoryObject fullId . self id }
]

{ #category : #accessing }
SMDCurrentVersionReference >> id [
	^ id
]

{ #category : #accessing }
SMDCurrentVersionReference >> initialize [
	super initialize.
	id := SMDCurrentTransactionContext value transactionVersionID.
]

{ #category : #testing }
SMDCurrentVersionReference >> isCurrentVersionReference [
	^ true
]

{ #category : #accessing }
SMDCurrentVersionReference >> memoryObject [
	^ memoryObject
]

{ #category : #accessing }
SMDCurrentVersionReference >> memoryObject: anObject [
	memoryObject := anObject
]

{ #category : #'as yet unclassified' }
SMDCurrentVersionReference >> retrieveIntoMemory [
	^ memoryObject
]

{ #category : #'as yet unclassified' }
SMDCurrentVersionReference >> serialized [
	^ self id
]
