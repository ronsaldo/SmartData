Class {
	#name : #SMDEntityReferenceType,
	#superclass : #SMDBehaviorDerivedType,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDEntityReferenceType >> memberSlots [
	^ behavior entityFieldSlots
]

{ #category : #accessing }
SMDEntityReferenceType >> name [
	^ behavior entityTypeName
]

{ #category : #accessing }
SMDEntityReferenceType >> supertype [
	behavior superclass ~~ SMDEntity ifTrue: [ ^ self class for: behavior superclass ].
	^ nil
]
