"
I am a transient memory only data store. I do not provide any kind of persistence on my stored data. I am typically used for writing tests.
"
Class {
	#name : #SMDTransientDataStore,
	#superclass : #SMDAbstractDataStore,
	#instVars : [
		'storedEntities',
		'automaticIDCountMutex',
		'automaticIDCount'
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
SMDTransientDataStore >> generateAutomaticIDForClass: aClass [
	| result |
	automaticIDCountMutex critical: [ 
		result := automaticIDCount.
		automaticIDCount := automaticIDCount + 1.
	].
	^ result
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> getEntityWithID: entityID ifAbsent: aBlock [
	^ storedEntities at: entityID ifAbsent: aBlock
]

{ #category : #initialization }
SMDTransientDataStore >> initialize [
	super initialize.
	storedEntities := Dictionary new.
	automaticIDCountMutex := Semaphore forMutualExclusion.
	automaticIDCount := 0.
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> storeModifiedEntity: anEntity [
	storedEntities at: anEntity id put: anEntity
]
