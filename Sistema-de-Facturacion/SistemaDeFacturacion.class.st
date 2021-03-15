Class {
	#name : #SistemaDeFacturacion,
	#superclass : #Object,
	#instVars : [
		'sistemaDeAdministracion',
		'sistemaDeCostos'
	],
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #'instance creation' }
SistemaDeFacturacion class >> generandoFacturasConLlamadasRegistradasEn: unSistemaDeAdministracionDeLlamadas
calculandoCostosCon: unSistemaDeCostosDeLlamada [ 

	^ self new 
		initializeGenerandoFacturasConLlamadasRegistradasEn: unSistemaDeAdministracionDeLlamadas 
		calculandoCostosCon: unSistemaDeCostosDeLlamada 
]

{ #category : #accessing }
SistemaDeFacturacion >> detallesDe: unaColeccionDeLlamadas [

	^ unaColeccionDeLlamadas collect: [:llamada | DetalleDeLlamada para: llamada conCosto:(llamada calcularCostoCon: sistemaDeCostos)].
]

{ #category : #calculating }
SistemaDeFacturacion >> detallesDeLlamadasInternacionales [

	^ self detallesDe: sistemaDeAdministracion llamadasInternacionales.
	
]

{ #category : #calculating }
SistemaDeFacturacion >> detallesDeLlamadasLocales [
	
	^ self detallesDe: sistemaDeAdministracion llamadasLocales.
]

{ #category : #calculating }
SistemaDeFacturacion >> detallesDeLlamadasNacionales [

	^ self detallesDe: sistemaDeAdministracion llamadasNacionales .
	
]

{ #category : #generating }
SistemaDeFacturacion >> generarFacturaCon: unAbonoBasico [
		
	^ Factura 
		conAbonoBasico: unAbonoBasico 
		conDetalleDeLlamadasLocales: self detallesDeLlamadasLocales
		conDetalleDeLlamadasNacionales: self  detallesDeLlamadasNacionales
		conDetalleDeLlamadasInternacionales: self detallesDeLlamadasInternacionales 
]

{ #category : #initialization }
SistemaDeFacturacion >> initializeGenerandoFacturasConLlamadasRegistradasEn: unSistemaDeAdministracionDeLlamadas 
calculandoCostosCon: unSistemaDeCostosDeLlamada [ 

	sistemaDeAdministracion := unSistemaDeAdministracionDeLlamadas. 
	sistemaDeCostos := unSistemaDeCostosDeLlamada 
]
