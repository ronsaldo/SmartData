Class {
	#name : #SMDCompositeType,
	#superclass : #SMDBehaviorDerivedType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDCompositeType >> deserializeValue: value [
	value ifNil: [^ nil].
	
	^ behavior new
		deserializeCompositeValueFrom: (Dictionary newFromPairs: value);
		yourself
]

{ #category : #'as yet unclassified' }
SMDCompositeType >> memberSlots [
	^ behavior compositeFieldSlots
]

{ #category : #serialization }
SMDCompositeType >> serializeValue: value [
	^ value ifNotNil: [ value serializedCompositeValue ]
]
