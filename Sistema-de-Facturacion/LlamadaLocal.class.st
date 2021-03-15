Class {
	#name : #LlamadaLocal,
	#superclass : #Llamada,
	#instVars : [
		'dia',
		'horaDeInicio',
		'horaDeFinalizacion'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'intance creation' }
LlamadaLocal class >> paraElDia: unDia iniciandoALas:  unaHoraDeInicio finalizandoALas:  unaHoraDeFinalizacion [
	
	^ self new 
		initializeParaElDia: unDia 
		iniciandoALas:  unaHoraDeInicio 
		finalizandoALas: unaHoraDeFinalizacion

]

{ #category : #calculating }
LlamadaLocal >> calcularCostoCon: unSistemaDeCostosDeLlamada [ 
	
	^ unSistemaDeCostosDeLlamada costoParaElDia: dia iniciandoALas: horaDeInicio finalizandoALas: horaDeFinalizacion  
	
]

{ #category : #testing }
LlamadaLocal >> esDelDia: unDia [
	
	^ dia = unDia
]

{ #category : #testing }
LlamadaLocal >> finalizoALas: unaHoraDeFinalizacion [  

	^ horaDeFinalizacion = unaHoraDeFinalizacion 
]

{ #category : #testing }
LlamadaLocal >> inicioALas: unaHoraDeInicio [ 
	
	^ horaDeInicio = unaHoraDeInicio 
]

{ #category : #initialization }
LlamadaLocal >> initializeParaElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas:  unaHoraDeFinalizacion [

	dia := unDia.
	horaDeInicio := unaHoraDeInicio.
	horaDeFinalizacion := unaHoraDeFinalizacion
]

{ #category : #printing }
LlamadaLocal >> printOn: aStream [

	aStream
		nextPutAll: 'Llamada Local realizada el ';
		nextPutAll: dia;
		nextPutAll: ', iniciada a las ';
		print: horaDeInicio;
		nextPutAll: ' y finalizada a las ';
		print: horaDeFinalizacion
]
