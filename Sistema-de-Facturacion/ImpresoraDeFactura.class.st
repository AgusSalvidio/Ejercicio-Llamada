Class {
	#name : #ImpresoraDeFactura,
	#superclass : #Object,
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #printing }
ImpresoraDeFactura >> agregarDetalleDeLlamadasNacionalesDe: unaFactura en: aStream [

	| detallesDeLlamadasNacionales |
	detallesDeLlamadasNacionales := unaFactura detallesDeLlamadasNacionales.
	detallesDeLlamadasNacionales
		ifNotEmpty: [ aStream
				tab;
				nextPutAll: 'Detalle de Llamadas Nacionales: ';
				nextPutAll: unaFactura montoTotalDeDetallesDeLlamadasNacionales asString;
				cr.
				detallesDeLlamadasNacionales do:[:detalleDeLlamada | aStream tab; tab; print: detalleDeLlamada;cr. ] ]
			
]

{ #category : #printing }
ImpresoraDeFactura >> agregarMontoTotalDe: unaFactura en: aStream [
 
	^ aStream tab ; nextPutAll: 'Monto Total: '; nextPutAll: unaFactura montoTotal asString. 
]

{ #category : #printing }
ImpresoraDeFactura >> agregarTituloYAbonoBasicoDe: unaFactura en: aStream [
	aStream
		nextPutAll:
			'Factura
	Abono Básico: ';
		nextPutAll: unaFactura abonoBasico asString;
		cr;
		cr
]

{ #category : #printing }
ImpresoraDeFactura >> imprimir: unaFactura [
	
	^ String
		streamContents: [ :aStream | 
			self 
				agregarTituloYAbonoBasicoDe: unaFactura en: aStream;
				agregarDetalleDeLlamadasNacionalesDe: unaFactura en: aStream;
				agregarMontoTotalDe: unaFactura en: aStream ]
]
