import wollok.game.*
import mapas.*

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
        // self.configurarTeclas()
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

object _{                       // coloco una moneda en el mapa.
    method image() = "moneda.png"
    var property position = game.at(0,0)
    method dibujar(_position) {
        // self.position(_position)        // Ubico la moneda en su pocicion final.
        // game.addVisual(self)
    }
}

object m{
    method dibujar(position) {  // coloco un muro en el mapa.
        const muro = new Muro(position=position)    // crear una clase para los muros.
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

object f{                       // coloco un fantasma en el mapa.
    method dibujar(position) {
        const fantasma = new Muro(position=position)
        game.addVisual(fantasma)
    }
}