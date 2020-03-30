Class {
	#name : #SMDMedicalRecordTestScenarios,
	#superclass : #TestCase,
	#instVars : [
		'dataStore'
	],
	#category : #'SmartData-MedicalRecord-Tests'
}

{ #category : #running }
SMDMedicalRecordTestScenarios >> setUp [
	dataStore := SMDTransientDataStore new.
]

{ #category : #tests }
SMDMedicalRecordTestScenarios >> testPatientCreation [
	| hospital service1 service2 patient |
	hospital := self getOrCreateHospital: #Central.
	service1 := self getOrCreateHospital: hospital service: #InternMedicine.
	service2 := self getOrCreateHospital: hospital service: #Urgence.
	
	"Write a patient record."
	dataStore withRole: service1 doTransaction: [ :transaction |
		"The ID must be globally unique. If a national ID number such
		 as the chilean RUN/RUT exists, use that number".
		patient := service1 createPatientWithID: 'N1234-k'.
		patient names: 'John';
			surnames: 'Doe';
			birthDate: (Date year: 2000 month: 1 day: 1);
			address: '25 av marechal foch'.

		self assert: patient names value equals: 'John'.
		self assert: (patient names recordComesFrom: service1).
		self assert: patient surnames equals: 'Doe'.
		self assert: (patient surnames recordComesFrom: service1).
				
		transaction commit.
	].

	"Read a patient record. Transactins should be aborted by default."
	dataStore withRole: service2 doTransaction: [ :transaction |
		"The ID must be globally unique. If a national ID number such
		 as the chilean RUN/RUT exists, use that number".
		patient := service1 getPatientWithID: 'N1234-k'.
		self assert: (patient recordComesFrom: service1).

		self assert: patient names value equals: 'John'.
		self assert: (patient names recordComesFrom: service1).
		self assert: patient surnames equals: 'Doe'.
		self assert: (patient surnames recordComesFrom: service1).
	].


]
