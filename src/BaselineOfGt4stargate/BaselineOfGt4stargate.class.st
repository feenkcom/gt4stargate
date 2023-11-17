Class {
	#name : #BaselineOfGt4stargate,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4stargate
}

{ #category : #loading }
BaselineOfGt4stargate class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4stargate' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4stargate >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4stargate'
		]
]
