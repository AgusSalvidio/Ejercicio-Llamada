Class {
	#name : #LlamadaInternacional,
	#superclass : #Llamada,
	#instVars : [
		'pais'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'instance creation' }
LlamadaInternacional class >> conDestinoA: unPais [ 
	
	^ self new initializeConDestinoA: unPais
]

{ #category : #calculating }
LlamadaInternacional >> calcularCostoCon: unSistemaDeCostosDeLlamada [ 
	
	^ unSistemaDeCostosDeLlamada costoParaElPais: pais
]

{ #category : #testing }
LlamadaInternacional >> esAlDestino: unPais [ 
	
	^ pais = unPais 
]

{ #category : #initialize }
LlamadaInternacional >> initializeConDestinoA: unPais [
	
	pais := unPais
]
