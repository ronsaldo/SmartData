"
I am an abstract data store. I provide an abstract interface into a data store location for smart data.
"
Class {
	#name : #SMDAbstractDataStore,
	#superclass : #Object,
	#category : #'SmartData-Core-Store'
}

{ #category : #'as yet unclassified' }
SMDAbstractDataStore >> createTransactionContextWithConcreteRole: concreteRole [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SMDAbstractDataStore >> withRole: role doTransactionWith: aBlock [
	| transactionContext |
	transactionContext := self createTransactionContextWithConcreteRole: role asConcreteRole.
	^ transactionContext performWithBlock: aBlock
]

{ #category : #'as yet unclassified' }
SMDAbstractDataStore >> withRole: aRole getOrCreateRole: aRoleClass withID: anID [
	| result |
	result := nil.
	self withRole: aRole doTransactionWith: [ :transaction |
		result := aRoleClass getOrCreateWithID: anID.
		transaction commit
	].

	^ result
]
