import pak-man.*
import juego.*
import intro.*
import sonidos.*
import fantasma.*

object c { // coloco una moneda en el mapa.
  method dibujar(_position) {
    const coins = new Moneda(position = _position)
    game.addVisual(coins)
  }
}
class Moneda {
  const valor           = 10
  var property position = game.at(0, 0)
  
  method image() = "monedaChicaSinFondo.png"
  
  method colisionar(pak) {
    pak.sumarPuntos(valor)
    game.removeVisual(self)
    // sonidoMoneda.sonido().play()
  }
}

object m {
  method dibujar(_position) {
    const muro = new Muro (position = _position)
    juego.obstaculos.add(muro)
  }
}
class Muro {
  const imagen   = ""
  const position = game.at(0, 0)
  
  method image()    = imagen
  method position() = position
}

object p { // le digo al Pak-Man su posicion en el mapa.
  method dibujar(position) {
    pak.position(position)
    game.addVisual(pak)
    pak.posicionInicial(position)
  }
}

object _ {
  method dibujar(position) {}
}

object f {  // coloco un fantasma en el mapa. 
  method dibujar(_position) {
    const fantasma = new Fantasma(position = _position, posicionInicial = _position)
    game.addVisual(fantasma)
    busqueda.agregar(fantasma)
  }
}

class Barra {
  var property position = game.at(0, 0)
  method image() = "Barra1.png"
}
object v inherits Barra {
  method dibujar(_position) {
    const barra = new Barra(position = _position)
    game.addVisual(barra)
  }
}
class BarraH {
  var property position = game.at(0, 0)
  method image() = "Barra2.png"
}
object h inherits Barra {
  method dibujar(_position) {
    const barra = new BarraH(position = _position)
    game.addVisual(barra)
  }
}

object g {
  var property position = game.at(0, 0)
  
  method image() = "fondo11.png"
  
  method dibujar(_position) {
    self.position(_position)
    game.addVisual(self)
  }
}