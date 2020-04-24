"
I am a transaction for an in-image only data store. I only perform basic bookkeeping tasks when writing and rolling back a transaction changes.
"
Class {
	#name : #SMDTransientDataStoreTransactionContext,
	#superclass : #SMDAbstractTransactionContext,
	#instVars : [
		'objectModificationLog',
		'loadedEntitiesDictionary',
		'transactionVersionID',
		'objectModificationSet'
	],
	#category : #'SmartData-Core-Transaction'
}

{ #category : #initialization }
SMDTransientDataStoreTransactionContext >> addModifiedObject: anObject [
	(objectModificationSet includes: anObject) ifTrue: [ ^ self ].
	
	objectModificationLog add: anObject.
	objectModificationSet add: anObject.
]

{ #category : #'as yet unclassified' }
SMDTransientDataStoreTransactionContext >> createEntity: entityClass withId: anID [
	| newEntity |
	newEntity := entityClass basicNew initializeWithId: anID.
	self addModifiedObject: newEntity.
	^ newEntity
]

{ #category : #hooks }
SMDTransientDataStoreTransactionContext >> finishTransactionRollingBackChanges [
	"TODO: reset all of the changed objects"
	Transcript show: 'Finish rolling back transient transaction'; cr
]

{ #category : #hooks }
SMDTransientDataStoreTransactionContext >> finishTransactionWritingChanges [
	objectModificationLog do: [ :each |
		dataStore storeModifiedEntity: each
	].
]

{ #category : #'as yet unclassified' }
SMDTransientDataStoreTransactionContext >> getEntity: entityClass withID: anID [
	| fullId lastVersionId |
	fullId := { entityClass entityTypeName . anID}.
	^ loadedEntitiesDictionary at: fullId ifAbsentPut: [
		lastVersionId := dataStore getEntityLastVersionForID: fullId.
		lastVersionId ifNil: [
			self error: 'Failed to find a required entity in the database.'
		].
		
		self getEntity: entityClass withID: anID versionID: lastVersionId
	]
]

{ #category : #'as yet unclassified' }
SMDTransientDataStoreTransactionContext >> getEntity: entityClass withID: anID versionID: aVersionID [
	^ loadedEntitiesDictionary at: { entityClass entityTypeName . anID . aVersionID } ifAbsentPut: [
		dataStore getEntityWithID: { entityClass entityTypeName . anID} versionID: aVersionID ifAbsent: [
			self error: 'Failed to find a required entity in the database.'
		]
	]
]

{ #category : #initialization }
SMDTransientDataStoreTransactionContext >> initialize [
	super initialize.
	loadedEntitiesDictionary := Dictionary new.
	objectModificationLog := OrderedCollection new.
	objectModificationSet := IdentitySet new.
]

{ #category : #accessing }
SMDTransientDataStoreTransactionContext >> transactionVersionID [
	^ transactionVersionID
]

{ #category : #accessing }
SMDTransientDataStoreTransactionContext >> transactionVersionID: anObject [
	transactionVersionID := anObject
]
