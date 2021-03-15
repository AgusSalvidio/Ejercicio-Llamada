Class {
	#name : #ImpresoraDeFactura,
	#superclass : #Object,
	#category : #'Sistema-de-Facturacion-Modelo'
}

{ #category : #printing }
ImpresoraDeFactura >> agregarDetalleDeLlamadasInternacionalesDe: unaFactura en: aStream [

	| detallesDeLlamadasInternacionales |
	detallesDeLlamadasInternacionales:= unaFactura detallesDeLlamadasInternacionales.
	detallesDeLlamadasInternacionales
		ifNotEmpty: [ aStream
				tab;
				nextPutAll: 'Detalle de Llamadas Internacionales: ';
				nextPutAll: unaFactura montoTotalDeDetallesDeLlamadasInternacionales asString;
				cr.
				detallesDeLlamadasInternacionales do:[:detalleDeLlamada | aStream tab; tab; print: detalleDeLlamada;cr. ] ]
			
]

{ #category : #printing }
ImpresoraDeFactura >> agregarDetalleDeLlamadasLocalesDe: unaFactura en: aStream [

	| detallesDeLlamadasLocales |
	detallesDeLlamadasLocales:= unaFactura detallesDeLlamadasLocales.
	detallesDeLlamadasLocales
		ifNotEmpty: [ aStream
				tab;
				nextPutAll: 'Detalle de Llamadas Locales: ';
				nextPutAll: unaFactura montoTotalDeDetallesDeLlamadasLocales asString;
				cr.
				detallesDeLlamadasLocales do:[:detalleDeLlamada | aStream tab; tab; print: detalleDeLlamada;cr. ] ]
]

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
				agregarDetalleDeLlamadasLocalesDe: unaFactura en: aStream;
				agregarDetalleDeLlamadasNacionalesDe: unaFactura en: aStream;
				agregarDetalleDeLlamadasInternacionalesDe: unaFactura en: aStream;
				agregarMontoTotalDe: unaFactura en: aStream ]
]
