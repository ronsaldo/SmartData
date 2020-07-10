Class {
	#name : #SMDAccountingMajorMovement,
	#superclass : #SMDEntity,
	#instVars : [
		'#dairyBook => SMDAccountingDairyMovementBook',
		'#amount => SMDDecimalType'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #initialization }
SMDAccountingMajorMovement >> initialize [
	super initialize.
]
