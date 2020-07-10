Class {
	#name : #SMDHeartRateSensor,
	#superclass : #SMDRoleEntity,
	#instVars : [
		'#patient => SMDPatient',
		'#medic => SMDMedic',
		'#caringIndividuals => SMDIndividual set'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #adding }
SMDHeartRateSensor >> addCaringIndividual: anIndividual [
	caringIndividuals add: anIndividual
]

{ #category : #accessing }
SMDHeartRateSensor >> caringIndividuals [
	^ caringIndividuals
]

{ #category : #initialization }
SMDHeartRateSensor >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDHeartRateSensor >> medic [
	^ medic
]

{ #category : #accessing }
SMDHeartRateSensor >> medic: anObject [
	medic := anObject
]

{ #category : #accessing }
SMDHeartRateSensor >> patient [
	^ patient
]

{ #category : #accessing }
SMDHeartRateSensor >> patient: anObject [
	patient := anObject
]
