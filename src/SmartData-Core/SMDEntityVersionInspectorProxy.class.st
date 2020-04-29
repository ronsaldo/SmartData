Class {
	#name : #SMDEntityVersionInspectorProxy,
	#superclass : #SMDObjectInspectorProxy,
	#instVars : [
		'entityVersionReference'
	],
	#category : #'SmartData-Core-Inspector'
}

{ #category : #accessing }
SMDEntityVersionInspectorProxy >> entityVersionReference [
	^ entityVersionReference
]

{ #category : #accessing }
SMDEntityVersionInspectorProxy >> entityVersionReference: anObject [
	entityVersionReference := anObject
]
