"
I represent the active transaction context. I take care of the following book keeping tasks for a transaction:

- Holding a list with the originator role of a transaction.
- Holding a list of objects accessed during the transaction.
- Holding a list of objects modified during the transaction that needs to be persisted into a data store.
- Record the attributes of modified objects.
"
Class {
	#name : #SMDAbstractTransactionContext,
	#superclass : #Object,
	#instVars : [
		'dataStore',
		'originatorConcreteRole'
	],
	#category : #'SmartData-Core-Transaction'
}

{ #category : #actions }
SMDAbstractTransactionContext >> abort [
	^ SMDTransactionAbort signal
]

{ #category : #actions }
SMDAbstractTransactionContext >> abort: message [
	^ SMDTransactionAbort signal: message
]

{ #category : #adding }
SMDAbstractTransactionContext >> addModifiedObject: anObject [
	self subclassResponsibility
]

{ #category : #actions }
SMDAbstractTransactionContext >> commit [
	^ SMDTransactionCommit signal
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> createEntity: entityClass withId: anID [
	self subclassResponsibility
]

{ #category : #accessing }
SMDAbstractTransactionContext >> dataStore [
	^ dataStore
]

{ #category : #accessing }
SMDAbstractTransactionContext >> dataStore: aDataStore [
	dataStore := aDataStore
]

{ #category : #hooks }
SMDAbstractTransactionContext >> finishTransactionRollingBackChanges [
	self subclassResponsibility
]

{ #category : #private }
SMDAbstractTransactionContext >> finishTransactionWithResult: isCommited [
	isCommited ifTrue: [
		self finishTransactionWritingChanges
	] ifFalse: [ 
		self finishTransactionRollingBackChanges
	]
]

{ #category : #hooks }
SMDAbstractTransactionContext >> finishTransactionWritingChanges [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> generateAutomaticIDForClass: aClass [
	^ dataStore generateAutomaticIDForClass: aClass
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> getEntity: entityClass withID: anID [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> getEntity: entityClass withID: anID versionID: aVersionID [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> getEntityLastStoredVersionReference: entity [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> getOrCreateEntity: entityClass withID: anID [
	self subclassResponsibility
]

{ #category : #accessing }
SMDAbstractTransactionContext >> originatorConcreteRole [
	^ originatorConcreteRole
]

{ #category : #accessing }
SMDAbstractTransactionContext >> originatorConcreteRole: aConcreteRole [
	originatorConcreteRole := aConcreteRole
]

{ #category : #accessing }
SMDAbstractTransactionContext >> performWithBlock: aBlock [
	| transactionCommited |
	transactionCommited := false.
	SMDCurrentTransactionContext value ifNotNil: [
		self error: 'Only a single active transaction is allowed.'
	].

	[ 
		SMDCurrentTransactionContext value: self.
		[
			aBlock cull: self
		] on: SMDTransactionException do: [ :e |
			transactionCommited := e isTransactionCommitSignal. 
		]
	] ensure: [ 
		SMDCurrentTransactionContext value: nil.
		self finishTransactionWithResult: transactionCommited.
	]

]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> recordEntity: entity materializationWithType: type id: id versionID: versionId [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> transactionVersionID [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractTransactionContext >> validateLastVersionReference: existentLastVersionReference forEntity: entity [
	(existentLastVersionReference isNotNil and: [
	existentLastVersionReference isLastVersionReference and: [
	existentLastVersionReference transactionContext == self ] ]) ifTrue: [ ^ existentLastVersionReference ].
	
	^ SMDLastVersionReference new
		storedVersionReference: (self getEntityLastStoredVersionReference: entity );
		transactionContext: self;
		yourself
]
