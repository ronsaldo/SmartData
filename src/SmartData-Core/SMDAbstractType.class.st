"
I represent an abstract type in the smart data model schema. I am used to guarantee type integrity constraints, facilitate the specification of the data scheme, and the serialization of objects.
"
Class {
	#name : #SMDAbstractType,
	#superclass : #Object,
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDAbstractType >> asValueForSlotPrinting [
	^ self
]

{ #category : #serialization }
SMDAbstractType >> deserializeValue: value in: valueHolder [
	^ self subclassResponsibility
]

{ #category : #'type composition' }
SMDAbstractType >> list [
	^ SMDListType for: self
]

{ #category : #'type composition' }
SMDAbstractType >> listWithIndices: indexedSlotNames [
	^ SMDListType for: self indices: indexedSlotNames
]

{ #category : #'as yet unclassified' }
SMDAbstractType >> memberSlots [
	^ self subclassResponsibility
]

{ #category : #accessing }
SMDAbstractType >> name [
	self subclassResponsibility
]

{ #category : #'instance creation' }
SMDAbstractType >> named: aSlotName [
	^ (self slotClass named: aSlotName)
		type: self;
		yourself
]

{ #category : #serialization }
SMDAbstractType >> serializeValue: value in: valueHolder [
	^ self subclassResponsibility
]

{ #category : #'type composition' }
SMDAbstractType >> set [
	^ SMDSetType for: self
]

{ #category : #'type composition' }
SMDAbstractType >> setWithIndices: indexedSlotNames [
	^ SMDSetType for: self indices: indexedSlotNames
]

{ #category : #'as yet unclassified' }
SMDAbstractType >> slotClass [
	^ SMDValueSlot
]

{ #category : #accessing }
SMDAbstractType >> supertype [
	^ nil
]
