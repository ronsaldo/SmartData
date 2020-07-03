Class {
	#name : #SMDCompanyStaffRole,
	#superclass : #SMDRoleEntity,
	#category : #'SmartData-Accounting-Entities'
}

{ #category : #adding }
SMDCompanyStaffRole >> addToCompany: aCompany [
	aCompany staff add: self
]
