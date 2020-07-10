Class {
	#name : #SMDCollectionValueHolder,
	#superclass : #SMDHistoricValueHolder,
	#category : #'SmartData-Core-Model'
}

{ #category : #adding }
SMDCollectionValueHolder >> add: anElement [
	^ self value add: anElement
]

{ #category : #adding }
SMDCollectionValueHolder >> addAll: elements [
	self value addAll: elements
]

{ #category : #adding }
SMDCollectionValueHolder >> all [
	^ self value
]

{ #category : #accessing }
SMDCollectionValueHolder >> first [
	^ self value first
]

{ #category : #accessing }
SMDCollectionValueHolder >> ifEmpty: aBlock [
	^ self value ifEmpty: aBlock
]

{ #category : #accessing }
SMDCollectionValueHolder >> ifNotEmpty: aBlock [
	^ self value ifNotEmpty: aBlock
]

{ #category : #adding }
SMDCollectionValueHolder >> includes: anElement [
	^ self value includes: anElement
]

{ #category : #accessing }
SMDCollectionValueHolder >> isEmpty [
	^ self value isEmpty
]

{ #category : #accessing }
SMDCollectionValueHolder >> isNotEmpty [
	^ self value isEmpty
]

{ #category : #accessing }
SMDCollectionValueHolder >> last [
	^ self value last
]

{ #category : #adding }
SMDCollectionValueHolder >> remove: anElement [
	^ self value remove: anElement
]

{ #category : #accessing }
SMDCollectionValueHolder >> second [
	^ self value second
]

{ #category : #accessing }
SMDCollectionValueHolder >> size [
	^ self value size
]
