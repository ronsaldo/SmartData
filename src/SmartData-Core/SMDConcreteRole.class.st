"
I represent a concrete role being performed by a RoleEntity in a particular context.
"
Class {
	#name : #SMDConcreteRole,
	#superclass : #Object,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDConcreteRole class >> materializeWith: serializedConcreteRole [
	| roleType roleClass role |
	roleType := serializedConcreteRole first.
	roleClass := self roleClassForType: roleType.
	(roleClass respondsTo: #uniqueInstance) ifTrue: [ ^ roleClass uniqueInstance ].
	
	role := roleClass new.
	^ role deserializeFrom: serializedConcreteRole; yourself
]

{ #category : #'instance creation' }
SMDConcreteRole class >> null [
	^ SMDNullConcreteRole uniqueInstance
]

{ #category : #'as yet unclassified' }
SMDConcreteRole class >> roleClassForType: roleTypeName [
	self withAllSubclassesDo: [ :sc |
		sc roleTypeName = roleTypeName ifTrue: [ ^ sc ]
	].

	self error: 'Concrete role type is not found.'
]

{ #category : #'as yet unclassified' }
SMDConcreteRole class >> roleTypeName [
	^ nil
]

{ #category : #converting }
SMDConcreteRole >> asConcreteRole [
	^ self
]

{ #category : #'as yet unclassified' }
SMDConcreteRole >> deserializeFrom: aRoleTuple [
	self subclassResponsibility
]

{ #category : #testing }
SMDConcreteRole >> includesRole: aRole [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDConcreteRole >> roleTypeName [
	^ self class roleTypeName
]
