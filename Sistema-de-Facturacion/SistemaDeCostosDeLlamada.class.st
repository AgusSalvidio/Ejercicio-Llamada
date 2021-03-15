Class {
	#name : #SistemaDeCostosDeLlamada,
	#superclass : #Object,
	#instVars : [
		'costoPorPais',
		'costoPorLocalidad',
		'costoPorFranjaHoraria'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #accessing }
SistemaDeCostosDeLlamada >> costoParaElDia: unDia iniciandoALas: unaHoraDeInicio  finalizandoALas: unaHoraDeFin [  

	|franjasHorarias |
	
	franjasHorarias := 
		costoPorFranjaHoraria keys
			select:[:franjaHoraria | franjaHoraria esParaElDia: unDia queIniciaALas:unaHoraDeInicio queFinalizaALas: unaHoraDeFin].
		
	^ franjasHorarias 
		ifEmpty:[Error signal: 'No se encontró un costo para el dia ', unDia]  
		ifNotEmpty: [franjasHorarias sumNumbers: [:franjaHoraria | self costoSegun: franjaHoraria iniciandoALas:unaHoraDeInicio finalizandoALas:unaHoraDeFin]]  
]

{ #category : #accessing }
SistemaDeCostosDeLlamada >> costoParaElPais: unPais [
 
	^ costoPorPais at: unPais   ifAbsent:[Error signal:('No se encuentra un costo para el pais ' , unPais) ]   
]

{ #category : #accessing }
SistemaDeCostosDeLlamada >> costoParaLaLocalidad: unaLocalidad [ 

	^ costoPorLocalidad at: unaLocalidad ifAbsent:[Error signal:('No se encuentra un costo para la localidad ' , unaLocalidad ) ]   
]

{ #category : #calculating }
SistemaDeCostosDeLlamada >> costoSegun: unaFranjaHoraria iniciandoALas: unaHoraDeInicio  finalizandoALas: unaHoraDeFin [  
	
	|costoPorMinuto cantidadDeMinutosSegunLaFranja|
	costoPorMinuto := costoPorFranjaHoraria at:unaFranjaHoraria.
	cantidadDeMinutosSegunLaFranja:= unaFranjaHoraria cantidadDeMinutosParaIntervaloIniciandoALas:unaHoraDeInicio finalizandoALas:unaHoraDeFin. 
	^ costoPorMinuto *cantidadDeMinutosSegunLaFranja 
]

{ #category : #initialization }
SistemaDeCostosDeLlamada >> initialize [
	
	costoPorPais := Dictionary new.	
	costoPorLocalidad := Dictionary new.
	costoPorFranjaHoraria := Dictionary new.
				 

]

{ #category : #registration }
SistemaDeCostosDeLlamada >> registrarParaElDia: unDia elCostoPorMinuto: unCostoPorMinuto [
	
	|franjaHoraria|
	 franjaHoraria := FranjaHoraria durandoTodoElDia: unDia.
	costoPorFranjaHoraria at: franjaHoraria  put: unCostoPorMinuto.  
	
	 
]

{ #category : #registration }
SistemaDeCostosDeLlamada >> registrarParaElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFin elCostoPorMinuto: unCostoPorMinuto [   
	
	|franjaHoraria|
	franjaHoraria := FranjaHoraria  paraElDia: unDia iniciandoALas:unaHoraDeInicio  finalizandoALas: unaHoraDeFin.
	costoPorFranjaHoraria at:franjaHoraria put:unCostoPorMinuto. 
]

{ #category : #registration }
SistemaDeCostosDeLlamada >> registrarParaElPais: unPais elCosto: unCosto [ 

	costoPorPais at: unPais put: unCosto
]

{ #category : #registration }
SistemaDeCostosDeLlamada >> registrarParaUnaLocalidad: unaLocalidad  elCosto: unCosto [

	 costoPorLocalidad at: unaLocalidad put: unCosto 
]
