Class {
	#name : #SMDCompanyAccountingTestScenarios,
	#superclass : #TestCase,
	#instVars : [
		'dataStore'
	],
	#category : #'SmartData-Accounting-Tests'
}

{ #category : #running }
SMDCompanyAccountingTestScenarios >> setUp [
	dataStore := SMDTransientDataStore new.
]
