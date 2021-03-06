object knightRider {
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }
}

object bumblebee {
	var esUnAuto
	
	method esUnAuto() { return esUnAuto }
	method esUnAuto(valor) { esUnAuto = valor }
	method nivelDePeligrosidad() { return if (esUnAuto) 15 else 30 }
	method peso() { return 800 }
}

object paqueteLadrillos{
	var cantidadDeLadrillos
	
	method cantidadDeLadrillos() { return cantidadDeLadrillos }
	method cantidadDeLadrillos(cantidad) { cantidadDeLadrillos = cantidad }
	method peso() { return cantidadDeLadrillos * 2 }
	method nivelDePeligrosidad() { return 2 }
}


object arena {
	var peso 
	
	method peso() { return peso }
	method peso(valor) { peso = valor }
	method nivelDePeligrosidad() { return 1 }
}

object bateriaAntiarea {
	var estaConMisiles = false
	
	method estaConMisiles() { return estaConMisiles }
	method estaConMisiles(valor) { estaConMisiles = valor }
	method peso() { return if (estaConMisiles) 300 else 200 }
	method nivelDePeligrosidad() { return if (estaConMisiles) 100 else 0 }
	
}

object contenedor {
	const cosas = []
	
	method agregarCosa(cosa) { cosas.add(cosa) }
	method eliminarCosa(cosa) { cosas.remove(cosa) }
	method cosas() { return cosas }
	method peso() { return 100 + cosas.sum({ cosa => cosa.peso() }) }
	method nivelDePeligrosidad() { return if (cosas.isEmpty()) 0 else cosas.sum({ cosa => cosa.nivelDePeligrosidad() }) }
}

object residuosRadioactivos {
	var peso
	
	method peso() { return peso }
	method peso(unPeso) { peso = unPeso }
	method nivelDePeligrosidad() { return 200 }
}


object embalajeSeguridad {
	var cosa
	method peso() { return cosa.peso() }
	method contener(cosaAContener) { cosa = cosaAContener }
	method nivelDePeligrosidad() { return cosa.nivelDePeligrosidad() / 2 }
}