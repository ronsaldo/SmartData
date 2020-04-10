"
I represent an abstract entity that lives in a data store. Entities have a globally unique id in the data store.
"
Class {
	#name : #SMDEntity,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator + TSMDObjectWithHistory',
	#classTraits : 'TSMDObjectWithOriginator classTrait + TSMDObjectWithHistory classTrait',
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
SMDEntity class >> entityFieldNames [
	^ self entityFieldSlots collect: [ :each | each name ]
]

{ #category : #'as yet unclassified' }
SMDEntity class >> entityFieldSlots [
	^ self allSlots select: [ :each | each isSMDAbstractValueSlot ]
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

{ #category : #'as yet unclassified' }
SMDEntity class >> new [
	| context |
	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #new can only be called inside the context of a transaction.'
	].

	^ self createWithID: (context generateAutomaticIDForClass: self)
]

{ #category : #'as yet unclassified' }
SMDEntity class >> serializeEntityObjectFields: anObject [
	^ Array streamContents: [ :out |
		self entityFieldSlots do: [ :eachSlot |
			out nextPut: eachSlot name; nextPut: (eachSlot read: anObject) serializedField
		]
	]
]

{ #category : #accessing }
SMDEntity >> id [
	^ id
]

{ #category : #initialization }
SMDEntity >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
SMDEntity >> initializeWithId: theId [
	id := theId.
	self initialize.
]

{ #category : #'as yet unclassified' }
SMDEntity >> serializedEntityFields [
	^ self class serializeEntityObjectFields: self
]
