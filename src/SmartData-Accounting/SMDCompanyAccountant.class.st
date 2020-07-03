Class {
	#name : #SMDCompanyAccountant,
	#superclass : #SMDCompanyStaffRole,
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #adding }
SMDCompanyAccountant >> addToCompany: aCompany [
	super addToCompany: aCompany.
	aCompany accountants add: self.
]
