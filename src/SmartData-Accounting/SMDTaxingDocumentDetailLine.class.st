Class {
	#name : #SMDTaxingDocumentDetailLine,
	#superclass : #SMDCompositeValue,
	#instVars : [
		'#product => SMDCompanyProduct',
		'#quantity => SMDDecimalType'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #initialization }
SMDTaxingDocumentDetailLine >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]

{ #category : #accessing }
SMDTaxingDocumentDetailLine >> product [
	^ product
]

{ #category : #accessing }
SMDTaxingDocumentDetailLine >> product: anObject [
	product := anObject
]

{ #category : #accessing }
SMDTaxingDocumentDetailLine >> quantity [
	^ quantity
]

{ #category : #accessing }
SMDTaxingDocumentDetailLine >> quantity: anObject [
	quantity := anObject
]
