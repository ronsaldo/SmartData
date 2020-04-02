Class {
	#name : #SMDIndividual,
	#superclass : #SMDRoleEntity,
	#instVars : [
		'names',
		'surnames',
		'birthDate',
		'address'
	],
	#category : #'SmartData-MedicalRecord-Entities'
}

{ #category : #accessing }
SMDIndividual >> address [
	^ address
]

{ #category : #accessing }
SMDIndividual >> address: newValues [
	address value: newValues.
	^ address
]

{ #category : #accessing }
SMDIndividual >> birthDate [
	^ birthDate
]

{ #category : #accessing }
SMDIndividual >> birthDate: newValue [
	birthDate value: newValue.
	^ birthDate
]

{ #category : #initialization }
SMDIndividual >> initialize [
	super initialize.
	names := SMDAtomicValueHolder new.
	surnames := SMDAtomicValueHolder new.
	address := SMDAtomicValueHolder new.
	birthDate := SMDAtomicValueHolder new.
]

{ #category : #accessing }
SMDIndividual >> names [
	^ names
]

{ #category : #accessing }
SMDIndividual >> names: newValue [
	names value: newValue.
	^ names
]

{ #category : #accessing }
SMDIndividual >> surnames [
	^ surnames
]

{ #category : #accessing }
SMDIndividual >> surnames: newValue [
	surnames value: newValue.
	^ surnames
]
