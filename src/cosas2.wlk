object knightRider {
	method cambio() {  }
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }
	method cantidadDeBultos() { return 1 }
}

object bumblebee {
	var esUnAuto
	
	method cambio() { esUnAuto = false }
	method esUnAuto() { return esUnAuto }
	method esUnAuto(valor) { esUnAuto = valor }
	method nivelDePeligrosidad() { return if (esUnAuto) 15 else 30 }
	method peso() { return 800 }
	method cantidadDeBultos() { return 2 }
}

object paqueteLadrillos{
	var cantidadDeLadrillos
	
	method cambio() { cantidadDeLadrillos += 12}
	method cantidadDeLadrillos() { return cantidadDeLadrillos }
	method cantidadDeLadrillos(cantidad) { cantidadDeLadrillos = cantidad }
	method peso() { return cantidadDeLadrillos * 2 }
	method nivelDePeligrosidad() { return 2 }
	method cantidadDeBultos() {
		if (cantidadDeLadrillos.between(0, 100)) {
			return 1 	
		}
		else if (cantidadDeLadrillos.between(101, 300) ) { 
			return 2
		}
		else {
			return 3
		}
	}
}


object arena {
	var peso = 0
	
	method cambio() { peso += 20 }
	method peso() { return peso }
	method peso(valor) { peso = valor }
	method nivelDePeligrosidad() { return 1 }
	method cantidadDeBultos() { return 1 }
}

object bateriaAntiarea {
	var estaConMisiles
	
	method cambio() { estaConMisiles = true }
	method estaConMisiles() { return estaConMisiles }
	method estaConMisiles(valor) { estaConMisiles = valor }
	method peso() { return if (estaConMisiles) 300 else 200 }
	method nivelDePeligrosidad() { return if (estaConMisiles) 100 else 0 }
	method cantidadDeBultos() { return if (estaConMisiles) 2 else 1}
	
}

object contenedor {
	const cosas = []
	
	method cambio() { cosas.forEach({ cosa => cosa.cambio() }) }
	method agregarCosa(cosa) { cosas.add(cosa) }
	method eliminarCosa(cosa) { cosas.remove(cosa) }
	method cosas() { return cosas }
	method peso() { return 100 + cosas.sum({ cosa => cosa.peso() }) }
	method nivelDePeligrosidad() { return if (cosas.isEmpty()) 0 else cosas.sum({ cosa => cosa.nivelDePeligrosidad() }) }
	method cantidadDeBultos() { return cosas.sum({ cosa => cosa.cantidadDeBultos() }) + 1}
}

object residuosRadioactivos {
	var peso = 0
	
	method cambio() { peso += 15 }
	method peso() { return peso }
	method peso(unPeso) { peso = unPeso }
	method nivelDePeligrosidad() { return 200 }
	method cantidadDeBultos() { return 1 }
}


object embalajeSeguridad {
	var cosa
	
	method cambio() {  }
	method peso() { return cosa.peso() }
	method contener(cosaAContener) { cosa = cosaAContener }
	method nivelDePeligrosidad() { return cosa.nivelDePeligrosidad() / 2 }
	method cantidadDeBultos() { return 2 }
}