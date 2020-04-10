Class {
	#name : #SMDNullConcreteRole,
	#superclass : #SMDConcreteRole,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDNullConcreteRole class >> new [
	self error: 'You cannot directly create an instance from ew'
]

{ #category : #'as yet unclassified' }
SMDNullConcreteRole class >> roleTypeName [
	^ #Null
]

{ #category : #accessing }
SMDNullConcreteRole class >> uniqueInstance [
	^ uniqueInstance ifNil: [ self basicNew initialize
			beReadOnlyObject;
			yourself
	]
	
]

{ #category : #'as yet unclassified' }
SMDNullConcreteRole >> deserializeFrom: aRoleTuple [
	"Nothing is required here"
]

{ #category : #testing }
SMDNullConcreteRole >> includesRole: aRole [
	^ false
]

{ #category : #'as yet unclassified' }
SMDNullConcreteRole >> serialized [
	^ { self roleTypeName }
]
