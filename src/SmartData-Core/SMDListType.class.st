Class {
	#name : #SMDListType,
	#superclass : #SMDCollectionType,
	#instVars : [
		'indices'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDListType >> kindSelectorPrefix [
	^ #list
]
