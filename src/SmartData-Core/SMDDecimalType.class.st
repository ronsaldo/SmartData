Class {
	#name : #SMDDecimalType,
	#superclass : #SMDNumberType,
	#category : #'SmartData-Core-Model'
}

{ #category : #serialization }
SMDDecimalType >> convertFromSerialized: value [
	^ Number parse: value
]

{ #category : #serialization }
SMDDecimalType >> convertToSerialize: value [
	^ value asString
]

{ #category : #accessing }
SMDDecimalType >> name [
	^ #Decimal
]
