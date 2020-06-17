Class {
	#name : #SMDCompositeValue,
	#superclass : #Object,
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
SMDCompositeValue class >> asSMDType [
	^ SMDCompositeType for: self
]

{ #category : #'as yet unclassified' }
SMDCompositeValue class >> compositeFieldSlots [
	^ self allSlots select: [ :each | each isSMDAbstractValueSlot ]
]
