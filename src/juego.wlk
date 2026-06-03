import wollok.game.*
import mapas.*
import example.*

object juego{    
    var property mapaActual = mapa1
    const obstaculos = #{}

    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method hayObstaculo(posicion){
        return obstaculos.any({ obstaculo => obstaculo.position() == posicion})
    }

    method configurarJuego(){
        
        self.crearMapa()
//	    game.onCollideDo(pak, {algo => algo.colisionar(pak)}) // asumo que pak es el pak-man, se tiene que cambiar despues.
    }

    method configurarTeclas(){
	    // keyboard.left ().onPressDo({pak.mover(izquierda)})
	    // keyboard.right().onPressDo({pak.mover(derecha)})
	    // keyboard.up   ().onPressDo({pak.mover(arriba)})
	    // keyboard.down ().onPressDo({pak.mover(abajo)})
    }

    method crearMapa(){
        mapaActual.construir()
    }
}

object c{                       // coloco una moneda en el mapa.
    method dibujar(_position) {
        const coins = new Moneda (position = _position)
        game.addVisual(coins)
    }
}

class Moneda {
    var property position = game.at(0,0)
    method image() = "monedaChica.png"
}

object m{
    method dibujar(_position) {  // coloco un muro en el mapa.
        const muro = new Muro(position = _position)    // crear una clase para los muros.
        juego.agregarObstaculo(muro)
        game.addVisual(muro)
    }
}

class Muro {
    var property position = game.at(0,0)
    method image() = "Tierra.png"
}

object p{                       // le digo al Pak-Man su posicion en el mapa.
    method dibujar(position) {  
        // pak.position(position)
    }
}

object _ {
    method dibujar(position) {
      
    }
}

object f{                       // coloco un fantasma en el mapa.
    method dibujar(_position) {
        const fantasma = new Fantasma(position = _position)
        game.addVisual(fantasma)
    }
}