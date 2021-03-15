Class {
	#name : #BaselineOfSistemaDeFacturacion,
	#superclass : #Object,
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
