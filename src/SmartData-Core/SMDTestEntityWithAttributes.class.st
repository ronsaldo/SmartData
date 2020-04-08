Class {
	#name : #SMDTestEntityWithAttributes,
	#superclass : #SMDEntity,
	#instVars : [
		'#name => SMDAtomicValueSlot',
		'#value => SMDAtomicValueSlot'
	],
	#category : #'SmartData-Core-Tests'
}

{ #category : #initialization }
SMDTestEntityWithAttributes >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDTestEntityWithAttributes >> name [
	^ name
]

{ #category : #accessing }
SMDTestEntityWithAttributes >> name: newValue [
	name := newValue
]

{ #category : #accessing }
SMDTestEntityWithAttributes >> value [
	^ value
]

{ #category : #accessing }
SMDTestEntityWithAttributes >> value: newValue [
	value := newValue
]
