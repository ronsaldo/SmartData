Class {
	#name : #SMDCompanySeller,
	#superclass : #SMDCompanyStaffRole,
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #adding }
SMDCompanySeller >> addToCompany: aCompany [
	super addToCompany: aCompany.
	aCompany sellers add: self.
	
]
