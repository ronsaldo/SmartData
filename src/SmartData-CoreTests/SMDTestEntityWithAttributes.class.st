Class {
	#name : #SMDTestEntityWithAttributes,
	#superclass : #SMDEntity,
	#instVars : [
		'#name => SMDStringType',
		'#value => SMDIntegerType'
	],
	#category : #'SmartData-CoreTests'
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
