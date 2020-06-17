Class {
	#name : #SMDBehaviorDerivedType,
	#superclass : #SMDAbstractType,
	#instVars : [
		'behavior'
	],
	#classVars : [
		'BehaviorTypeCache',
		'BehaviorTypeCacheMutex'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDBehaviorDerivedType class >> for: behavior [
	^ BehaviorTypeCacheMutex critical: [
		BehaviorTypeCache at: behavior ifAbsentPut: [ self new behavior: behavior; yourself ]
	]
]

{ #category : #'instance creation' }
SMDBehaviorDerivedType class >> initialize [
	BehaviorTypeCache := Dictionary new.
	BehaviorTypeCacheMutex := Semaphore forMutualExclusion.
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

{ #category : #accessing }
SMDBehaviorDerivedType >> name [
	^ behavior name
]
