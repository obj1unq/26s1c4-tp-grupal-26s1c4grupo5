import wollok.game.*
import mapas.*

object intro inherits Mapa (puntosPorMapa = 0) {
  method construir() {
    game.addVisual(cartel)
    game.addVisual(anyKey)
    game.addVisual(aniPak)
  }
}

object animacionIntro {
  var indice   = 0
  const frases = ["Amarillo", "Verde", "Rojo", "Azul"]
  const imaPak = ["abierta", "mcerrada", "cerrada", "mabierta"]
  
  method frase() = frases.get(indice)
  method imaPak() = imaPak.get(indice)
  
  method animarFrase()    {game.onTick(100, "AnimarPressAny", { self.aumentarIndice() })}
  method aumentarIndice() {indice = (indice + 1) % frases.size()} // Voy aumentando el valor del indice y cuando llegue al final, vuelve a 0
}

object anyKey {
  const position = game.at(8, 5)
  method image()    = ("Key" + animacionIntro.frase()) + ".png"
  method position() = position
}

object aniPak {
  var property position = game.at(0, 14)
  method image() = ("pak-derecha2-" + animacionIntro.imaPak()) + ".png"
  
  method avanzar() {game.onTick(400, "Mover AniPak", { position = position.right(2) })}
}

object cartel {
  var property position = game.at(3, 20)
  method image() = "titulopak21100.png"
}