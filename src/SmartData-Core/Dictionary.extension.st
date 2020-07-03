Extension { #name : #Dictionary }

{ #category : #'*SmartData-Core' }
Dictionary >> isSMDDocumentSerializationData [
	self associationsDo: [ :each |
		(each key isString and: [ each value isSMDDocumentSerializationData ]) ifFalse: [
			^ false
		]
	].
	^ true
]
