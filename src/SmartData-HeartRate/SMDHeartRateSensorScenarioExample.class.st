Class {
	#name : #SMDHeartRateSensorScenarioExample,
	#superclass : #Object,
	#category : #'SmartData-HeartRate'
}

{ #category : #examples }
SMDHeartRateSensorScenarioExample class >> exampleHeartBeatMonitoring [
	| dataStore patient son medic heartBeatSensorRole sensor |
	dataStore := SMDTransientDataStore new.

	"Create the individuals"
	patient := dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDPatient withID: #MrArrhythmia.
	son := dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDIndividual withID: #SonGrievance.
	medic := dataStore withRole: SMDSuperUserAdminRole getOrCreateRole: SMDMedic withID: #DrCardio.

	"Create the sensor role"
	dataStore withRole: medic doTransactionWith: [ :transaction |
		heartBeatSensorRole := SMDHeartRateSensor getOrCreateWithID: {patient fullId . #watch }.
		heartBeatSensorRole
			medic: medic;
			patient: patient;
			addCaringIndividual: son.
		patient addMedic: medic.
		medic addPatient: patient.
		transaction commit.
	].
	
	"Create the sensor"
	sensor := SMDHeartRateSensorProcess new
		dataStore: dataStore;
		role: heartBeatSensorRole;
		yourself.
	sensor start; openUI.

	"Create the status UI"
	SMDHeartRateStatusUI new
		dataStore: dataStore; role: son; patient: patient;
		openInWindow.
		
	"Create the medic UI"
	(SMDHeartRateMedicUI on: {dataStore . medic}) openWithSpec.
]

{ #category : #'see class side' }
SMDHeartRateSensorScenarioExample >> seeClassSide [
]
