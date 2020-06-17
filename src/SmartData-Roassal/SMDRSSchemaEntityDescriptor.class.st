Class {
	#name : #SMDRSSchemaEntityDescriptor,
	#superclass : #RSUMLAbstractModelDescriptor,
	#instVars : [
		'supertype',
		'name',
		'typeSlots'
	],
	#category : #'SmartData-Roassal'
}

{ #category : #public }
SMDRSSchemaEntityDescriptor >> forPharo [
	name := [:each | each name].
	supertype := [:each | each supertype].
	typeSlots := [:each | each memberSlots ].
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> name [
	^ name
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> supertype [
	^ supertype
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> supertype: anObject [
	supertype := anObject
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> typeSlots [
	^ typeSlots
]

{ #category : #accessing }
SMDRSSchemaEntityDescriptor >> typeSlots: anObject [
	typeSlots := anObject
]
