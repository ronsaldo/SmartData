Class {
	#name : #SMDHeartRateMedicUI,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'button'
	],
	#category : #'SmartData-HeartRate'
}

{ #category : #specs }
SMDHeartRateMedicUI class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #button;
		yourself
]

{ #category : #accessing }
SMDHeartRateMedicUI >> button [
	^ button
]

{ #category : #initialization }
SMDHeartRateMedicUI >> connectPresenters [
	button action: [ self displayBPMPlot ]
]

{ #category : #initialization }
SMDHeartRateMedicUI >> dataStore [
	^ self model first
]

{ #category : #initialization }
SMDHeartRateMedicUI >> displayBPMPlot [
	| dataSet firstTimestamp lastTimestamp plt p |
	dataSet := self fetchDataSet.
	dataSet ifEmpty: [ ^ self ].
	
	firstTimestamp := dataSet first timestamp value.
	lastTimestamp := dataSet last timestamp value.

	plt := RSChart new.
	p := RSLinePlot new x: (dataSet collect: [ :each | (each timestamp value - firstTimestamp) asSeconds ]) y: (dataSet collect: [ :each | each beatsPerMinute value ]).
	plt addPlot: p;
		addDecoration: RSHorizontalTick new integer;
		addDecoration: RSVerticalTick new integer.
	plt xlabel: 'Time'.
	plt ylabel: 'BPM'.
	plt title: ('BPM during {1} seconds' format: {(lastTimestamp - firstTimestamp) asSeconds asString}).
	plt open.
]

{ #category : #initialization }
SMDHeartRateMedicUI >> fetchDataSet [
	| result |
	result := #().
	
	self dataStore withRole: self medicRole doTransactionWith: [ :transaction |
		| medic patient |	
		medic := self medicRole lastVersion.
		medic patients ifEmpty: [ transaction abort ].
		
		patient := medic patients first lastVersion.
		result := patient heartRateSamples value collect: #yourself.
	].

	^ result
]

{ #category : #TOREMOVE }
SMDHeartRateMedicUI >> initialExtent [
	^ 200 @ 50
]

{ #category : #initialization }
SMDHeartRateMedicUI >> initializePresenters [
	button := self newButton.
	button label: 'Display BPM Plot'
]

{ #category : #initialization }
SMDHeartRateMedicUI >> medicRole [
	^ self model second
]

{ #category : #initialization }
SMDHeartRateMedicUI >> title [
	^ 'Medic Heart Monitoring Dashboard'
]
