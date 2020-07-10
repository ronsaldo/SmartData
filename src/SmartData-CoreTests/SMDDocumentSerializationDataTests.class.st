Class {
	#name : #SMDDocumentSerializationDataTests,
	#superclass : #TestCase,
	#category : #'SmartData-CoreTests'
}

{ #category : #'as yet unclassified' }
SMDDocumentSerializationDataTests >> testAtomValue [
	self deny: Object isSMDDocumentSerializationData.
	self assert: nil isSMDDocumentSerializationData.
	self assert: true isSMDDocumentSerializationData.
	self assert: false isSMDDocumentSerializationData.
	self assert: 'hello world' isSMDDocumentSerializationData.
	self assert: 1 isSMDDocumentSerializationData.
	self assert: -1 isSMDDocumentSerializationData.
	self assert: 42.5 isSMDDocumentSerializationData.
]

{ #category : #'as yet unclassified' }
SMDDocumentSerializationDataTests >> testCompositeValie [
	self assert: #(nil true false 1 -1) isSMDDocumentSerializationData.
	self deny: {nil . true . false . 1 . -1 . Object} isSMDDocumentSerializationData.
	self assert: (Dictionary newFromPairs: #(
		#key #test
		#value 42
	)) isSMDDocumentSerializationData.
	self deny: (Dictionary newFromPairs: {
		#key. #test.
		#value. Object.
	}) isSMDDocumentSerializationData.

	self deny: (Dictionary newFromPairs: #(
		1 #test
		#value 42
	)) isSMDDocumentSerializationData.

]
