Extension { #name : #Array }

{ #category : #'*SmartData-Core' }
Array >> isSMDDocumentSerializationData [
	^ self allSatisfy: [ :each | each isSMDDocumentSerializationData ]
]
