import juego.*
object pak {

    var property position = game.at(0, 0)
    var property orientacionConst = quieto
    var property tieneBocaAbierta = false
    var property puntos = 0
    var property vidas = 3
    var posicionInicial = game.at(0, 0)

    method image() = "pak-" + orientacionConst.nombreDir() + "-" + self.moverBoca() + ".png"

    method posicionInicial(posicion){ posicionInicial = posicion }

    method cambiarOrientacionSiPuede(futuraDireccion){

        if (self.puedeIr(futuraDireccion)){
          orientacionConst = futuraDireccion
        }
    }

    method mover(){

        if (self.puedeIr(orientacionConst)){
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

    method morir(){
      
      if (self.vidas() > 1){
          self.reaparecer()
        }
        //juego.perder()
        puntos = 0
    }
    
    method reaparecer(){

      game.removeVisual(self)
      position = posicionInicial
      orientacionConst = quieto
      game.addVisual(self)
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