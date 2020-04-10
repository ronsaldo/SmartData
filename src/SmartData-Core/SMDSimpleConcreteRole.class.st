Class {
	#name : #SMDSimpleConcreteRole,
	#superclass : #SMDConcreteRole,
	#instVars : [
		'roleEntities'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDSimpleConcreteRole class >> asConcreteRole [
	^ self uniqueInstance
]

{ #category : #'as yet unclassified' }
SMDSimpleConcreteRole class >> roleTypeName [
	^ #Simple
]

{ #category : #'as yet unclassified' }
SMDSimpleConcreteRole >> deserializeFrom: aRoleTuple [
	roleEntities := aRoleTuple second collect: [ :each | SMDEntity getWithFullID: each ]
]

{ #category : #testing }
SMDSimpleConcreteRole >> includesRole: aRole [
	roleEntities do: [ :each |
		each fullId = aRole fullId ifTrue: [ ^ true ]
	].
	^ false
]

{ #category : #accessing }
SMDSimpleConcreteRole >> roleEntities [
	^ roleEntities
]

{ #category : #accessing }
SMDSimpleConcreteRole >> roleEntities: anArray [
	roleEntities := anArray
]

{ #category : #'as yet unclassified' }
SMDSimpleConcreteRole >> serialized [
	^ { self roleTypeName . roleEntities collect: [ :each | each fullId ] }
]
