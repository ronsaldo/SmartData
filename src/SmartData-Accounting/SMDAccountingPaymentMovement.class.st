Class {
	#name : #SMDAccountingPaymentMovement,
	#superclass : #SMDAccountingMovement,
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #testing }
SMDAccountingPaymentMovement >> isOutcome [
	^ true
]
