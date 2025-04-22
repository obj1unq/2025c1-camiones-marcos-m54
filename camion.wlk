import cosas.*

object camion {
	const property cosas = #{}
	const pesoDelCamionVacio = 1000
	
	method pesoDelCamionVacio() = pesoDelCamionVacio
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method todoPesoPar() = cosas.all({ cosa => cosa.even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa == peso })
	
	method elDeNivel(nivel) = cosas.find(
		{ cosa => cosa.nivelPeligrosidad() == nivel }
	)
	
	method pesoDeLasCosasDelCamion() = cosas.sum({ cosa => cosa.peso() })
	
	method pesoTotal() = self.pesoDelCamionVacio() + self.pesoDeLasCosasDelCamion()
	
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })

	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method hayObjetoQueSupereNivel(nivelMaximoPeligrosidad){
		return cosas.any({cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not self.excedidoDePeso() and self.hayObjetoQueSupereNivel(nivelMaximoPeligrosidad)
	}
}