import wollok.game.*
import intro.*
import mapa1.*
import mapa2.*
import mapa3.*
import pak-man.*
import fantasma.*
import marcador.*
import sonidos.*

object juego {
  const mapas             = [intro, mapa1, mapa2, mapa3]
  var property prota      = pak
  var property indice     = 0
  var property mapaActual = intro
  
  method hayObstaculo(_posicion) = mapaActual.obstaculos().any({ muro => muro.position() == _posicion })

  method verificarCambioDeMapa() {
    if (prota.puntos() == mapaActual.puntosPorMapa()) {
    //   sonidoAvanzarNivel.sonido().play()
      self.siguienteMapa()
      game.clear()
      self.configurarJuego()
    }
  }
  method siguienteMapa() {
    self.indice(indice + 1)
    if (self.indice() == 4) self.indice(0)
    mapaActual = mapas.get(self.indice())
  }
  method configurarJuego() {
    self.configurarTeclas()
    mapaActual.construir()
    game.onCollideDo(prota, { algo => algo.colisionar(prota) })
    prota.puedeMoverse(true)
    self.comenzarRecorridoDeProta(prota)
    game.onTick(1000, "Revisando si se completo el nivel", { self.verificarCambioDeMapa() })
    busqueda.comenzar()
  }
  method configurarTeclas() {
    keyboard.left ().onPressDo({ prota.cambiarOrientacionSiPuede(izquierda) })
    keyboard.right().onPressDo({ prota.cambiarOrientacionSiPuede(derecha) })
    keyboard.up   ().onPressDo({ prota.cambiarOrientacionSiPuede(arriba) })
    keyboard.down ().onPressDo({ prota.cambiarOrientacionSiPuede(abajo) })
    keyboard.r    ().onPressDo({ self.reiniciarJuego() })
  }
  method configurarIntro() {
    keyboard.any().onPressDo({ self.verificarCambioDeMapa() }) // Saca la intro y pasa al mapa1
    mapaActual.construir()
    animacionIntro.animarFrase()
    aniPak.position(game.at(0, 14))
    aniPak.avanzar()
  }
  method comenzarRecorridoDeProta(p) {
    game.onTick(300, "recorrido constante de pak", { p.mover() })
  }
  method detenerRecorridoDeProta() {
    game.removeTickEvent("recorrido constante de pak")
  }
  method eventoPerderVida() {
    prota.perderVida()
    if (prota.tieneMasVidas()) self.reiniciarNivel() else self.gameOver()
  }
  method reiniciarNivel() {
    self.detenerRecorridoDeProta()
    busqueda.reorganizar()
    prota.reiniciarse()
    game.schedule(2000,{prota.puedeMoverse(true)
                        busqueda.comenzar()
                        return self.comenzarRecorridoDeProta(prota)})
  }
  method gameOver() {
    self.detenerRecorridoDeProta()
    busqueda.detener()
    prota.desaparecer()
    game.schedule(3000, { self.reiniciarJuego() })
    // game.schedule(1500, { sonidoReinicio.sonido().play() })
  }
  method reiniciarJuego() {
    game.clear()
    mapaActual = intro
    self.indice(0)
    busqueda.reiniciarFantasmas()
    prota.reiniciarJuego()
    self.configurarIntro()
  }
  method actualizarPuntuacion(numero) {
    marcador.actualizarPuntuacion(numero)
  }
  method actualizarVidasDePak(vidas) {
    marcador.actualizarVidas(vidas)
  }
}