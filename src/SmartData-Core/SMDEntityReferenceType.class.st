Class {
	#name : #SMDEntityReferenceType,
	#superclass : #SMDBehaviorDerivedType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDEntityReferenceType >> deserializeValue: value [
	^ SMDEntity getWithFullVersionID: value
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
