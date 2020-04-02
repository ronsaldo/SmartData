"
I represent an abstract entity that lives in a data store. Entities have a globally unique id in the data store.
"
Class {
	#name : #SMDEntity,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#instVars : [
		'id'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDEntity class >> createWithID: anID [
	| context |
	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #createWithID: can only be called inside the context of a transaction.'
	].

	^ context createEntity: self withId: anID
]

{ #category : #'as yet unclassified' }
SMDEntity class >> getOrCreateWithID: anID [
	| context |
	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #getOrCreateWithID: can only be called inside the context of a transaction.'
	].

	^ context createEntity: self withId: anID
]

{ #category : #'as yet unclassified' }
SMDEntity class >> getWithID: anID [
	| context |
	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #getWithID: can only be called inside the context of a transaction.'
	].

	^ context getEntity: self withID: anID
]

{ #category : #accessing }
SMDEntity >> id [
	^ id
]

{ #category : #accessing }
SMDEntity >> initializeWithId: theId [
	id := theId.
	self initialize.
]
