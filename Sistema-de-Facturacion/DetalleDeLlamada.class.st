Class {
	#name : #DetalleDeLlamada,
	#superclass : #Object,
	#instVars : [
		'llamada',
		'costo'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'instance creation' }
DetalleDeLlamada class >> para: unaLlamada conCosto: unCosto [

	^ self new initializePara: unaLlamada conCosto: unCosto
]

{ #category : #accessing }
DetalleDeLlamada >> costo [

	^ costo
]

{ #category : #initialization }
DetalleDeLlamada >> initializePara: unaLlamada conCosto: unCosto [

	llamada := unaLlamada. 
	costo := unCosto.
]

{ #category : #printing }
DetalleDeLlamada >> printOn: aStream [

	aStream
		print: llamada;
		nextPutAll: ' - ';
		nextPutAll: costo asString
]
