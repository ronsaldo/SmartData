Class {
	#name : #BaselineOfSmartData,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmartData
}

{ #category : #baselines }
BaselineOfSmartData >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec baseline: 'Roassal3'with: [ 
			spec repository: 'github://ObjectProfile/Roassal3' ].

		spec
			package: #'SmartData-Core'.
		spec
			package: #'SmartData-Accounting' with: [
				spec requires: #(#'SmartData-Core')
			].
		spec
			package: #'SmartData-MedicalRecord' with: [
				spec requires: #(#'SmartData-Core')
			].
		spec
			package: #'SmartData-Roassal' with: [
				spec requires: #(#'Roassal3')
			].
	].
]
