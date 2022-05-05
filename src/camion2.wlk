import cosas2.*

object camion {
	const cosas = []
	method cargar(cosa) { 
		cosas.add(cosa)
		cosa.cambio()
	}
	method descargar(cosa) { cosas.remove(cosa) }
	method todoPesoPar() { return  cosas.all({ cosa => (cosa.peso() % 2) == 0 }) }
	method hayAlgunoQuePesa(peso) { return cosas.any({ cosa => cosa.peso() == peso }) }
	method elDeNivel(nivel) { return cosas.find({ cosa => cosa.nivelDePeligrosidad() == nivel }) }
	method pesoTotal() { return cosas.sum({ cosa => cosa.peso() }) + 1000 }
	method excedidoDePeso() { return self.pesoTotal() > 2500 }
	method objetosQueSuperanPeligrosidad(nivel) { return cosas.filter({ cosa => cosa.nivelDePeligrosidad() > nivel }) }
	method objetosMasPeligrososQue(cosa) { return self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad()) }	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) { return not self.excedidoDePeso() and 
														  cosas.all({ cosa => cosa.nivelDePeligrosidad() <= nivelMaximoPeligrosidad }) }
	method tieneAlgoQuePesaEntre(min, max) { return cosas.any({ cosa => cosa.peso().between(min, max) }) }
	method cosaMasPesada() { return cosas.max({ cosa => cosa.peso() }) }
	method pesos() { return cosas.map({ cosa => cosa.peso() }) }	
	method totalBultos() { return cosas.sum({ cosa => cosa.cantidadDeBultos() }) }
}
