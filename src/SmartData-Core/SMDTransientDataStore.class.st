"
I am a transient memory only data store. I do not provide any kind of persistence on my stored data. I am typically used for writing tests.
"
Class {
	#name : #SMDTransientDataStore,
	#superclass : #SMDAbstractDataStore,
	#instVars : [
		'storedEntities'
	],
	#category : #'SmartData-Core-Store'
}

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> createTransactionContextWithConcreteRole: concreteRole [
	^ SMDTransientDataStoreTransactionContext new
		dataStore: self;
		originatorConcreteRole: concreteRole;
		yourself
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> getEntityWithID: entityID ifAbsent: aBlock [
	^ storedEntities at: entityID ifAbsent: aBlock
]

{ #category : #initialization }
SMDTransientDataStore >> initialize [
	super initialize.
	storedEntities := Dictionary new.
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> storeModifiedEntity: anEntity [
	storedEntities at: anEntity id put: anEntity
]
