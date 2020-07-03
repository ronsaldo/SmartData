Class {
	#name : #SMDCollectionValueHolder,
	#superclass : #SMDValueHolder,
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

{ #category : #adding }
SMDCollectionValueHolder >> remove: anElement [
	^ self value remove: anElement
]

{ #category : #accessing }
SMDCollectionValueHolder >> size [
	^ self value size
]
