Class {
	#name : #SMDBehaviorDerivedType,
	#superclass : #SMDAbstractType,
	#instVars : [
		'behavior'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDBehaviorDerivedType class >> for: behavior [
	^ self new behavior: behavior; yourself
]

{ #category : #comparing }
SMDBehaviorDerivedType >> = other [
	^ self class == other class and: [ behavior == other behavior ]
	
]

{ #category : #converting }
SMDBehaviorDerivedType >> asValueForSlotPrinting [
	^ behavior
]

{ #category : #accessing }
SMDBehaviorDerivedType >> behavior [
	^ behavior
]

{ #category : #accessing }
SMDBehaviorDerivedType >> behavior: anObject [
	behavior := anObject
]

{ #category : #comparing }
SMDBehaviorDerivedType >> hash [
	^ self class identityHash bitXor: behavior identityHash
]
