import wollok.game.*

class Numero {
  var property valor = 0
  var property indice
  var property position
  
  method image() = valor.toString() + ".png"
  
  method divisor() {
    if (indice == 0) return 1000
    if (indice == 1) return 100
    if (indice == 2) return 10
    return 1
  }
  method actualizar(puntos) {
    valor = puntos.div(self.divisor()) % 10
  }
}

class Vida {
  var property position
  method image() = "pak-derecha-boca-abierta.png"
}

object marcador {
  const        vidas   = []
  var property numeros = []
  
  method crearNumeros(posicion) {
    (0 .. 3).forEach({ i => const numero = new Numero(position = posicion.right((i * 2) - 1), indice = i)
                            numeros.add(numero)
                            return game.addVisual(numero)})
  }
  method actualizarPuntuacion(puntos) {
    numeros.forEach({ n => n.actualizar(puntos) })
  }
  method crearVidas(posicion) {
    var indice = 0
    (0 .. 2).forEach({ v => const vida = new Vida(position = posicion.right(indice))
                            indice += 1
                            vidas.add(vida)
                            return game.addVisual(vida)})
  }
  method actualizarVidas(cantDeVidas) {
    if (vidas.size() > cantDeVidas) {
      const ultVida = vidas.last()
      game.removeVisual(ultVida)
      vidas.remove(ultVida)
    }
  }
}