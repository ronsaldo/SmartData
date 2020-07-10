Class {
	#name : #SMDPatient,
	#superclass : #SMDIndividual,
	#instVars : [
		'#medics => SMDMedic set',
		'#heartRateSamples => SMDHeartRateSample set'
	],
	#category : #'SmartData-MedicalRecord-Entities'
}

{ #category : #adding }
SMDPatient >> addMedic: medic [
	medics add: medic
]

{ #category : #accessing }
SMDPatient >> heartRateSamples [
	^ heartRateSamples
]

{ #category : #accessing }
SMDPatient >> heartRateSamples: anObject [
	heartRateSamples := anObject
]

{ #category : #initialization }
SMDPatient >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDPatient >> medics [
	^ medics
]

{ #category : #accessing }
SMDPatient >> medics: anObject [
	medics := anObject
]
