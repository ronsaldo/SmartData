Class {
	#name : #SMDMedicalRecordTestScenarios,
	#superclass : #TestCase,
	#instVars : [
		'dataStore'
	],
	#category : #'SmartData-MedicalRecord-Tests'
}

{ #category : #'as yet unclassified' }
SMDMedicalRecordTestScenarios >> getOrCreateHospital: hospitalName [
	^ dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDHospital withID: hospitalName

]

{ #category : #'as yet unclassified' }
SMDMedicalRecordTestScenarios >> getOrCreateHospital: hospital service: serviceName [
	^ dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDHospitalService withID: {hospital . serviceName}
]

{ #category : #running }
SMDMedicalRecordTestScenarios >> setUp [
	dataStore := SMDTransientDataStore new.
]

{ #category : #tests }
SMDMedicalRecordTestScenarios >> testPatientBloodExam [
	"
	1.- A nurse is notified about a patient with a medical order for doing some blood exams.
	2.- Blood samples need to be placed into specific tubes that are coated with particular drugs that are required for the different blood exams
	3.- The lab conducts the different experiments in the samples and writes different reports.
	"
]

{ #category : #tests }
SMDMedicalRecordTestScenarios >> testPatientCheckingInTheReception [
	"
	1.- A patient goes to the reception.
	2.- The receptionist checks the patient appointment.
	3.- A bill is computed for the consultation.
	4.- The health insurance provider is asked pay some part of the bill.
	5.- The patient has to pay the part that is not paid its health insurance. Cash, debit or credit are accepted.
	6.- The patient is given a receipt and notified to wait a call to go into the medic box.
	7.- The medic is notified about its next patient.
	"
]

{ #category : #tests }
SMDMedicalRecordTestScenarios >> testPatientCreation [
	| hospital service1 service2 patient |
	hospital := self getOrCreateHospital: #Central.
	service1 := self getOrCreateHospital: hospital service: #InternMedicine.
	service2 := self getOrCreateHospital: hospital service: #Urgence.
	
	"Write a patient record."
	dataStore withRole: service1 doTransactionWith: [ :transaction |
		"The ID must be globally unique. If a national ID number such
		 as the chilean RUN/RUT exists, use that number".
		patient := SMDPatient createWithID: 'N1234-k'.
		self assert: (patient currentValueComesFrom: service1).
		patient names: 'John';
			surnames: 'Doe';
			birthDate: (Date year: 2000 month: 1 day: 1);
			address: '25 av marechal foch'.

		self assert: patient names value equals: 'John'.
		self assert: (patient names currentValueComesFrom: service1).
		self assert: patient surnames value equals: 'Doe'.
		self assert: (patient surnames currentValueComesFrom: service1).
				
		transaction commit.
	].

	"Read a patient record. Transactions should be aborted by default."
	dataStore withRole: service2 doTransactionWith: [ :transaction |
		"The ID must be globally unique. If a national ID number such
		 as the chilean RUN/RUT exists, use that number".
		patient := SMDPatient getWithID: 'N1234-k'.
		self assert: (patient currentValueComesFrom: service1).

		self assert: patient names value equals: 'John'.
		self assert: (patient names currentValueComesFrom: service1).
		self assert: patient surnames value equals: 'Doe'.
		self assert: (patient surnames currentValueComesFrom: service1).

		"Change the name, but do not commit it so the transaction is rolled back."		
		patient names: 'Mary'
	].

	dataStore withRole: service2 doTransactionWith: [ :transaction |
		patient := SMDPatient getWithID: 'N1234-k'.
		self assert: patient names value equals: 'John'.
	].
]
