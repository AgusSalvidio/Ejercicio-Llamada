"
An ImpresoraDeFacturaTest is a test class for testing the behavior of ImpresoraDeFactura
"
Class {
	#name : #ImpresoraDeFacturaTest,
	#superclass : #TestCase,
	#category : #'Sistema-de-Facturacion-Tests'
}

{ #category : #accessing }
ImpresoraDeFacturaTest >> docePM [
	
	^ Time hour: 12  minute:0  second:0 
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: Array new
		conDetalleDeLlamadasNacionales: Array new
		conDetalleDeLlamadasInternacionales: Array new
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico  
detallesDeLlamadasLocales:  unaCollecionDeDetallesDeLlamadasLocales
detallesDeLlamadasNacionales: unaCollecionDeDetallesDeLlamadasNacionales
detallesDeLlamadasInternacionales: unaCollecionDeDetallesDeLlamadasInternacionales [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: unaCollecionDeDetallesDeLlamadasLocales
		conDetalleDeLlamadasNacionales: unaCollecionDeDetallesDeLlamadasNacionales
		conDetalleDeLlamadasInternacionales: unaCollecionDeDetallesDeLlamadasInternacionales
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico unaLlamadaInternacionalA: unPais conCosto: unCosto yUnaLlamadaInternacionalA: otroPais conCosto: otroCosto [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: Array new
		conDetalleDeLlamadasNacionales: Array new
		conDetalleDeLlamadasInternacionales: (Array
				with:
					(DetalleDeLlamada
						para: (LlamadaInternacional conDestinoA: unPais)
						conCosto: unCosto)
				with:
					(DetalleDeLlamada
						para: (LlamadaInternacional conDestinoA: otroPais)
						conCosto: otroCosto))
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

{ #category : #accessing }
ImpresoraDeFacturaTest >> facturaSinLlamadasConAbonoBasicoDe: unAbonoBasico yDetallesDeLlamadasLocales: unaCollecionDeDetallesDeLlamadasLocales [

	^ Factura
		conAbonoBasico: unAbonoBasico
		conDetalleDeLlamadasLocales: unaCollecionDeDetallesDeLlamadasLocales
		conDetalleDeLlamadasNacionales: Array new
		conDetalleDeLlamadasInternacionales: Array new
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> llamadaInternacionalConDestinoA: unPais conCosto: unCosto [

	^ DetalleDeLlamada
		para: (LlamadaInternacional conDestinoA: unPais)
		conCosto: unCosto
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> llamadaNacionalConDestinoA: unaLocalidad conCosto: unCosto [

	^ DetalleDeLlamada
		para: (LlamadaNacional conDestinoA: unaLocalidad)
		conCosto: unCosto
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> llamadaParaElDia: unDia iniciandoALas: unaHoraDeInicio finalizandoALas: unaHoraDeFinalizacion conCosto: unCosto [

	^ DetalleDeLlamada
		para:
			(LlamadaLocal
				paraElDia: unDia
				iniciandoALas: unaHoraDeInicio
				finalizandoALas: unaHoraDeFinalizacion)
		conCosto: unCosto
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> ochoAM [

	^ Time hour:8  minute:0  second:0 
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> ochoYMediaPM [
	
	^ Time hour: 20  minute:30  second:0 
]

{ #category : #accessing }
ImpresoraDeFacturaTest >> sieteYMediaPM [
	
	^ Time hour: 19  minute:30  second:0 
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

{ #category : #tests }
ImpresoraDeFacturaTest >> test03_ImprimirFacturaConSoloAbonoBasicoYLlamadasInternacionales [
	
	|factura impresora facturaImpresaEsperada |
	
	factura := self facturaSinLlamadasConAbonoBasicoDe: 100 unaLlamadaInternacionalA: 'Inglaterra' conCosto: 200 yUnaLlamadaInternacionalA: 'Italia' conCosto: 100.
	impresora := ImpresoraDeFactura new.
	
	facturaImpresaEsperada := 'Factura
	Abono Básico: 100

	Detalle de Llamadas Internacionales: 300
		Llamada Internacional a Inglaterra - 200
		Llamada Internacional a Italia - 100
	Monto Total: 400'.
	
	self assert: (impresora imprimir: factura) equals: facturaImpresaEsperada 
	
]

{ #category : #tests }
ImpresoraDeFacturaTest >> test04_ImprimirFacturaConSoloAbonoBasicoYLlamadasLocales [
	
	|factura impresora facturaImpresaEsperada |
	
	factura := self facturaSinLlamadasConAbonoBasicoDe: 100 
	yDetallesDeLlamadasLocales: 
		(Array
				with:
					(self
						llamadaParaElDia: 'Lunes'
						iniciandoALas: self ochoAM
						finalizandoALas: self docePM
						conCosto: 200)
				with:
					(self
						llamadaParaElDia: 'Martes'
						iniciandoALas: self sieteYMediaPM
						finalizandoALas: self ochoYMediaPM
						conCosto: 100)).
	impresora := ImpresoraDeFactura new.
	
	facturaImpresaEsperada := 'Factura
	Abono Básico: 100

	Detalle de Llamadas Locales: 300
		Llamada Local realizada el Lunes, iniciada a las 8:00 am y finalizada a las 12:00 pm - 200
		Llamada Local realizada el Martes, iniciada a las 7:30 pm y finalizada a las 8:30 pm - 100
	Monto Total: 400'.
	
	self assert: (impresora imprimir: factura) equals: facturaImpresaEsperada 
	
]

{ #category : #tests }
ImpresoraDeFacturaTest >> test05_ImprimirFacturaConAbonoBasicoYDiferentesTiposDeLamada [

	| factura impresora facturaImpresaEsperada |

	factura := self
		facturaSinLlamadasConAbonoBasicoDe: 100
		detallesDeLlamadasLocales:
			(Array
				with:
					(self
						llamadaParaElDia: 'Lunes'
						iniciandoALas: self ochoAM
						finalizandoALas: self docePM
						conCosto: 200)
				with:
					(self
						llamadaParaElDia: 'Martes'
						iniciandoALas: self sieteYMediaPM
						finalizandoALas: self ochoYMediaPM
						conCosto: 100))
		detallesDeLlamadasNacionales:
			(Array
				with: (self llamadaNacionalConDestinoA: 'CABA' conCosto: 200)
				with: (self llamadaNacionalConDestinoA: 'Almagro' conCosto: 100))
		detallesDeLlamadasInternacionales:
			(Array
				with: (self llamadaInternacionalConDestinoA: 'Inglaterra' conCosto: 200)
				with: (self llamadaInternacionalConDestinoA: 'Italia' conCosto: 100)).
	
	impresora := ImpresoraDeFactura new.
	facturaImpresaEsperada := 'Factura
	Abono Básico: 100

	Detalle de Llamadas Locales: 300
		Llamada Local realizada el Lunes, iniciada a las 8:00 am y finalizada a las 12:00 pm - 200
		Llamada Local realizada el Martes, iniciada a las 7:30 pm y finalizada a las 8:30 pm - 100
	Detalle de Llamadas Nacionales: 300
		Llamada Nacional a CABA - 200
		Llamada Nacional a Almagro - 100
	Detalle de Llamadas Internacionales: 300
		Llamada Internacional a Inglaterra - 200
		Llamada Internacional a Italia - 100
	Monto Total: 1000'.
	self
		assert: (impresora imprimir: factura)
		equals: facturaImpresaEsperada
]
