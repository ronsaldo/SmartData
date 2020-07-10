Class {
	#name : #SMDHistoricValueHolder,
	#superclass : #SMDAbstractValueHolder,
	#traits : 'TSMDObjectWithOriginator',
	#classTraits : 'TSMDObjectWithOriginator classTrait',
	#category : #'SmartData-Core-Model'
}

{ #category : #accessing }
SMDHistoricValueHolder >> contentModified [
	self setCurrentContextOriginatorRole.
	super contentModified.
]

{ #category : #'as yet unclassified' }
SMDHistoricValueHolder >> deserializeFieldFrom: rawDeserializedValue [
	originatorConcreteRole := SMDConcreteRole materializeWith: rawDeserializedValue first.
	value := type deserializeValue: rawDeserializedValue second.
	value smdOwnerHolder: self
]

{ #category : #'as yet unclassified' }
SMDHistoricValueHolder >> serializedField [
	^ {self originatorConcreteRole serialized . type serializeValue: self value}
]
