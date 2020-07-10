Class {
	#name : #SMDEntityReferenceType,
	#superclass : #SMDBehaviorDerivedType,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDEntityReferenceType >> concretizeValueForRead: value [
	value isSMDEntity ifTrue: [ ^ value ].
	self assert: value isSMDAbstractObjectReference.
	^ value retrieveIntoMemory
]

{ #category : #serialization }
SMDEntityReferenceType >> deserializeValue: value [
	^ SMDStoredVersionReference fromFullVersionID: value
]

{ #category : #'as yet unclassified' }
SMDEntityReferenceType >> memberSlots [
	^ behavior entityFieldSlots
]

{ #category : #accessing }
SMDEntityReferenceType >> name [
	^ behavior entityTypeName
]

{ #category : #serialization }
SMDEntityReferenceType >> serializeValue: value [
	^ value ifNotNil: [ value fullVersionId ]
]

{ #category : #accessing }
SMDEntityReferenceType >> supertype [
	behavior superclass ~~ SMDEntity ifTrue: [ ^ self class for: behavior superclass ].
	^ nil
]
