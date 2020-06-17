Class {
	#name : #SMDAccountingMovement,
	#superclass : #SMDEntity,
	#instVars : [
		'#receiptOrInvoice => SMDTaxingDocument',
		'#amount => SMDDecimalType'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #accessing }
SMDAccountingMovement >> amount [
	^ amount
]

{ #category : #accessing }
SMDAccountingMovement >> amount: anObject [
	amount := anObject
]

{ #category : #initialization }
SMDAccountingMovement >> initialize [
	super initialize.
]

{ #category : #testing }
SMDAccountingMovement >> isIncome [
	^ false
]

{ #category : #testing }
SMDAccountingMovement >> isOutcome [
	^ false
]

{ #category : #accessing }
SMDAccountingMovement >> receiptOrInvoice [
	^ receiptOrInvoice
]

{ #category : #accessing }
SMDAccountingMovement >> receiptOrInvoice: anObject [
	receiptOrInvoice := anObject
]
