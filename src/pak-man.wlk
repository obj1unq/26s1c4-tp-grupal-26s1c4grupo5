import juego.*
object pak {

    var property position = game.at(10,2)
    var property orientacionConst = quieto
    var puntos = 0

    method image() = "pakman3.png"

    method Puntos() = puntos

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


    method morir(){
      game.removeVisual(self)
      // reaparecer en el inicio
      // 
    }

    method sumarPuntos(cantidad){ puntos += cantidad}
}
object quieto{

    method siguiente(position) = position
}

object derecha {
  method siguiente(position) { return position.right(1) }
}

object abajo {
  method siguiente(position) { return position.down(1) }
}

object arriba {
  method siguiente(position) { return position.up(1) }
}

object izquierda {
    method siguiente(position) { return position.left(1) }
}