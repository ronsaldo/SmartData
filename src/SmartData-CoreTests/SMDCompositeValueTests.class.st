Class {
	#name : #SMDCompositeValueTests,
	#superclass : #TestCase,
	#category : #'SmartData-CoreTests'
}

{ #category : #tests }
SMDCompositeValueTests >> testDeserialization [
	| value |
	value := SMDTestCompositeValueWithAttributes new.
	value deserializeCompositeValueFrom: (Dictionary newFromPairs: #(
		#name 'Question'
		#value 42
	)).

	self assert: value name value equals: 'Question'.
	self assert: value name owner equals: value.

	self assert: value value value equals: 42.
	self assert: value value owner equals: value.

]

{ #category : #tests }
SMDCompositeValueTests >> testNew [
	| value |
	value := SMDTestCompositeValueWithAttributes new.
	self assert: value name value equals: nil.
	self assert: value value value equals: nil.
]

{ #category : #tests }
SMDCompositeValueTests >> testSerialization [
	| value |
	value := SMDTestCompositeValueWithAttributes new.
	value name: 'Question'; value: 42.
	self assert: value serializedCompositeValue equals: #(
		#name 'Question'
		#value 42
	).
]
