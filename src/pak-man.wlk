import juego.*
object pak {

    var property position = game.at(0,0)
    var property orientacionConst = quieto // si pongo position salta un error
    var puntos = 0

    method image() = "Pak-man.png"

    method puntos() = puntos

    method cambiarOrientacionSiPuede(nuevaDireccion){
      const siguienteDireccion = nuevaDireccion.siguiente(position)

      if (!juego.hayObstaculo(siguienteDireccion)){
        orientacionConst = nuevaDireccion
      }
    }

    method mover(){
        const siguienteCasilla = orientacionConst.siguiente(position)

        if (!juego.hayObstaculo(siguienteCasilla)){
              position = siguienteCasilla
        }
    }

    method morir(){
        game.removeVisual(self)
        // reaparecer en el inicio 
        // mas adelante crear una mini animación de muerte
    }

    method sumarPuntos(cantidad){
      puntos += cantidad
    }
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