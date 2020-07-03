Class {
	#name : #SMDValueHolder,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#instVars : [
		'type',
		'owner',
		'value'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDValueHolder class >> for: anOwner withType: type [
	^ self new type: type; owner: anOwner; yourself
]

{ #category : #accessing }
SMDValueHolder >> adaptNewValue: newValue [
	^ newValue
]

{ #category : #accessing }
SMDValueHolder >> contentModified [
	self setCurrentContextOriginatorRole.
	owner ifNotNil: [ owner contentModified ]
]

{ #category : #'as yet unclassified' }
SMDValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	originatorConcreteRole := SMDConcreteRole materializeWith: rawDeserializedValue first.
	value := type deserializeValue: rawDeserializedValue second.
	value smdOwnerHolder: self
]

{ #category : #accessing }
SMDValueHolder >> owner [
	^ owner
]

{ #category : #accessing }
SMDValueHolder >> owner: anOwner [
	owner := anOwner
]

{ #category : #'as yet unclassified' }
SMDValueHolder >> serializedField [
	^ {self originatorConcreteRole serialized . type serializeValue: self value}
]

{ #category : #accessing }
SMDValueHolder >> type [
	^ type
]

{ #category : #accessing }
SMDValueHolder >> type: aType [
	type := aType
]

{ #category : #evaluating }
SMDValueHolder >> value [
	^ value ifNil: [ value := self type createInitialValueForValueHolder: self ]
]

{ #category : #accessing }
SMDValueHolder >> value: newValue [
	value := self adaptNewValue: newValue.
	self contentModified
]
