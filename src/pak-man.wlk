import juego.*
object pak {

    var property position = game.at(10,2)
    var property direccionConst = quieto

    method image() = "pakman3.png"


    method mover(){
        const siguiente = direccionConst.siguiente(position)

        if (!juego.hayObstaculo(siguiente)){
            position = siguiente
        }
    }
}

object quieto{

    method siguiente(position) = position
}
object derecha {
  method siguiente(position) {
    if (position.x() >= game.width() - 1) self.error("Estás en el límite del mapa")
    return position.right(1)
  }
}

object abajo {
  method siguiente(position) {
    if (position.y() <= 0) self.error("Estás en el límite del mapa")
    return position.down(1)
  }
}

object arriba {
  method siguiente(position) {
    if (position.y() >= game.height() - 1) self.error("Estás en el límite del mapa")
    return position.up(1)
  }
}

object izquierda {
    method siguiente(position) {
        if (position.x() <= 0) self.error( "Estás en el límite del mapa")
        return position.left(1)
    }
}