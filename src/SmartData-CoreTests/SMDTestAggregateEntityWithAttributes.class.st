Class {
	#name : #SMDTestAggregateEntityWithAttributes,
	#superclass : #SMDEntity,
	#instVars : [
		'#name => SMDStringType',
		'#mainProperty => SMDTestEntityWithAttributes',
		'#properties => SMDTestEntityWithAttributes list'
	],
	#category : #'SmartData-CoreTests'
}

{ #category : #initialization }
SMDTestAggregateEntityWithAttributes >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> mainProperty [
	^ mainProperty
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> mainProperty: anObject [
	mainProperty := anObject
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> name [
	^ name
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> properties [
	^ properties
]

{ #category : #accessing }
SMDTestAggregateEntityWithAttributes >> properties: anObject [
	properties := anObject
]
