Class {
	#name : #SMDObjectInspectorProxy,
	#superclass : #Object,
	#instVars : [
		'dataStore'
	],
	#category : #'SmartData-Core-Inspector'
}

{ #category : #accessing }
SMDObjectInspectorProxy >> dataStore [
	^ dataStore
]

{ #category : #accessing }
SMDObjectInspectorProxy >> dataStore: anObject [
	dataStore := anObject
]

{ #category : #'as yet unclassified' }
SMDObjectInspectorProxy >> gtInspectorChildren [
	^ #()
]
