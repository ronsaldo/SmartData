"
I am an abstract data store. I provide an abstract interface into a data store location for smart data.
"
Class {
	#name : #SMDAbstractDataStore,
	#superclass : #Object,
	#category : #'SmartData-Core-Store'
}

{ #category : #inspector }
SMDAbstractDataStore >> createTransactionContextWithConcreteRole: concreteRole [
	self subclassResponsibility
]

{ #category : #initialization }
SMDAbstractDataStore >> entitiesPerClass: aClassName [
	self subclassResponsibility
]

{ #category : #inspector }
SMDAbstractDataStore >> entityClasses [
	^ self subclassResponsibility
]

{ #category : #inspector }
SMDAbstractDataStore >> generateAutomaticIDForClass: aClass [
	self subclassResponsibility
]

{ #category : #inspector }
SMDAbstractDataStore >> gtInspectorEntitiesIn: composite [
	<gtInspectorPresentationOrder: 10>
	composite tree
		title: 'Entities';
		display: [ self entityClasses collect: [:eachClassName |
				SMDEntityClassInspectorProxy new
					dataStore: self;
					entityClassName: eachClassName;
					yourself ] ];
		children: [ :each | each gtInspectorChildren ]
]

{ #category : #inspector }
SMDAbstractDataStore >> withRole: role doTransactionWith: aBlock [
	| transactionContext |
	transactionContext := self createTransactionContextWithConcreteRole: role asConcreteRole.
	^ transactionContext performWithBlock: aBlock
]

{ #category : #inspector }
SMDAbstractDataStore >> withRole: aRole getOrCreateRole: aRoleClass withID: anID [
	| result |
	result := nil.
	self withRole: aRole doTransactionWith: [ :transaction |
		result := aRoleClass getOrCreateWithID: anID.
		transaction commit
	].

	^ result
]
