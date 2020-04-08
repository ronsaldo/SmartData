Class {
	#name : #SMDAbstractValueSlot,
	#superclass : #InstanceVariableSlot,
	#category : #'SmartData-Core-Model'
}

{ #category : #initialization }
SMDAbstractValueSlot >> createValueHolderFor: anObject [
	^ self valueHolderClass for: anObject
]

{ #category : #'code generation' }
SMDAbstractValueSlot >> emitStore: methodBuilder [
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
SMDAbstractValueSlot >> initialize: anObject [
	self write: (self createValueHolderFor: anObject) to: anObject
]

{ #category : #testing }
SMDAbstractValueSlot >> isSMDAbstractValueSlot [
	^ true
]

{ #category : #'as yet unclassified' }
SMDAbstractValueSlot >> valueHolderClass [
	^ self subclassResponsibility
]

{ #category : #'meta-object-protocol' }
SMDAbstractValueSlot >> wantsInitialization [
	^ true
]
