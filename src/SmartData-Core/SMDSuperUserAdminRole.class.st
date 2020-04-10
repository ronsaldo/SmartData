Class {
	#name : #SMDSuperUserAdminRole,
	#superclass : #SMDConcreteRole,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDSuperUserAdminRole class >> asConcreteRole [
	^ self uniqueInstance
]

{ #category : #'instance creation' }
SMDSuperUserAdminRole class >> new [
	self error: 'You cannot directly create an instance from ew'
]

{ #category : #'as yet unclassified' }
SMDSuperUserAdminRole class >> roleTypeName [
	^ #SuperUserAdmin
]

{ #category : #accessing }
SMDSuperUserAdminRole class >> uniqueInstance [
	^ uniqueInstance ifNil: [ self basicNew initialize
			beReadOnlyObject;
			yourself
	]
	
]

{ #category : #'as yet unclassified' }
SMDSuperUserAdminRole >> deserializeFrom: aRoleTuple [
	"Nothing is required here"
]

{ #category : #'as yet unclassified' }
SMDSuperUserAdminRole >> serialized [
	^ { self roleTypeName }
]
