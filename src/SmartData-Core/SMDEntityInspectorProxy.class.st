Class {
	#name : #SMDEntityInspectorProxy,
	#superclass : #SMDObjectInspectorProxy,
	#instVars : [
		'entity',
		'entityReference'
	],
	#category : #'SmartData-Core-Inspector'
}

{ #category : #accessing }
SMDEntityInspectorProxy >> entityReference [
	^ entityReference
]

{ #category : #accessing }
SMDEntityInspectorProxy >> entityReference: anObject [
	entityReference := anObject
]

{ #category : #'as yet unclassified' }
SMDEntityInspectorProxy >> gtInspectorChildren [
	^ #()
]

{ #category : #printing }
SMDEntityInspectorProxy >> printOn: aStream [
	aStream print: entityReference
]
