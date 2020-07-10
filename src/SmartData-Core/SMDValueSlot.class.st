Class {
	#name : #SMDValueSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'type'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #initialization }
SMDValueSlot >> createValueHolderFor: anObject [
	anObject isSMDEntity ifTrue: [ ^ type createValueHolderForEntity: anObject slot: self ].
	^ type createValueHolderFor: anObject slot: self
]

{ #category : #serialization }
SMDValueSlot >> deserializeValue: value [
	^ type deserializeValue: value
]

{ #category : #'code generation' }
SMDValueSlot >> emitStore: methodBuilder [
	"generate bytecode for 'baseSlot bitAt: index put: <stackTop>'"
	| tempName |
	tempName := '0slotTempForStackManipulation'.
	methodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushInstVar: index;
		pushTemp: tempName;
		send: #value:
]

{ #category : #initialization }
SMDValueSlot >> initialize: anObject [
	self write: (self createValueHolderFor: anObject) to: anObject
]

{ #category : #testing }
SMDValueSlot >> isSMDAbstractValueSlot [
	^ true
]

{ #category : #printing }
SMDValueSlot >> printOn: aStream [
	aStream print: name; nextPutAll: ' => '; print: type asValueForSlotPrinting
]

{ #category : #serialization }
SMDValueSlot >> serializeValue: value [
	^ type serializeValue: value
]

{ #category : #accessing }
SMDValueSlot >> type [
	^ type
]

{ #category : #accessing }
SMDValueSlot >> type: aSMDAbstractType [
	self assert: aSMDAbstractType isNotNil.
	type := aSMDAbstractType
]

{ #category : #'meta-object-protocol' }
SMDValueSlot >> wantsInitialization [
	^ true
]
