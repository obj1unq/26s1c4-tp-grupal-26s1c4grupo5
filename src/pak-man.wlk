import juego.*
object pak {

    var property position = game.at(0, 0)
    var property orientacionConst = quieto
    var property puntos = 0

    method image() = "pak-" + orientacionConst.nombreDir() + ".png"

    method cambiarOrientacionSiPuede(futuraDireccion){

        if (self.puedeIr(futuraDireccion)){
          orientacionConst = futuraDireccion
        }
    }

    method mover(){

        if (self.puedeIr(orientacionConst)){
            position = orientacionConst.siguiente(position)
        }
    }

    method puedeIr(direccion) = (!juego.hayObstaculo(direccion.siguiente(position)))

    /*
    method morir(){
      
      if (self.vidas() > 1){
          self.reaparecer()
        }
        juego.perder()
        puntos = 0
    }
    */

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