Class {
	#name : #SMDCompanyAccountingTestScenarios,
	#superclass : #TestCase,
	#instVars : [
		'dataStore',
		'founder',
		'accountant',
		'seller',
		'company'
	],
	#category : #'SmartData-Accounting-Tests'
}

{ #category : #running }
SMDCompanyAccountingTestScenarios >> setUp [
	dataStore := SMDTransientDataStore new.
	founder := dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDCompanyOwner withID: #WilliamMeds.
	
	dataStore withRole: founder doTransactionWith: [ :transaction |
		accountant := SMDCompanyAccountant getOrCreateWithID: #BobBooks.
		seller := SMDCompanySeller getOrCreateWithID: #AliceSales.

		company := SMDCompany getOrCreateWithID: #'Med Lab Supplies Inc.'.
		company
			addStaffMembers: { founder . accountant . seller }.
		transaction commit
	].
]

{ #category : #tests }
SMDCompanyAccountingTestScenarios >> testEmptyCompany [
	dataStore withRole: accountant doTransactionWith: [ :transaction |
		self assert: (company staff includes: founder).

		self assert: (company owners includes: founder).
		self assert: (company accountants includes: accountant).

		self assert: company movements isEmpty.
	].
]
