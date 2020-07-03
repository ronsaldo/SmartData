Class {
	#name : #SMDCompanyOwner,
	#superclass : #SMDCompanyStaffRole,
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #adding }
SMDCompanyOwner >> addToCompany: aCompany [
	super addToCompany: aCompany.
	aCompany owners add: self.
	
]
