Class {
	#name : #SMDValueHolder,
	#superclass : #Object,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#instVars : [
		'slot',
		'owner',
		'value'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'instance creation' }
SMDValueHolder class >> for: anOwner withSlot: slot [
	^ self new slot: slot; owner: anOwner; yourself
]

{ #category : #accessing }
SMDValueHolder >> adaptNewValue: newValue [
	^ newValue
]

{ #category : #'as yet unclassified' }
SMDValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	originatorConcreteRole := SMDConcreteRole materializeWith: rawDeserializedValue first.
	value := slot deserializeValue: rawDeserializedValue second in: self.
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
	^ {self originatorConcreteRole serialized . slot serializeValue: value in: self}
]

{ #category : #accessing }
SMDValueHolder >> slot [
	^ slot
]

{ #category : #accessing }
SMDValueHolder >> slot: anObject [
	slot := anObject
]

{ #category : #evaluating }
SMDValueHolder >> value [
	^ value
]

{ #category : #accessing }
SMDValueHolder >> value: newValue [
	value := self adaptNewValue: newValue.
	self setCurrentContextOriginatorRole.
	owner ifNotNil: [ owner contentModified ]
]
