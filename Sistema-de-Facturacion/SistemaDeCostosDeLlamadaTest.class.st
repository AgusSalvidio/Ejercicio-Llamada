"
A SistemaDeCostosDeLlamadaTest is a test class for testing the behavior of SistemaDeCostosDeLlamada
"
Class {
	#name : #SistemaDeCostosDeLlamadaTest,
	#superclass : #TestCase,
	#category : #'Sistema-de-Facturacion-Tests'
}

{ #category : #accessing }
SistemaDeCostosDeLlamadaTest >> ochoAM [

	^ Time hour:8  minute:0  second:0 
]

{ #category : #accesing }
SistemaDeCostosDeLlamadaTest >> ochoPM [
	
	^ Time hour: 20  minute:0  second:0 
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test01_CostoParaUnPaisPreviamenteCargado [

	|sistema unPais unCosto |
	
	unPais:='Inglaterra'.
	unCosto:=(1/10).
	sistema:= SistemaDeCostosDeLlamada new.
	sistema registrarParaElPais: unPais elCosto: unCosto.
	
	self assert: (sistema costoParaElPais: unPais) equals: unCosto
	  
	  
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test02_CostoParaUnPaisNoCargadoDebeLevantarExcepcion [

	|sistema unPais unMensajeDeError|
	
	unMensajeDeError:='No se encuentra un costo para el pais Inglaterra'.
	unPais:='Inglaterra'.
	sistema:= SistemaDeCostosDeLlamada new.
	
	self should:[sistema costoParaElPais: unPais]  raise: Error  withExceptionDo: [ :error | self assert: error messageText equals: unMensajeDeError]
	  
	  
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test03_CostoParaUnaLocalidadPreviamenteCargada [

	|sistema unaLocalidad unCosto |
	
	unaLocalidad :='CABA'.
	unCosto:= 1/10.
	sistema:= SistemaDeCostosDeLlamada new.
	sistema registrarParaUnaLocalidad: unaLocalidad elCosto: unCosto.
	
	self assert: (sistema costoParaLaLocalidad: unaLocalidad) equals: unCosto
	  
	  
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test04_CostoParaUnaLocalidadNoCargadaDebeLevantarExcepcion [

	|sistema unaLocalidad unMensajeDeError|
	
	unMensajeDeError:='No se encuentra un costo para la localidad CABA'.
	unaLocalidad :='CABA'.
	sistema:= SistemaDeCostosDeLlamada new.
	
	self should:[sistema costoParaLaLocalidad: unaLocalidad ]  raise: Error  withExceptionDo: [ :error | self assert: error messageText equals: unMensajeDeError]
	  
	  
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test05_CostoParaUnDiaNoHabil [

	|sistema unCosto unDia unCostoEsperado |
	
	unCosto:= 1/10.
	unDia :='Sábado'.  	
	sistema:= SistemaDeCostosDeLlamada new.
	sistema registrarParaElDia: unDia elCostoPorMinuto: unCosto.
	"doce horas a 0.1 centavos"
	unCostoEsperado := unCosto * 12 * 60.
	 
	self assert: (sistema costoParaElDia: unDia iniciandoALas:self ochoAM finalizandoALas:self ochoPM) equals: unCostoEsperado
	  
	  
]

{ #category : #tests }
SistemaDeCostosDeLlamadaTest >> test06_CostoParaUnDiaHabilEntreUnaHoraDeInicioYUnaHoraDeFin [

	|sistema unCosto unDia horaInicio horaFin unCostoEsperado |
	
	unCosto:= 1/5.
	unDia :='Martes'.
	horaInicio := self ochoAM.
	horaFin :=  	self ochoPM.
	sistema:= SistemaDeCostosDeLlamada new.
	sistema registrarParaElDia: unDia  iniciandoALas: horaInicio finalizandoALas:horaFin elCostoPorMinuto: unCosto.
	"doce horas por 0.2 centavos"
	unCostoEsperado := unCosto * 12 * 60.
	
	self assert: (sistema costoParaElDia: unDia iniciandoALas: horaInicio finalizandoALas:horaFin ) equals: unCostoEsperado
	  
	  
]
