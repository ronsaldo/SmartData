Class {
	#name : #SMDMedic,
	#superclass : #SMDIndividual,
	#instVars : [
		'#patients => SMDPatient set'
	],
	#category : #'SmartData-MedicalRecord-Entities'
}

{ #category : #adding }
SMDMedic >> addPatient: patient [
	patients add: patient
]

{ #category : #initialization }
SMDMedic >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDMedic >> patients [
	^ patients
]

{ #category : #accessing }
SMDMedic >> patients: anObject [
	patients := anObject
]
