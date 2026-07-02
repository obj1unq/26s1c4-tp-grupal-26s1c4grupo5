import wollok.game.*
import juego.*
import pak-man.*

object menu{

    method configurarTeclas(){
	    keyboard.left ().onPressDo({pak.cambiarOrientacionSiPuede(izquierda)})
	    keyboard.right().onPressDo({pak.cambiarOrientacionSiPuede(derecha)  })
	    keyboard.up   ().onPressDo({pak.cambiarOrientacionSiPuede(arriba)   })
	    keyboard.down ().onPressDo({pak.cambiarOrientacionSiPuede(abajo)    })
        keyboard.p    ().onPressDo({juego.mapaActual.musica().pause()})  // Pausa la musica
        keyboard.r    ().onPressDo({juego.mapaActual.musica().resume()}) // Resume la musica
    }
}