Class {
	#name : #SMDCollectionValue,
	#superclass : #Collection,
	#instVars : [
		'ownerHolder',
		'type'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDCollectionValue >> contentModified [
	ownerHolder contentModified
]

{ #category : #'as yet unclassified' }
SMDCollectionValue >> deserializeContentFrom: serializedValue [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDCollectionValue >> deserializeValue: serializedValue [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDCollectionValue >> elementType [
	^ type elementType
]

{ #category : #accessing }
SMDCollectionValue >> ownerHolder [
	^ ownerHolder
]

{ #category : #accessing }
SMDCollectionValue >> ownerHolder: anObject [
	ownerHolder := anObject
]

{ #category : #'as yet unclassified' }
SMDCollectionValue >> serializeValue [
	self subclassResponsibility
]

{ #category : #accessing }
SMDCollectionValue >> smdOwnerHolder: anObject [
	self ownerHolder: anObject
]

{ #category : #accessing }
SMDCollectionValue >> type [
	^ type
]

{ #category : #accessing }
SMDCollectionValue >> type: anObject [
	type := anObject
]
