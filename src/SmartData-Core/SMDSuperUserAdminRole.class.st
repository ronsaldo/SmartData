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

{ #category : #accessing }
SMDSuperUserAdminRole class >> uniqueInstance [
	^ uniqueInstance ifNil: [ self basicNew initialize
			beReadOnlyObject;
			yourself
	]
	
]
