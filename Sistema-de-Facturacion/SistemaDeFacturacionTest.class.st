"
A SistemaDeFacturacionTest is a test class for testing the behavior of SistemaDeFacturacion
"
Class {
	#name : #SistemaDeFacturacionTest,
	#superclass : #TestCase,
	#instVars : [
		'sistemaDeAdministracion',
		'sistemaDeCostos',
		'unAbonoBasico'
	],
	#category : #'Sistema-de-Facturacion-Tests'
}

{ #category : #accessing }
SistemaDeFacturacionTest >> docePM [
	
	^ Time hour: 12  minute:0  second:0 
]

{ #category : #accessing }
SistemaDeFacturacionTest >> ochoAM [

	^ Time hour:8  minute:0  second:0 
]

{ #category : #accessing }
SistemaDeFacturacionTest >> ochoPM [
	
	^ Time hour: 20  minute:0  second:0 
]

{ #category : #accessing }
SistemaDeFacturacionTest >> ochoYMediaPM [
	
	^ Time hour: 20  minute:30  second:0 
]

{ #category : #accessing }
SistemaDeFacturacionTest >> oncePM [
	
	^ Time hour: 23  minute:0  second:0 
]

{ #category : #running }
SistemaDeFacturacionTest >> setUp [

	sistemaDeAdministracion := SistemaDeAdministracionDeLlamadas new.
	sistemaDeCostos := SistemaDeCostosDeLlamada new.
	unAbonoBasico := 100.

]

{ #category : #accessing }
SistemaDeFacturacionTest >> sieteYMediaPM [
	
	^ Time hour: 19  minute:30  second:0 
]

{ #category : #tests }
SistemaDeFacturacionTest >> test01_GeneracionDeFacturaSinLlamadas [

	|sistemaDeFacturacion factura|
	
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales isZero  ;
		assert: factura cantidadLlamadasNacionales isZero ;
		assert: factura montoTotal equals: unAbonoBasico.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test02_GeneracionDeFacturaConSoloUnaLlamadaNacional [

	|sistemaDeFacturacion factura|
	
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'CABA'.
	sistemaDeCostos  registrarParaUnaLocalidad: 'CABA' elCosto: 1.
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales isZero;
		assert: factura cantidadLlamadasNacionales equals: 1;
		assert: factura montoTotal equals: unAbonoBasico + 1.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test03_GeneracionDeFacturaConVariasLlamadasNacionales [

	|sistemaDeFacturacion factura |
	
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'CABA'.
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'Almagro'.
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'Palermo'.
	sistemaDeCostos  registrarParaUnaLocalidad: 'CABA' elCosto: 1.
	sistemaDeCostos  registrarParaUnaLocalidad: 'Almagro' elCosto: 2.
	sistemaDeCostos  registrarParaUnaLocalidad: 'Palermo' elCosto: 3.
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales isZero;
		assert: factura cantidadLlamadasNacionales equals: 3;
		assert: factura montoTotal equals: unAbonoBasico + 6.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test04_GeneracionDeFacturaConSoloUnaLlamadaInternacional [

	|sistemaDeFacturacion factura|
	
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Inglaterra'.
	sistemaDeCostos  registrarParaElPais: 'Inglaterra' elCosto: 3.
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales equals: 1;
		assert: factura cantidadLlamadasNacionales isZero;
		assert: factura montoTotal equals: unAbonoBasico + 3.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test05_GeneracionDeFacturaConVariasLlamadasInternacionales [

	|sistemaDeFacturacion factura|
	
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Inglaterra'.
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Francia'.
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Rusia'.
	sistemaDeCostos  registrarParaElPais: 'Inglaterra' elCosto: 3.
	sistemaDeCostos  registrarParaElPais: 'Francia' elCosto: 4.
	sistemaDeCostos  registrarParaElPais: 'Rusia' elCosto: 9.
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales equals: 3;
		assert: factura cantidadLlamadasNacionales isZero ;
		assert: factura montoTotal equals: unAbonoBasico + 16.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test06_GeneracionDeFacturaConLlamadasNacionalesYLlamadasInternacionales [

	|sistemaDeFacturacion factura| 
	
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'CABA'.
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'Almagro'.
	sistemaDeAdministracion  registrarLlamadaNacionalConDestinoA: 'Palermo'.
	
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Inglaterra'.
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Francia'.
	sistemaDeAdministracion  registrarLlamadaInternacionalConDestinoA: 'Rusia'.
	
	
	sistemaDeCostos  registrarParaUnaLocalidad: 'CABA' elCosto: 1.
	sistemaDeCostos  registrarParaUnaLocalidad: 'Almagro' elCosto: 2.
	sistemaDeCostos  registrarParaUnaLocalidad: 'Palermo' elCosto: 3.
	
	sistemaDeCostos  registrarParaElPais: 'Inglaterra' elCosto: 3.
	sistemaDeCostos  registrarParaElPais: 'Francia' elCosto: 4.
	sistemaDeCostos  registrarParaElPais: 'Rusia' elCosto: 9.
	
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales equals: 3;
		assert: factura cantidadLlamadasNacionales equals: 3 ;
		assert: factura montoTotal equals: unAbonoBasico + 22.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test07_GeneracionDeFacturaConSoloUnaLlamadaLocalRealizadaEnUnaFranjaHoraria [

	|sistemaDeFacturacion factura costoLlamadaLocal |
	
	" 4 horas a 0.2 centavos"
	costoLlamadaLocal := 1/5 * 4* 60.	
	sistemaDeAdministracion  registrarLlamadaLocalParaElDia: 'Lunes' iniciandoALas: self ochoAM  finalizandoALas: self docePM .
	sistemaDeCostos  registrarParaElDia: 'Lunes' iniciandoALas: self ochoAM finalizandoALas: self ochoPM elCostoPorMinuto: 1/5.
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales isZero;
		assert: factura cantidadLlamadasNacionales isZero;
		assert: factura cantidadLlamadasLocales equals: 1;
		assert: factura montoTotal equals: unAbonoBasico + costoLlamadaLocal.
]

{ #category : #tests }
SistemaDeFacturacionTest >> test08_GeneracionDeFacturaConSoloUnaLlamadaLocalRealizadaEnMasDeUnaFranjaHoraria [

	|sistemaDeFacturacion factura costoLlamadaLocal |
	
	"Media hora a 0.2 centavos + media hora a 0.1 centavos"
	costoLlamadaLocal := (1/5 * 1/2 * 60) + (1/10 * 1/2 * 60).	
	sistemaDeAdministracion  registrarLlamadaLocalParaElDia: 'Lunes' iniciandoALas: self sieteYMediaPM  finalizandoALas: self ochoYMediaPM .
	sistemaDeCostos  
		registrarParaElDia: 'Lunes' iniciandoALas: self ochoAM finalizandoALas: self ochoPM elCostoPorMinuto: 1/5;
		registrarParaElDia: 'Lunes' iniciandoALas: self ochoPM finalizandoALas: self oncePM elCostoPorMinuto: 1/10.
	
	sistemaDeFacturacion := SistemaDeFacturacion generandoFacturasConLlamadasRegistradasEn: sistemaDeAdministracion  calculandoCostosCon: sistemaDeCostos.
	factura := sistemaDeFacturacion  generarFacturaCon: unAbonoBasico.
	
	self
		assert: factura abonoBasico equals: unAbonoBasico; 
		assert: factura cantidadLlamadasInternacionales isZero;
		assert: factura cantidadLlamadasNacionales isZero;
		assert: factura cantidadLlamadasLocales equals: 1;
		assert: factura montoTotal equals: unAbonoBasico + costoLlamadaLocal.
]
