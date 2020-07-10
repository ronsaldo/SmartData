Class {
	#name : #SMDIndividual,
	#superclass : #SMDRoleEntity,
	#instVars : [
		'#names => SMDStringType',
		'#surnames => SMDStringType',
		'#birthDate => SMDDateType',
		'#address => SMDStringType'
	],
	#category : #'SmartData-MedicalRecord-Entities'
}

{ #category : #accessing }
SMDIndividual >> address [
	^ address
]

{ #category : #accessing }
SMDIndividual >> address: newValue [
	address := newValue
]

{ #category : #accessing }
SMDIndividual >> birthDate [
	^ birthDate
]

{ #category : #accessing }
SMDIndividual >> birthDate: newValue [
	birthDate := newValue
]

{ #category : #initialization }
SMDIndividual >> initialize [
	super initialize.
]

{ #category : #accessing }
SMDIndividual >> names [
	^ names
]

{ #category : #accessing }
SMDIndividual >> names: newValue [
	names := newValue
]

{ #category : #accessing }
SMDIndividual >> surnames [
	^ surnames
]

{ #category : #accessing }
SMDIndividual >> surnames: newValue [
	surnames := newValue
]
