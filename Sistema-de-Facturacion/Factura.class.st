Class {
	#name : #Factura,
	#superclass : #Object,
	#instVars : [
		'abonoBasico',
		'detallesDeLlamadasLocales',
		'detallesDeLlamadasNacionales',
		'detallesDeLlamadasInternacionales'
	],
	#classInstVars : [
		'montoTotalLlamadasInternacionales'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'instance creation' }
Factura class >> conAbonoBasico: unAbonoBasico 
conDetalleDeLlamadasLocales: unaColeccionDeDetallesDeLlamadasLocales 
conDetalleDeLlamadasNacionales: unaColeccionDeDetallesDeLlamadasNacionales 
conDetalleDeLlamadasInternacionales: unaColeccionDeDetallesDeLlamadasInternacionales [ 
	
	^ self new 
		initializeConAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: unaColeccionDeDetallesDeLlamadasLocales  
		conDetalleDeLlamadasNacionales: unaColeccionDeDetallesDeLlamadasNacionales
		conDetalleDeLlamadasInternacionales: unaColeccionDeDetallesDeLlamadasInternacionales
]

{ #category : #accessing }
Factura >> abonoBasico [

	^ abonoBasico
]

{ #category : #accessing }
Factura >> cantidadLlamadasInternacionales [
	 
	^ detallesDeLlamadasInternacionales size
]

{ #category : #accessing }
Factura >> cantidadLlamadasLocales [

	^ detallesDeLlamadasLocales size
]

{ #category : #accessing }
Factura >> cantidadLlamadasNacionales [
	
	^ detallesDeLlamadasNacionales size
]

{ #category : #initialization }
Factura >> detallesDeLlamadasNacionales [

	^ detallesDeLlamadasNacionales
]

{ #category : #initialization }
Factura >> initializeConAbonoBasico: unAbonoBasico
conDetalleDeLlamadasLocales: unaColeccionDeDetalleDeLlamadasLocales  
conDetalleDeLlamadasNacionales: unaColeccionDeDetalleDeLlamadasNacionales  
conDetalleDeLlamadasInternacionales: unaColeccionDeDetalleDeLlamadasInternacionales [ 

	abonoBasico := unAbonoBasico .
	detallesDeLlamadasLocales := unaColeccionDeDetalleDeLlamadasLocales. 
	detallesDeLlamadasNacionales := unaColeccionDeDetalleDeLlamadasNacionales.
	detallesDeLlamadasInternacionales := unaColeccionDeDetalleDeLlamadasInternacionales  
]

{ #category : #accessing }
Factura >> montoTotal [

	^ abonoBasico + self montoTotalDeDetallesDeLlamadasLocales
		+ self montoTotalDeDetallesDeLlamadasNacionales
		+ self montoTotalDeDetallesDeLlamadasInternacionales
]

{ #category : #accessing }
Factura >> montoTotalDe: unaColeccionDeDetallesDeLlamadas [
	
	^ unaColeccionDeDetallesDeLlamadas sumNumbers:[:detalleDeLlamada | detalleDeLlamada costo] 
]

{ #category : #accessing }
Factura >> montoTotalDeDetallesDeLlamadasInternacionales [
	^ self montoTotalDe: detallesDeLlamadasInternacionales
]

{ #category : #accessing }
Factura >> montoTotalDeDetallesDeLlamadasLocales [
	^ self montoTotalDe: detallesDeLlamadasLocales
]

{ #category : #accessing }
Factura >> montoTotalDeDetallesDeLlamadasNacionales [
	^ self montoTotalDe: detallesDeLlamadasNacionales
]
