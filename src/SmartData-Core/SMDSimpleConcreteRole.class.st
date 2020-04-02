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

{ #category : #testing }
SMDSimpleConcreteRole >> includesRole: aRole [
	^ roleEntities includes: aRole
]

{ #category : #accessing }
SMDSimpleConcreteRole >> roleEntities [
	^ roleEntities
]

{ #category : #accessing }
SMDSimpleConcreteRole >> roleEntities: anArray [
	roleEntities := anArray
]
