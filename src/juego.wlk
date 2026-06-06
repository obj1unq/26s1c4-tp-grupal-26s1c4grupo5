import wollok.game.*
import mapas.*
import pak-man.*
import example.*
import fantasma.*

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
        self.configurarTeclas()
        
        self.crearMapa()
//	    game.onCollideDo(pak, {algo => algo.colisionar(pak)}) // asumo que pak es el pak-man, se tiene que cambiar despues.
        self.movimientoDePak()
        
        busqueda.agregar(blinky)
        busqueda.comenzar()
    }

    method configurarTeclas(){
	    keyboard.left ().onPressDo( {pak.direccionConst(izquierda)})
	    keyboard.right().onPressDo( {pak.direccionConst(derecha)  })
	    keyboard.up   ().onPressDo( {pak.direccionConst(arriba)   })
	    keyboard.down ().onPressDo( {pak.direccionConst(abajo)    })
    }

    method crearMapa(){
        mapaActual.construir()
    }

    method movimientoDePak(){
        game.onTick(300, "movimiento constante de pak", {pak.mover()})
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
        pak.position(position)
        game.addVisual(pak)
    }
}

object _ {
    method dibujar(position) {
      
    }
}

object f{                       // coloco un fantasma en el mapa.
    method dibujar(_position) {
        const fantasma = new Fantasma(position = _position)
        game.addVisual(blinky)
    }
}