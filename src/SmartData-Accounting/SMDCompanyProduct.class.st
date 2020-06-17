Class {
	#name : #SMDCompanyProduct,
	#superclass : #SMDEntity,
	#instVars : [
		'#name => SMDStringType',
		'#description => SMDStringType',
		'#unitPrice => SMDDecimalType',
		'#measurementUnit => SMDDecimalType'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #accessing }
SMDCompanyProduct >> description [
	^ description
]

{ #category : #accessing }
SMDCompanyProduct >> description: anObject [
	description := anObject
]

{ #category : #initialization }
SMDCompanyProduct >> initialize [
	super initialize.
]

{ #category : #testing }
SMDCompanyProduct >> isGoodsProduct [
	^ false
]

{ #category : #testing }
SMDCompanyProduct >> isServiceProduct [
	^ false
]

{ #category : #accessing }
SMDCompanyProduct >> measurementUnit [
	^ measurementUnit
]

{ #category : #accessing }
SMDCompanyProduct >> measurementUnit: anObject [
	measurementUnit := anObject
]

{ #category : #accessing }
SMDCompanyProduct >> name [
	^ name
]

{ #category : #accessing }
SMDCompanyProduct >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SMDCompanyProduct >> unitPrice [
	^ unitPrice
]

{ #category : #accessing }
SMDCompanyProduct >> unitPrice: anObject [
	unitPrice := anObject
]
