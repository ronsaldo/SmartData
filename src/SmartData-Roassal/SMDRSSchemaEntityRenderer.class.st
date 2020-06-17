Class {
	#name : #SMDRSSchemaEntityRenderer,
	#superclass : #RSAbstractUMLRenderer,
	#instVars : [
		'edgeBuilder',
		'marker',
		'padding',
		'typeInnerLine'
	],
	#category : #'SmartData-Roassal'
}

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> addLines: group title: title [ 
	| line rec |
	line := self typeInnerLine.
	rec := group encompassingRectangle.
	group size > 2 ifTrue: [ 
		group add: (line copy
			startPoint: rec origin x @ title height;
			endPoint: rec corner x @ title height) ].
	group size > 4 ifTrue: [ 
		group add: (line copy
			startPoint: rec origin x @ (title height + group third height);
			endPoint: rec corner x @ (title height + group third height)) ].
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> adjustBox: box on: shapes [ 
	| rect |
	rect := shapes encompassingRectangle.
	box
		extent: rect extent + self typeBoxPadding;
		position: rect floatCenter.
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> adjustTitle: title on: shapes [ 
	title position: shapes encompassingRectangle floatCenter x @ title position y.
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> applyLayoutOn: shapes [
	RSVerticalLineLayout new gapSize: 0; on: shapes.
]

{ #category : #accessing }
SMDRSSchemaEntityRenderer >> defaultEdgeBuilder [
	^ RSEdgeBuilder orthoVertical
		attachPoint: (RSVerticalAttachPoint new startOffset: 11);
		border: self border;
		markerStart: self marker;
		yourself
]

{ #category : #accessing }
SMDRSSchemaEntityRenderer >> defaultLayout [
	| defaultLayout |
	defaultLayout := RSLayoutBuilder new.
	defaultLayout tree 
		verticalGap: 50; 
		horizontalGap: 50.
	^ defaultLayout
]

{ #category : #accessing }
SMDRSSchemaEntityRenderer >> defaultMarker [
	^ RSMarker new 
		shape: (RSShapeFactory triangle
			color: Color white;
			border: self border;
			size: 20;
			yourself);
		yourself
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> defaultTypeBoxPadding [
	^ 10@10
]

{ #category : #accessing }
SMDRSSchemaEntityRenderer >> edgeBuilder [
	^ edgeBuilder ifNil: [ edgeBuilder := self defaultEdgeBuilder ]
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> groupFor: shapes [
	^ RSGroup streamContents: [ :stream |
		shapes do: [ :s | s hasChildren ifTrue: [ stream << s ] ] ]. 
]

{ #category : #accessing }
SMDRSSchemaEntityRenderer >> marker [ 
	^ marker ifNil: [ marker := self defaultMarker ]
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> shapeFor: aType [
	| shapes box title vars |
	title := self titleFor: aType.
	vars := self varsFor: aType.
	
	shapes := self groupFor: { vars }.
	shapes addFirst: title.
	box := self typeBoxShapeFor: aType.
	self applyLayoutOn: shapes.
	self adjustTitle: title on: shapes.
	
	"self createEllipsisIfNecessaryOn: shapes."
	shapes addFirst: box.
	self adjustBox: box on: shapes.
	self addLines: shapes title: title.
	^ RSComposite new
		popup;
		draggable;
		model: aType;
		shapes: shapes;
		yourself.
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> titleFor: model [
	| label |
	label := RSLabel new
		color: self textColor;
		text: (modelDescriptor name rsValue: model);
		yourself.
	label fontSize: label fontSize * 1.2.
	^ label
	
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> typeBoxPadding [
	^ padding ifNil: [ padding := self defaultTypeBoxPadding ]
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> typeBoxShapeFor: aType [
	^ RSBox new
		paint: self boxColor;
		cornerRadius: 10;
		border: self boxBorder;
		yourself
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> typeInnerLine [
	^ typeInnerLine ifNil: [
		typeInnerLine := RSLine new
			border: self border;
			yourself ]
]

{ #category : #public }
SMDRSSchemaEntityRenderer >> varFor: slot [
	^ RSLabel new
		model: slot;
		color: self textColor;
		text: slot name , ': ' , slot type name;
		yourself
]

{ #category : #hooks }
SMDRSSchemaEntityRenderer >> varsFor: model [
	| vars shapes |
	vars := modelDescriptor typeSlots rsValue: model.
	shapes := vars collect: [ :m | self varFor: m ].
	self applyLayoutOn: shapes.
	^ RSComposite new
		shapes: shapes;
		yourself
		
]
