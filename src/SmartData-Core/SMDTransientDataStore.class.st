"
I am a transient memory only data store. I do not provide any kind of persistence on my stored data. I am typically used for writing tests.
"
Class {
	#name : #SMDTransientDataStore,
	#superclass : #SMDAbstractDataStore,
	#instVars : [
		'automaticIDCountMutex',
		'automaticIDCount',
		'storedEntityVersions',
		'transactionCountMutex',
		'transactionCount',
		'storedEntityLastVersion',
		'storedEntityFirstVersion'
	],
	#category : #'SmartData-Core-Store'
}

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> createTransactionContextWithConcreteRole: concreteRole [
	^ SMDTransientDataStoreTransactionContext new
		dataStore: self;
		originatorConcreteRole: concreteRole;
		transactionVersionID: self newTransactionVersionID;
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
SMDTransientDataStore >> getEntityLastVersionForID: entityID [
	^ storedEntityLastVersion at: entityID
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> getEntityWithID: entityID ifAbsent: aBlock [
	^ storedEntityLastVersion at: entityID ifPresent: [:existentVersionId |
		self getEntityWithID: entityID versionID: existentVersionId second ifAbsent: aBlock
	] ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> getEntityWithID: entityID versionID: aVersionID ifAbsent: aBlock [
	^ storedEntityVersions at: {entityID . aVersionID} ifPresent: [ :existent |
		SMDEntity materializeEntityVersionId: aVersionID with: existent
	] ifAbsent: aBlock
]

{ #category : #initialization }
SMDTransientDataStore >> initialize [
	super initialize.
	storedEntityVersions := Dictionary new.
	storedEntityFirstVersion := Dictionary new.
	storedEntityLastVersion := Dictionary new.
	automaticIDCountMutex := Semaphore forMutualExclusion.
	automaticIDCount := 0.
	transactionCountMutex := Semaphore forMutualExclusion.
	transactionCount := 0.

]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> newTransactionVersionID [
	| result |
	transactionCountMutex critical: [ 
		result := transactionCount.
		transactionCount := transactionCount + 1.
	].
	^ result
]

{ #category : #'as yet unclassified' }
SMDTransientDataStore >> storeModifiedEntity: anEntity [
	| fullId fullVersionId versionId |
	fullVersionId := anEntity fullVersionId.
	fullId := fullVersionId first.
	versionId := fullVersionId second.
	storedEntityFirstVersion at: fullId ifAbsentPut: [versionId].
	storedEntityLastVersion at: fullId put: versionId.
	storedEntityVersions at: fullVersionId put: anEntity serializedEntity.
]
