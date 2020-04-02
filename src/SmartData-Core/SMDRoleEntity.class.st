"
I am an entity that lives in the data store, but also as an entity can fullfill one or several roles.

Roles are used for tagging who makes data store changes, and for providing fine grained data access permissions.

"
Class {
	#name : #SMDRoleEntity,
	#superclass : #SMDEntity,
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDRoleEntity >> asConcreteRole [
	^ SMDSimpleConcreteRole new roleEntities: { self }; yourself
]
