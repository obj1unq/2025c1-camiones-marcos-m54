object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee{
	var estaTransformadoEnRobot = true
	method peso() = 800

	method estaTransformadoEnRobot(){
		return estaTransformadoEnRobot
	}
	
	method nivelPeligrosidad(){
		if (self.estaTransformadoEnRobot()){
			return 30
		}
		else
			return 15
	}

	
}


