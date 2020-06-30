Trait {
	#name : #TSMDBehaviorTypeMethods,
	#category : #'SmartData-Core-Model'
}

{ #category : #converting }
TSMDBehaviorTypeMethods classSide >> asSMDType [
	self explicitRequirement
]

{ #category : #'type aggregation' }
TSMDBehaviorTypeMethods classSide >> list [
	^ self asSMDType list
]

{ #category : #'type aggregation' }
TSMDBehaviorTypeMethods classSide >> listWithIndices: indexedSlotNames [
	^ self asSMDType listWithIndices: indexedSlotNames
]

{ #category : #'type aggregation' }
TSMDBehaviorTypeMethods classSide >> set [
	^ self asSMDType set
]

{ #category : #'type aggregation' }
TSMDBehaviorTypeMethods classSide >> setWithIndices: indexedSlotNames [
	^ self asSMDType setWithIndices: indexedSlotNames
]
