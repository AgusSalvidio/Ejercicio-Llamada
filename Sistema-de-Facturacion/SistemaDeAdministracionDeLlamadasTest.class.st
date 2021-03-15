"
A SistemaDeAdministracionDeLlamadasTest is a test class for testing the behavior of SistemaDeAdministracionDeLlamadas
"
Class {
	#name : #SistemaDeAdministracionDeLlamadasTest,
	#superclass : #TestCase,
	#classInstVars : [
		'llamadasNacionales'
	],
	#category : #'Sistema-de-Facturacion-Tests'
}

{ #category : #tests }
SistemaDeAdministracionDeLlamadasTest >> test01_RegistroLlamadaInternacional [

	|sistema unDestino|
	
	unDestino := 'Inglaterra'.
	sistema := SistemaDeAdministracionDeLlamadas new.
	
	self assertEmpty: sistema llamadasInternacionales.
	
	sistema registrarLlamadaInternacionalConDestinoA: unDestino.
	
	self 
		assert: sistema llamadasInternacionales size equals: 1;
		assert:(sistema llamadasInternacionales anyOne esAlDestino: unDestino)
]

{ #category : #tests }
SistemaDeAdministracionDeLlamadasTest >> test02_RegistroLlamadaNacional [

	|sistema unDestino|
	
	unDestino := 'CABA'.
	sistema := SistemaDeAdministracionDeLlamadas new.
	
	self assertEmpty: sistema llamadasNacionales.
	
	sistema registrarLlamadaNacionalConDestinoA: unDestino.
	
	self 
		assert: sistema llamadasNacionales size equals: 1;
		assert:(sistema llamadasNacionales anyOne esAlDestino: unDestino)
]

{ #category : #tests }
SistemaDeAdministracionDeLlamadasTest >> test03_RegistroLlamadaLocal [

	|sistema unDia unaHoraDeInicio unaHoraDeFinalizacion llamadaLocal|
	
	unDia := 'Lunes'.
	unaHoraDeInicio := Time hour:8 minute:0 second:0.
	unaHoraDeFinalizacion := Time hour:20 minute:0 second:0.

	sistema := SistemaDeAdministracionDeLlamadas new.
	
	self assertEmpty: sistema llamadasLocales.
	
	sistema registrarLlamadaLocalParaElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFinalizacion.
	
	self assert: sistema llamadasLocales size equals: 1.
		llamadaLocal := sistema llamadasLocales anyOne.
	self 
		assert: (llamadaLocal esDelDia:unDia);
		assert: (llamadaLocal inicioALas: unaHoraDeInicio);
		assert: (llamadaLocal finalizoALas:unaHoraDeFinalizacion).
		
]
