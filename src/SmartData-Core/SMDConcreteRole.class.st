"
I represent a concrete role being performed by a RoleEntity in a particular context.
"
Class {
	#name : #SMDConcreteRole,
	#superclass : #Object,
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDConcreteRole class >> null [
	^ SMDNullConcreteRole uniqueInstance
]

{ #category : #converting }
SMDConcreteRole >> asConcreteRole [
	^ self
]

{ #category : #testing }
SMDConcreteRole >> includesRole: aRole [
	self subclassResponsibility
]
