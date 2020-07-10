Class {
	#name : #SMDCompany,
	#superclass : #SMDEntity,
	#instVars : [
		'#staff => SMDCompanyStaffRole set',
		'#owners => SMDCompanyOwner set',
		'#accountants => SMDCompanyAccountant set',
		'#sellers => SMDCompanySeller set',
		'#movements => SMDAccountingMovement set'
	],
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #accessing }
SMDCompany >> accountants [
	^ accountants
]

{ #category : #accessing }
SMDCompany >> accountants: anObject [
	accountants := anObject
]

{ #category : #adding }
SMDCompany >> addStaffMember: member [
	member addToCompany: self
]

{ #category : #adding }
SMDCompany >> addStaffMembers: members [
	members do: [ :each | self addStaffMember: each ]
]

{ #category : #initialization }
SMDCompany >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDCompany >> movements [
	^ movements
]

{ #category : #accessing }
SMDCompany >> movements: anObject [
	movements := anObject
]

{ #category : #accessing }
SMDCompany >> owners [
	^ owners
]

{ #category : #accessing }
SMDCompany >> owners: anObject [
	owners := anObject
]

{ #category : #accessing }
SMDCompany >> sellers [
	^ sellers
]

{ #category : #accessing }
SMDCompany >> sellers: anObject [
	sellers := anObject
]

{ #category : #accessing }
SMDCompany >> staff [
	^ staff
]

{ #category : #accessing }
SMDCompany >> staff: anObject [
	staff := anObject
]
