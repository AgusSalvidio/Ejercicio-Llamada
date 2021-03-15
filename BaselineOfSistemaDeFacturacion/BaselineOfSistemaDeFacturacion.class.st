Class {
	#name : #BaselineOfSistemaDeFacturacion,
	#superclass : #BaselineOf,
	#category : #BaselineOfSistemaDeFacturacion
}

{ #category : #baselines }
BaselineOfSistemaDeFacturacion >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ spec
				package: 'Sistema-de-Facturacion-Modelo';
				package: 'Sistema-de-Facturacion-Tests' with: [ spec requires: 'Sistema-de-Facturacion-Modelo' ]
			]
]

{ #category : #accessing }
BaselineOfSistemaDeFacturacion >> projectClass [

	^ MetacelloCypressBaselineProject
]
