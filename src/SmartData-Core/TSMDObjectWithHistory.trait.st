Trait {
	#name : #TSMDObjectWithHistory,
	#instVars : [
		'firstVersionReference',
		'previousVersionReference',
		'currentVersionReference',
		'lastVersionReference'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #accessing }
TSMDObjectWithHistory >> currentVersion [
	^ self
]

{ #category : #accessing }
TSMDObjectWithHistory >> currentVersionReference [
	^ currentVersionReference ifNil: [ currentVersionReference := SMDCurrentVersionReference new memoryObject: self ]
]

{ #category : #'as yet unclassified' }
TSMDObjectWithHistory >> currentVersionReferenceId: theVersionId [
	currentVersionReference := SMDStoredVersionReference deserializeFor: self from: theVersionId
]

{ #category : #'as yet unclassified' }
TSMDObjectWithHistory >> deserializeHistoryFieldsFrom: dictionary [
	firstVersionReference := SMDStoredVersionReference deserializeFor: self from: (dictionary at: #firstVersion ifAbsent: [ nil ]).
	previousVersionReference := SMDStoredVersionReference deserializeFor: self from: (dictionary at: #previousVersion ifAbsent: [ nil ]).
]

{ #category : #'as yet unclassified' }
TSMDObjectWithHistory >> ensureCurrentVersionIsSelfReference [
	self currentVersionReference isCurrentVersionReference ifTrue: [ ^ self ].
	previousVersionReference := currentVersionReference.
	currentVersionReference := SMDCurrentVersionReference new memoryObject: self
]

{ #category : #accessing }
TSMDObjectWithHistory >> firstVersion [
	^ self firstVersionReference retrieveIntoMemory
]

{ #category : #accessing }
TSMDObjectWithHistory >> firstVersionReference [
	^ firstVersionReference ifNil: [ firstVersionReference := self currentVersionReference ]
]

{ #category : #accessing }
TSMDObjectWithHistory >> firstVersionReference: anObject [
	firstVersionReference := anObject
]

{ #category : #initialization }
TSMDObjectWithHistory >> initializeObjectHistory [
	self currentVersionReference
]

{ #category : #accessing }
TSMDObjectWithHistory >> lastVersion [
	^ lastVersionReference ifNotNil: [ lastVersionReference retrieveIntoMemory ]
]

{ #category : #accessing }
TSMDObjectWithHistory >> lastVersionReference [
	^ lastVersionReference
]

{ #category : #accessing }
TSMDObjectWithHistory >> lastVersionReference: anObject [
	lastVersionReference := anObject
]

{ #category : #accessing }
TSMDObjectWithHistory >> previousVersion [
	^ previousVersionReference ifNotNil: [previousVersionReference retrieveIntoMemory]
]

{ #category : #accessing }
TSMDObjectWithHistory >> previousVersionReference [
	^ previousVersionReference
]

{ #category : #accessing }
TSMDObjectWithHistory >> previousVersionReference: anObject [
	previousVersionReference := anObject.
]

{ #category : #'as yet unclassified' }
TSMDObjectWithHistory >> retriveVersionWithReference: aVersionReference [
	^ aVersionReference retrieveIntoMemory
]

{ #category : #'as yet unclassified' }
TSMDObjectWithHistory >> serializeHistoryFields [
	^ {
		#firstVersion . self firstVersionReference serialized.
		#previousVersion . self previousVersionReference ifNotNil: [ :ref | ref serialized ].
	}
]
