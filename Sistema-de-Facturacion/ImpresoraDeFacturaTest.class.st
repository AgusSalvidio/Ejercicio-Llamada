"
An ImpresoraDeFacturaTest is a test class for testing the behavior of ImpresoraDeFactura
"
Class {
	#name : #ImpresoraDeFacturaTest,
	#superclass : #TestCase,
	#category : #'Sistema-de-Facturacion-Tests'
}

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: Array new
		conDetalleDeLlamadasNacionales: Array new
		conDetalleDeLlamadasInternacionales: Array new
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico unaLlamadaNacionalA: unaLocalidad conCosto: unCosto yUnaLlamadaNacionalA: otraLocalidad conCosto: otroCosto [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: Array new
		conDetalleDeLlamadasNacionales:
			(Array
				with:
					(DetalleDeLlamada
						para: (LlamadaNacional conDestinoA: unaLocalidad)
						conCosto: unCosto)
				with:
					(DetalleDeLlamada
						para: (LlamadaNacional conDestinoA: otraLocalidad)
						conCosto: otroCosto))
		conDetalleDeLlamadasInternacionales: Array new
]

{ #category : #tests }
ImpresoraDeFacturaTest >> test01_ImprimirFacturaConSoloAbonoBasico [
	
	|factura impresora facturaImpresaEsperada |
	
	factura := self facturaSinLlamadasConAbonoBasicoDe: 100.
	impresora := ImpresoraDeFactura new.
	
	facturaImpresaEsperada := 'Factura
	Abono Básico: 100

	Monto Total: 100'.
	
	self assert: (impresora imprimir: factura) equals: facturaImpresaEsperada 
	
]

{ #category : #tests }
ImpresoraDeFacturaTest >> test02_ImprimirFacturaConSoloAbonoBasicoYLlamadasNacionales [
	
	|factura impresora facturaImpresaEsperada |
	
	factura := self facturaSinLlamadasConAbonoBasicoDe: 100 unaLlamadaNacionalA: 'CABA' conCosto: 200 yUnaLlamadaNacionalA: 'Almagro' conCosto: 100.
	impresora := ImpresoraDeFactura new.
	
	facturaImpresaEsperada := 'Factura
	Abono Básico: 100

	Detalle de Llamadas Nacionales: 300
		Llamada Nacional a CABA - 200
		Llamada Nacional a Almagro - 100
	Monto Total: 400'.
	
	self assert: (impresora imprimir: factura) equals: facturaImpresaEsperada 
	
]
