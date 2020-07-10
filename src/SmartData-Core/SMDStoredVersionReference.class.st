Class {
	#name : #SMDStoredVersionReference,
	#superclass : #SMDAbstractVersionReference,
	#instVars : [
		'id',
		'objectFullId',
		'memoryObject'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDStoredVersionReference class >> deserializeFor: objectWithHistory from: storedReference [
	storedReference ifNil: [ ^ nil ].
	^ self new deserializeFor: objectWithHistory from: storedReference
]

{ #category : #'instance creation' }
SMDStoredVersionReference class >> fromFullVersionID: value [
	^ self new fromFullVersionID: value
]

{ #category : #'as yet unclassified' }
SMDStoredVersionReference >> deserializeFor: objectWithHistory from: storedReference [
	id := storedReference.
	objectFullId := objectWithHistory fullId.
]

{ #category : #'as yet unclassified' }
SMDStoredVersionReference >> entityFullID: theEntityFullID versionID: theVersionID [
	objectFullId := theEntityFullID.
	id := theVersionID.
]

{ #category : #'as yet unclassified' }
SMDStoredVersionReference >> fromFullVersionID: theFullID [
	objectFullId := theFullID first.
	id := theFullID second.
]

{ #category : #accessing }
SMDStoredVersionReference >> fullVersionId [
	^ { objectFullId . id }
]

{ #category : #accessing }
SMDStoredVersionReference >> id [
	^ id
]

{ #category : #testing }
SMDStoredVersionReference >> isStoredVersionReference [
	^ true
]

{ #category : #'as yet unclassified' }
SMDStoredVersionReference >> retrieveIntoMemory [
	| context |
	memoryObject ifNil: [
		context := SMDCurrentTransactionContext value.
		context ifNil: [ self error: 'Cannot retrieve a previous version of a transaction when not in a transaction.' ].
		memoryObject := SMDEntity getWithFullVersionID: self fullVersionId
	].
	^ memoryObject

]

{ #category : #'as yet unclassified' }
SMDStoredVersionReference >> serialized [
	^ id
]
