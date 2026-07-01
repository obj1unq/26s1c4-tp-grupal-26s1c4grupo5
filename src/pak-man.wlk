import juego.*
object pak {

    var property position = game.at(0, 0)
    var property orientacionConst = quieto
    var property puedeMoverse = true
    var property tieneBocaAbierta = false
    var property puntos = 0
    var property vidas = 3
    var posicionInicial = game.at(0, 0)

    method image() = "pak-" + orientacionConst.nombreDir() + "-" + self.moverBoca() + ".png"

    method posicionInicial(posicion){ posicionInicial = posicion }

    method cambiarOrientacionSiPuede(futuraDireccion){

        if (puedeMoverse && self.puedeIr(futuraDireccion)){
          orientacionConst = futuraDireccion
        }
    }

    method mover(){

        if (puedeMoverse && self.puedeIr(orientacionConst)){
            position = orientacionConst.siguiente(position)
            self.alternarBoca()
        }
    }

    method puedeIr(direccion) = (!juego.hayObstaculo(direccion.siguiente(position)))

    method alternarBoca(){

      if (self.estaEnMovimiento()){
        tieneBocaAbierta = !tieneBocaAbierta
      }
    }

    method estaEnMovimiento() = self.puedeIr(orientacionConst)

    method moverBoca(){
      if (tieneBocaAbierta){
        return "boca-cerrada"
      }
        return "boca-abierta"
    }

    method perderVida(){
      vidas -= 1
    }

    method sigueVivo() = vidas > 0

    method reiniciarse(){
      self.desabilitarMovimiento()
      self.reaparecer()
    }

    method desabilitarMovimiento(){puedeMoverse = false}

    method habilitarMovimiento(){puedeMoverse = true}
    
    method reaparecer(){

      game.removeVisual(self)
      position = posicionInicial
      orientacionConst = quieto
      game.addVisual(self)
    }

    method reiniciarJuego(){
      vidas = 3
      puntos = 0
      self.reiniciarse()
    }

    method sumarPuntos(cantidad){ puntos += cantidad}
}
object quieto{

    method siguiente(position) = position
    
    method nombreDir() = "derecha"

}

object derecha {

  method siguiente(position) { return position.right(1) }
  
  method nombreDir() = "derecha"

}

object abajo {

  method siguiente(position) { return position.down(1) }

  method nombreDir() = "abajo"
}

object arriba {

  method siguiente(position) { return position.up(1) }

  method nombreDir() = "arriba"

}

object izquierda {

    method siguiente(position) { return position.left(1) }

    method nombreDir() = "izquierda"

}