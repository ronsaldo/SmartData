Class {
	#name : #SMDSetType,
	#superclass : #SMDCollectionType,
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
SMDSetType >> collectionValueClass [
	^ SMDListCollectionValue
]

{ #category : #'as yet unclassified' }
SMDSetType >> kindSelectorPrefix [
	^ #set
]
