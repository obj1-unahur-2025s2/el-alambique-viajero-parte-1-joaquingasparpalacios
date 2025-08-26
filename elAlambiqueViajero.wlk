object luke {
  var cantLugaresVisitados = 0
  var ultimoRecuerdo = null
  var vehiculoManejado = alambiqueVeloz
  
  method vehiculoManejado() = vehiculoManejado 
  method ultimoRecuerdo() = ultimoRecuerdo
  method lugaresVisitados() = cantLugaresVisitados 
  method puedeManejarA(lugar) = lugar.requerimiento(vehiculoManejado)


  method viajarA(lugar) {
    if (self.puedeManejarA(lugar)){
      vehiculoManejado.consumirNafta(lugar.distancia())
      self.sumarVisita(lugar)
    }
  }
  method manejarConElVehiculo(vehiculoNuevo) {
    vehiculoManejado = vehiculoNuevo
  }
  method cambiarUltimoRecuerdo(recuerdoNuevo) {
    ultimoRecuerdo = recuerdoNuevo
  }
  method sumarVisita(lugar) {
    cantLugaresVisitados += 1
    self.cambiarUltimoRecuerdo(lugar.recuerdoTipico())
  }
}

object alambiqueVeloz {
  var tanqueDeNafta = 30 //En Litros
  var kilometraje = 128000 //En Kilomtros

  method tanqueDeNafta() = tanqueDeNafta 
  method velocidadMaxima() = tanqueDeNafta * 3 

  method consumirNafta(distancia) {
    tanqueDeNafta -= distancia*0.05
    kilometraje += distancia
  }
}

object paris {
  method distancia() = 400
  method recuerdoTipico() = "llavero De La Torre Eiffel"
  method requerimiento(unVehiculo) = unVehiculo.tanqueDeNafta() > 15
}

object buenosAires {
  var presidenteActual = milei
  method distancia() = 60
  method recuerdoTipico() = presidenteActual.mateFavorito() 
  method requerimiento(unVehiculo) = unVehiculo.velocidadMaxima() > 120
  
  method cambiarPresidente(presidenteNuevo) {
    presidenteActual = presidenteNuevo
  }
}

object milei {
  method mateFavorito() = "Mate dulce"
}

object alberto {
  method mateFavorito() = "Mate amargo"
}

object bagdad {
  var recuerdoTipico = "Bidon de Petroleo Crudo"
  method distancia() = 400
  
  method recuerdoTipico() = recuerdoTipico 
  method requerimiento(unVehiculo) = true // siempre da que se puede ir
  method cambiarRecuerdoPor(string) {
    recuerdoTipico = string
  }
}

object lasVegas {
  var homenajeActual = bagdad

  method distancia() = 500
  method recuerdoTipico() = homenajeActual.recuerdoTipico()
  method requerimiento(unVehiculo) = homenajeActual.requerimiento(unVehiculo)
  method homenajeaA(ciudad) {
    homenajeActual = ciudad
  }
}

object batimovil {
  var tanqueDeNafta = 80 //En Litros
  var kilometraje = 30000 //En Kilomtros

  method tanqueDeNafta() = tanqueDeNafta 
  method velocidadMaxima() = tanqueDeNafta * 3 

  method consumirNafta(distancia) {
    tanqueDeNafta -= distancia*0.05
    kilometraje += distancia
  }
}