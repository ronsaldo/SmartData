Class {
	#name : #SMDCollectionType,
	#superclass : #SMDAbstractType,
	#instVars : [
		'indexedSlotNames',
		'elementType'
	],
	#classVars : [
		'CollectionTypeCache',
		'CollectionTypeCacheMutex'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDCollectionType class >> for: aBaseType [
	^ self for: aBaseType indices: #()
]

{ #category : #'instance creation' }
SMDCollectionType class >> for: aBaseType indices: indexedSlotNames [
	^ CollectionTypeCacheMutex critical: [
		| typeParameters |
		typeParameters := {self . aBaseType . indexedSlotNames}.
		CollectionTypeCache at: typeParameters ifAbsentPut: [ self new baseType: aBaseType indices: indexedSlotNames; yourself ]
	]
]

{ #category : #'class initialization' }
SMDCollectionType class >> initialize [
	CollectionTypeCache := Dictionary new.
	CollectionTypeCacheMutex := Semaphore forMutualExclusion.
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> baseType: aBaseType indices: theIndexedSlotNames [
	elementType := aBaseType.
	indexedSlotNames := theIndexedSlotNames.
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> collectionValueClass [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> createInitialValueForValueHolder: valueHolder [
	^ self collectionValueClass new
		type: self;
		smdOwnerHolder: valueHolder;
		yourself
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> createValueHolderForEntity: anObject slot: aSlot [
	^ SMDCollectionValueHolder for: anObject withType: self
]

{ #category : #serialization }
SMDCollectionType >> deserializeValue: value [
	^ self collectionValueClass new
		type: self;
		deserializeContentFrom: value;
		yourself
]

{ #category : #accessing }
SMDCollectionType >> elementType [
	^ elementType
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> kindSelectorPrefix [
	self subclassResponsibility
]

{ #category : #accessing }
SMDCollectionType >> name [
	^ ByteString streamContents: [ :out |
		out nextPutAll: elementType name; space; nextPutAll: self kindSelectorPrefix.
		indexedSlotNames ifNotEmpty: [
			out nextPutAll: 'WithIndices: '; print: indexedSlotNames asArray.
		]
	]
]

{ #category : #printing }
SMDCollectionType >> printOn: aStream [
	elementType asValueForSlotPrinting printOn: aStream.
	aStream space; nextPutAll: self kindSelectorPrefix.
	indexedSlotNames ifNotEmpty: [
		aStream nextPutAll: 'WithIndices: '; print: indexedSlotNames asArray.
	]
]

{ #category : #serialization }
SMDCollectionType >> serializeValue: value [
	^ value serializeValue
]
