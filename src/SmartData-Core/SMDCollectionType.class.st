Class {
	#name : #SMDCollectionType,
	#superclass : #SMDAbstractType,
	#instVars : [
		'baseType',
		'indexedSlotNames'
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
	baseType := aBaseType.
	indexedSlotNames := theIndexedSlotNames.
]

{ #category : #'as yet unclassified' }
SMDCollectionType >> kindSelectorPrefix [
	self subclassResponsibility
]

{ #category : #printing }
SMDCollectionType >> printOn: aStream [
	baseType asValueForSlotPrinting printOn: aStream.
	aStream space; nextPutAll: self kindSelectorPrefix.
	indexedSlotNames ifNotEmpty: [
		aStream nextPutAll: 'WithIndices: '; print: indexedSlotNames asArray.
	]
]
