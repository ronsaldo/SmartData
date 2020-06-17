Class {
	#name : #SMDRSSchemaUMLBuilder,
	#superclass : #RSUMLAbstractBuilder,
	#instVars : [
		'entities',
		'compositeTypes'
	],
	#category : #'SmartData-Roassal'
}

{ #category : #'as yet unclassified' }
SMDRSSchemaUMLBuilder class >> schemaForAllEntities [
	<script>
	| entities compositeTypes builder |
	entities := (SMDEntity allSubclasses reject: [:cls | { SMDReportEntity . SMDRoleEntity } includes: cls ]).
	compositeTypes := SMDCompositeValue allSubclasses.

	builder := SMDRSSchemaUMLBuilder new.
	builder
		entities: entities;
		compositeTypes: compositeTypes.
	builder build.
	builder canvas open
]

{ #category : #accessing }
SMDRSSchemaUMLBuilder >> compositeTypes [
	^ compositeTypes
]

{ #category : #accessing }
SMDRSSchemaUMLBuilder >> compositeTypes: anObject [
	compositeTypes := anObject
]

{ #category : #accessing }
SMDRSSchemaUMLBuilder >> entities [
	^ entities
]

{ #category : #accessing }
SMDRSSchemaUMLBuilder >> entities: anObject [
	entities := anObject
]

{ #category : #initialization }
SMDRSSchemaUMLBuilder >> initialize [
	super initialize.
	entities := #().
	compositeTypes := #().
	self
		modelDescriptor: SMDRSSchemaEntityDescriptor new;
		renderer: SMDRSSchemaEntityRenderer new
]

{ #category : #initialization }
SMDRSSchemaUMLBuilder >> objects [
	^ (entities , compositeTypes) collect: [ :each | each asSMDType ]
]

{ #category : #initialization }
SMDRSSchemaUMLBuilder >> renderIn: aCanvas [
	super renderIn: aCanvas.
	self renderer edgeBuilder
		canvas: aCanvas;
		shapes: shapes;
		connectFrom: modelDescriptor supertype.
	self layout on: shapes.
	renderer setUpCanvas: aCanvas.

]
