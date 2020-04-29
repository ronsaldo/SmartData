Class {
	#name : #SMDEntityClassInspectorProxy,
	#superclass : #SMDObjectInspectorProxy,
	#instVars : [
		'entityClassName',
		'entities'
	],
	#category : #'SmartData-Core-Inspector'
}

{ #category : #accessing }
SMDEntityClassInspectorProxy >> entities [
	^ entities ifNil: [ entities := (dataStore entitiesPerClass: entityClassName)
			collect: [ :each | SMDEntityInspectorProxy new
					dataStore: dataStore;
					entityReference: each;
					yourself
			]
		]
]

{ #category : #accessing }
SMDEntityClassInspectorProxy >> entityClassName [
	^ entityClassName
]

{ #category : #accessing }
SMDEntityClassInspectorProxy >> entityClassName: anObject [
	entityClassName := anObject
]

{ #category : #'as yet unclassified' }
SMDEntityClassInspectorProxy >> gtInspectorChildren [
	^ self entities
]

{ #category : #'as yet unclassified' }
SMDEntityClassInspectorProxy >> printOn: aStream [
	^ aStream nextPutAll: entityClassName
]
