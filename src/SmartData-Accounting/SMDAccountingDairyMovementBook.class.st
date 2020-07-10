Class {
	#name : #SMDAccountingDairyMovementBook,
	#superclass : #SMDAccountingBook,
	#instVars : [
		'#movements => SMDAccountingMovement list'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #initialization }
SMDAccountingDairyMovementBook >> initialize [
	super initialize.
]
