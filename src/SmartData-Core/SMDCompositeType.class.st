Class {
	#name : #SMDCompositeType,
	#superclass : #SMDBehaviorDerivedType,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDCompositeType >> memberSlots [
	^ behavior compositeFieldSlots
]
