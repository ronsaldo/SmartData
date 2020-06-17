"
I represent an abstract entity that lives in a data store. Entities have a globally unique id in the data store.
"
Class {
	#name : #SMDEntity,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator + TSMDObjectWithHistory',
	#classTraits : 'TSMDObjectWithOriginator classTrait + TSMDObjectWithHistory classTrait',
	#instVars : [
		'id',
		'isModifiedInCurrentTransaction'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDEntity class >> asSMDType [
	^ SMDEntityReferenceType for: self
]

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
SMDEntity class >> deserializeEntityObject: anObject fieldsFrom: aDictionary [
	self entityFieldSlots do: [ :eachSlot |
		(eachSlot read: anObject) deserializeFieldFrom: (aDictionary at: eachSlot name ifAbsent: [nil])
	]
]

{ #category : #'as yet unclassified' }
SMDEntity class >> entityClassFromTypeName: aTypeName [
	self flag: 'TODO: Implement myself in a proper way.'.
	self withAllSubclassesDo: [ :sc |
		sc entityTypeName = aTypeName ifTrue: [ ^ sc ]
	].

	self error: 'Entity class for type ' , aTypeName , 'is not found.'
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
SMDEntity class >> entityTypeName [
	^ self name
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
SMDEntity class >> getWithFullID: aFullID [
	| entityClass context |
	entityClass := self entityClassFromTypeName: aFullID first.

	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #getWithFullID: can only be called inside the context of a transaction.'
	].
	
	^ entityClass getWithID: aFullID second
]

{ #category : #'as yet unclassified' }
SMDEntity class >> getWithFullID: aFullID versionID: aVersionID [
	| entityClass context |
	entityClass := self entityClassFromTypeName: aFullID first.

	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #getWithFullID:versionID: can only be called inside the context of a transaction.'
	].
	
	^ entityClass getWithID: aFullID second versionID: aVersionID
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
SMDEntity class >> getWithID: anID versionID: aVersionID [
	| context |
	context := SMDCurrentTransactionContext value.
	context ifNil: [
		self error: 'SMDEntity class >> #getWithID: can only be called inside the context of a transaction.'
	].

	^ context getEntity: self withID: anID versionID: aVersionID
]

{ #category : #'as yet unclassified' }
SMDEntity class >> materializeEntityVersionId: versionId with: serializedEntity [
	| serializedEntityDictionary id type entityClass entity |
	serializedEntityDictionary := Dictionary newFromPairs: serializedEntity.
	id := serializedEntityDictionary at: #id.
	type := serializedEntityDictionary at: #type.
	entityClass := self entityClassFromTypeName: type.
	
	entity := entityClass basicNew initializeWithId: id.
	entity currentVersionReferenceId: versionId. 
	entity deserializeExtraMetaDataFrom: serializedEntityDictionary.
	entity deserializeEntityFieldsFrom: (Dictionary newFromPairs: (serializedEntityDictionary at: #fields)).
	^ entity
]

{ #category : #'instance creation' }
SMDEntity class >> named: slotName [
	^ self asSMDType named: slotName
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

{ #category : #'as yet unclassified' }
SMDEntity >> contentModified [
	isModifiedInCurrentTransaction ifTrue: [ ^ self ].
	isModifiedInCurrentTransaction := true.
	SMDCurrentTransactionContext value addModifiedObject: self.
	self setCurrentContextOriginatorRole.
	self ensureCurrentVersionIsSelfReference.
]

{ #category : #'as yet unclassified' }
SMDEntity >> deserializeEntityFieldsFrom: aDictionary [
	^ self class deserializeEntityObject: self fieldsFrom: aDictionary
]

{ #category : #'as yet unclassified' }
SMDEntity >> deserializeExtraMetaDataFrom: metadataDictionary [
	originatorConcreteRole := SMDConcreteRole materializeWith: (metadataDictionary at: #originatorConcreteRole).
	self deserializeHistoryFieldsFrom: metadataDictionary
]

{ #category : #accessing }
SMDEntity >> fullId [
	^ {self class entityTypeName . id}
]

{ #category : #accessing }
SMDEntity >> fullVersionId [
	^ self currentVersionReference fullId
]

{ #category : #accessing }
SMDEntity >> id [
	^ id
]

{ #category : #initialization }
SMDEntity >> initialize [
	
	self class initializeSlots: self.
	self initializeObjectHistory.
	isModifiedInCurrentTransaction := false.
	super initialize.
]

{ #category : #accessing }
SMDEntity >> initializeWithId: theId [
	id := theId.
	self initialize.
]

{ #category : #'as yet unclassified' }
SMDEntity >> serializedEntity [
	^ {#id . id .
		#type . self class entityTypeName.
		#originatorConcreteRole . self originatorConcreteRole serialized.
	} , self serializeHistoryFields , {
		#fields . self serializedEntityFields. 
	}
]

{ #category : #'as yet unclassified' }
SMDEntity >> serializedEntityFields [
	^ self class serializeEntityObjectFields: self
]
