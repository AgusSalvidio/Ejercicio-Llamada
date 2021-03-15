Class {
	#name : #LlamadaNacional,
	#superclass : #Llamada,
	#instVars : [
		'localidad'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'intance creation' }
LlamadaNacional class >> conDestinoA: unaLocalidad [

	^ self new initializeConDestinoA: unaLocalidad
]

{ #category : #calculating }
LlamadaNacional >> calcularCostoCon: unSistemaDeCostosDeLlamada [
	 
	^ unSistemaDeCostosDeLlamada costoParaLaLocalidad: localidad
]

{ #category : #testing }
LlamadaNacional >> esAlDestino: unaLocalidad [ 
	^ localidad = unaLocalidad 
]

{ #category : #initialize }
LlamadaNacional >> initializeConDestinoA: unaLocalidad [  
	
	localidad:= unaLocalidad 
]

{ #category : #printing }
LlamadaNacional >> printOn: aStream [

	aStream
		nextPutAll: 'Llamada Nacional a ';
		nextPutAll: localidad
]
