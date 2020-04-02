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

{ #category : #accessing }
SMDNullConcreteRole class >> uniqueInstance [
	^ uniqueInstance ifNil: [ self basicNew initialize
			beReadOnlyObject;
			yourself
	]
	
]

{ #category : #testing }
SMDNullConcreteRole >> includesRole: aRole [
	^ false
]
