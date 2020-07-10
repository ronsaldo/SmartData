Class {
	#name : #SMDCompositeValue,
	#superclass : #Object,
	#traits : 'TSMDBehaviorTypeMethods',
	#classTraits : 'TSMDBehaviorTypeMethods classTrait',
	#instVars : [
		'compositeValueOwner'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDCompositeValue class >> asSMDType [
	^ SMDCompositeType for: self
]

{ #category : #'as yet unclassified' }
SMDCompositeValue class >> compositeFieldSlots [
	^ self allSlots select: [ :each | each isSMDAbstractValueSlot ]
]

{ #category : #'as yet unclassified' }
SMDCompositeValue class >> deserializeCompositeObject: anObject fieldsFrom: aDictionary [
	self compositeFieldSlots do: [ :eachSlot |
		(eachSlot read: anObject) deserializeFieldFrom: (aDictionary at: eachSlot name ifAbsent: [nil])
	]
]

{ #category : #'as yet unclassified' }
SMDCompositeValue class >> serializeCompositeObjectFields: anObject [
	^ Array streamContents: [ :out |
		self compositeFieldSlots do: [ :eachSlot |
			out nextPut: eachSlot name; nextPut: (eachSlot read: anObject) serializedField
		]
	]
]

{ #category : #accessing }
SMDCompositeValue >> contentModified [
	compositeValueOwner ifNotNil: [ compositeValueOwner contentModified ]
]

{ #category : #'as yet unclassified' }
SMDCompositeValue >> deserializeCompositeValueFrom: aDictionary [
	^ self class deserializeCompositeObject: self fieldsFrom: aDictionary
]

{ #category : #'as yet unclassified' }
SMDCompositeValue >> serializedCompositeValue [
	^ self class serializeCompositeObjectFields: self
]

{ #category : #accessing }
SMDCompositeValue >> smdOwnerHolder: theHolder [
	compositeValueOwner := theHolder
]
