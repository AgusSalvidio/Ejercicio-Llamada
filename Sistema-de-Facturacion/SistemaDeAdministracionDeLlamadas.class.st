Class {
	#name : #SistemaDeAdministracionDeLlamadas,
	#superclass : #Object,
	#instVars : [
		'llamadasInternacionales',
		'llamadasNacionales',
		'llamadasLocales'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #initialization }
SistemaDeAdministracionDeLlamadas >> initialize [
 
	llamadasInternacionales := OrderedCollection new.
	llamadasNacionales := OrderedCollection new.
	llamadasLocales := OrderedCollection new
	 

]

{ #category : #accessing }
SistemaDeAdministracionDeLlamadas >> llamadasInternacionales [

	^ llamadasInternacionales
]

{ #category : #accessing }
SistemaDeAdministracionDeLlamadas >> llamadasLocales [

	^ llamadasLocales
]

{ #category : #accessing }
SistemaDeAdministracionDeLlamadas >> llamadasNacionales [

	^ llamadasNacionales
]

{ #category : #registration }
SistemaDeAdministracionDeLlamadas >> registrarLlamadaInternacionalConDestinoA: unPais [
	
	|llamadaInternacional|
	llamadaInternacional := 	LlamadaInternacional conDestinoA: unPais.
	llamadasInternacionales add: llamadaInternacional   
	
]

{ #category : #registration }
SistemaDeAdministracionDeLlamadas >> registrarLlamadaLocalParaElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFinalizacion [
	
	|llamadaLocal|
	llamadaLocal := LlamadaLocal paraElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFinalizacion.
	llamadasLocales add: llamadaLocal 
]

{ #category : #registration }
SistemaDeAdministracionDeLlamadas >> registrarLlamadaNacionalConDestinoA: unaLocalidad [
	
	|llamadaNacional|
	llamadaNacional := LlamadaNacional conDestinoA: unaLocalidad.
	llamadasNacionales add: llamadaNacional 
]
