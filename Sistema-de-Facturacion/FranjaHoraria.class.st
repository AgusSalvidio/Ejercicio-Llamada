Class {
	#name : #FranjaHoraria,
	#superclass : #Object,
	#instVars : [
		'dia',
		'horaDeInicio',
		'horaDeFin'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'instance creation' }
FranjaHoraria class >> durandoTodoElDia: unDia [

	^ self
		paraElDia: unDia
		iniciandoALas: (Time hour: 0 minute: 0 second: 0)
		finalizandoALas: (Time hour: 23 minute: 59 second: 59)
]

{ #category : #'instance creation' }
FranjaHoraria class >> paraElDia: unDia iniciandoALas: unaHoraDeInicio  finalizandoALas: unaHoraDeFin [ 
	
	^ self new 
	initializeParaElDia: unDia
	iniciandoALas: unaHoraDeInicio  
	finalizandoALas: unaHoraDeFin
]

{ #category : #calculating }
FranjaHoraria >> cantidadDeMinutosParaIntervaloIniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFin [
	
	^(self estanCompletamenteDentroDelIntervalo: unaHoraDeInicio y: unaHoraDeFin)
		ifTrue:[self diferenciaDeMinutosEntre: unaHoraDeFin y: unaHoraDeInicio]
		ifFalse:[(self elInicio:unaHoraDeInicio estaContenidaDentroDelIntervaloPeroNoElFin: unaHoraDeFin)
						ifTrue:[self diferenciaDeMinutosEntre: self horaDeFin y:unaHoraDeInicio]
						ifFalse:[(self elInicio:unaHoraDeInicio noEstaContenidaDentroDelIntervaloPeroSiElFin: unaHoraDeFin)
										ifTrue:[self diferenciaDeMinutosEntre: unaHoraDeFin y:self horaDeInicio]
										ifFalse:[0]]]
	
	
	
]

{ #category : #calculating }
FranjaHoraria >> diferenciaDeMinutosEntre: unaHoraDeFin  y: unaHoraDeInicio [ 
	
	^(unaHoraDeFin asDuration - unaHoraDeInicio asDuration)asMinutes ceiling
]

{ #category : #testing }
FranjaHoraria >> elInicio: unaHoraDeInicio estaContenidaDentroDelIntervaloPeroNoElFin: unaHoraDeFin [

	^ (unaHoraDeInicio between: self horaDeInicio and: self horaDeFin) and:[unaHoraDeFin >= self horaDeFin]   
]

{ #category : #testing }
FranjaHoraria >> elInicio: unaHoraDeInicio noEstaContenidaDentroDelIntervaloPeroSiElFin: unaHoraDeFin [

	 ^ unaHoraDeInicio <= self horaDeInicio and:[unaHoraDeFin between: self horaDeInicio and: self horaDeFin ] 
]

{ #category : #testing }
FranjaHoraria >> esParaElDia: unDia [
	
	^ dia = unDia.
]

{ #category : #testing }
FranjaHoraria >> esParaElDia: unDia queIniciaALas: unaHoraDeInicio queFinalizaALas: unaHoraDeFin [

	^ (self esParaElDia: unDia)
		and: [ self estanDentroDelIntervalo: unaHoraDeInicio y:unaHoraDeFin ]
	


]

{ #category : #testing }
FranjaHoraria >> estanCompletamenteDentroDelIntervalo: unaHoraDeInicio y: unaHoraDeFin [ 
	
	^ unaHoraDeInicio >= self horaDeInicio and:[unaHoraDeFin <= self horaDeFin] 
]

{ #category : #testing }
FranjaHoraria >> estanDentroDelIntervalo: unaHoraDeInicio y: unaHoraDeFin [ 
	
	^ (self estanCompletamenteDentroDelIntervalo: unaHoraDeInicio y: unaHoraDeFin) 
		or:[(self elInicio:unaHoraDeInicio estaContenidaDentroDelIntervaloPeroNoElFin: unaHoraDeFin)
			or:[self elInicio:unaHoraDeInicio noEstaContenidaDentroDelIntervaloPeroSiElFin: unaHoraDeFin]]
]

{ #category : #accessing }
FranjaHoraria >> horaDeFin [
	^ horaDeFin
]

{ #category : #accessing }
FranjaHoraria >> horaDeInicio [
	^ horaDeInicio
]

{ #category : #initialization }
FranjaHoraria >> initializeParaElDia: unDia iniciandoALas: unaHoraDeInicio  finalizandoALas: unaHoraDeFin [
 
	dia := unDia.
	horaDeInicio := unaHoraDeInicio.
	horaDeFin := unaHoraDeFin.
]
