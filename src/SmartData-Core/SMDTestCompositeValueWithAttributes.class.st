Class {
	#name : #SMDTestCompositeValueWithAttributes,
	#superclass : #SMDCompositeValue,
	#instVars : [
		'#name => SMDStringType',
		'#value => SMDIntegerType'
	],
	#category : #'SmartData-Core-Tests'
}

{ #category : #initialization }
SMDTestCompositeValueWithAttributes >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
SMDTestCompositeValueWithAttributes >> name [
	^ name
]

{ #category : #accessing }
SMDTestCompositeValueWithAttributes >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SMDTestCompositeValueWithAttributes >> value [
	^ value
]

{ #category : #accessing }
SMDTestCompositeValueWithAttributes >> value: anObject [
	value := anObject
]
