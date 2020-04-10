"
I am a transaction for an in-image only data store. I only perform basic bookkeeping tasks when writing and rolling back a transaction changes.
"
Class {
	#name : #SMDTransientDataStoreTransactionContext,
	#superclass : #SMDAbstractTransactionContext,
	#instVars : [
		'objectModificationLog',
		'loadedEntitiesDictionary'
	],
	#category : #'SmartData-Core-Transaction'
}

{ #category : #'as yet unclassified' }
SMDTransientDataStoreTransactionContext >> createEntity: entityClass withId: anID [
	| newEntity |
	newEntity := entityClass basicNew initializeWithId: anID.
	objectModificationLog add: newEntity.
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
	]
]

{ #category : #'as yet unclassified' }
SMDTransientDataStoreTransactionContext >> getEntity: entityClass withID: anID [
	^ loadedEntitiesDictionary at: { entityClass entityTypeName . anID} ifAbsentPut: [
		dataStore getEntityWithID: { entityClass entityTypeName . anID} ifAbsent: [
			self error: 'Failed to find a required entity in the database.'
		]
	]
]

{ #category : #initialization }
SMDTransientDataStoreTransactionContext >> initialize [
	super initialize.
	loadedEntitiesDictionary := Dictionary new.
	objectModificationLog := OrderedCollection new.
]
