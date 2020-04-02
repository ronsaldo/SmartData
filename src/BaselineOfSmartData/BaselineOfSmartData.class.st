Class {
	#name : #BaselineOfSmartData,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmartData
}

{ #category : #baselines }
BaselineOfSmartData >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec
			package: #'SmartData-Core'.
		spec
			package: #'SmartData-MedicalRecord' with: [
				spec requires: #(#'SmartData-Core')
			].
	].
]
