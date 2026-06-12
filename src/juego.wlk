import wollok.game.*
import mapas.*
import pak-man.*
import fantasma.*

object juego {    
    var property mapaActual = mapa1
    const obstaculos = #{}

    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method hayObstaculo(posicion) =  obstaculos.any({ obstaculo => obstaculo.position() == posicion})

    method verificarCambioDeMapa() {        // Por ahora solo sirve para cambiar del mapa1 al 2.
        if (pak.puntos() == 1000) {
            mapaActual = asignarMapa
            game.clear()
            obstaculos.clear()
            self.configurarJuego()
        }
    }

    method configurarJuego(){
        self.configurarTeclas()
        
        self.crearMapa()
	    game.onCollideDo(pak, {algo => algo.colisionar(pak)})
        self.movimientoDePak()
        game.addVisual(marcador)
        /*
        busqueda.agregar(blinky)
        busqueda.comenzar()
        */
    }

    method configurarTeclas(){
	    keyboard.left ().onPressDo({pak.cambiarOrientacionSiPuede(izquierda)})
	    keyboard.right().onPressDo({pak.cambiarOrientacionSiPuede(derecha)  })
	    keyboard.up   ().onPressDo({pak.cambiarOrientacionSiPuede(arriba)   })
	    keyboard.down ().onPressDo({pak.cambiarOrientacionSiPuede(abajo)    })
    }

    method crearMapa(){
        mapaActual.construir()
    }
    
    method movimientoDePak(){
        game.onTick(300, "movimiento constante de pak", {pak.mover()})
    }
}

object c {                       // coloco una moneda en el mapa.
    method dibujar(_position) {
        const coins = new Moneda (position = _position)
        game.addVisual(coins)
    }
}

class Moneda {
    var property position = game.at(0,0)
    const valor = 10
    method image() = "monedaChicaSinFondo.png"

    method colisionar(pak){
        console.println("Puntos " + pak.puntos())
        game.removeVisual(self)
        pak.sumarPuntos(valor)
        juego.verificarCambioDeMapa()
    }
}

object m {
    method dibujar(_position) {  // coloco un muro en el mapa.
        const muro = new Muro(position = _position)    // crear una clase para los muros.
        juego.agregarObstaculo(muro)
        game.addVisual(muro)
    }
}

class Muro {
    var property position = game.at(0,0)
    method image() = juego.mapaActual().muro()
}

object p {                       // le digo al Pak-Man su posicion en el mapa.
    method dibujar(position) {  
        pak.position(position)
        game.addVisual(pak)
        //pak.posicionInicial(position)
    }
}

object _ {
    method dibujar(position) {}
}


object f {                       // coloco un fantasma en el mapa.
    //const fantasma = new Fantasma(position = _position) // dice que esta mal pq estas intentando instanciar una clase abstracta
    method dibujar(_position) {
        game.addVisual(blinky)
    }
}

class Teletrasportador {
    var property position = game.at(0, 0)
}

object t {
    method dibujar(_position) {
        const portal = new Teletrasportador (position = _position)
    }
}

object marcador {

    method position() = game.at(1, 10)

    method text() = "Puntos: " + pak.puntos().toString()

    method textColor() = "000080FF" //azulOscuro
}