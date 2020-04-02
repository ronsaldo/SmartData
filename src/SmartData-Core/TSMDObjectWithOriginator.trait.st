Trait {
	#name : #TSMDObjectWithOriginator,
	#instVars : [
		'originatorConcreteRole'
	],
	#category : #'SmartData-Core-Model'
}

{ #category : #'as yet unclassified' }
TSMDObjectWithOriginator >> currentValueComesFrom: aRoles [
	^ self originatorConcreteRole includesRole: aRoles
]

{ #category : #initialization }
TSMDObjectWithOriginator >> originatorConcreteRole [
	originatorConcreteRole ifNil: [ self setCurrentContextOriginatorRole ].
	^ originatorConcreteRole
]

{ #category : #initialization }
TSMDObjectWithOriginator >> setCurrentContextOriginatorRole [
	originatorConcreteRole := SMDCurrentTransactionContext value
		ifNotNil: [ :context | context originatorConcreteRole ]
		ifNil: [ SMDConcreteRole null ]
]
