import wollok.game.*
import mapas.*
import pak-man.*
import fantasma.*

object juego {    
    var property mapaActual = intro
    var property indice = 0
    const mapas = [mapa1, mapa2, mapa3]
    const obstaculos = #{}

    method siguienteMapa(){ 
        self.indice(indice + 1) 
        return mapas.get(self.indice())
    }
    
    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method hayObstaculo(posicion) =  obstaculos.any({ obstaculo => obstaculo.position() == posicion})

    method verificarCambioDeMapa() {        // Por ahora solo sirve para cambiar del mapa1 al 2.
        if (pak.puntos() == mapaActual.puntosPorMapa()) {
            mapaActual = self.siguienteMapa()
            game.clear()
            obstaculos.clear()
            self.configurarJuego()
        }
    }

    method configurarJuego(){
        self.configurarTeclas()
        
        self.crearMapa()
	    game.onCollideDo(pak, {algo => algo.colisionar(pak)})
        
        self.comenzarRecorridoDePak()
        //game.addVisual(marcador)
        game.onTick(1000, "Revisando si se completo el nivel", {self.verificarCambioDeMapa()})
        busqueda.iniciador()
        
	    
    }

    method configurarTeclas(){
	    keyboard.left ().onPressDo({pak.cambiarOrientacionSiPuede(izquierda)})
	    keyboard.right().onPressDo({pak.cambiarOrientacionSiPuede(derecha)  })
	    keyboard.up   ().onPressDo({pak.cambiarOrientacionSiPuede(arriba)   })
	    keyboard.down ().onPressDo({pak.cambiarOrientacionSiPuede(abajo)    })
        // keyboard.p    ().onPressDo({mapaActual.musica().pause()})
        // keyboard.r    ().onPressDo({mapaActual.musica().resume()})
    }

    method configurarIntro(){
        keyboard.any().onPressDo({self.comenzarMapa1()})
    }
    method comenzarMapa1(){
        mapaActual = mapa1
        game.clear()
        obstaculos.clear()
        self.configurarJuego()
    }

    method crearMapa(){
        mapaActual.construir()
    }
    
    method comenzarRecorridoDePak(){
        game.onTick(300, "recorrido constante de pak", {pak.mover()})
    }

    method detenerRecorridoDePak() {
    game.removeTickEvent("recorrido constante de pak")
    }

    method eventoPerderVida(){
        pak.perderVida()
        if(pak.sigueVivo()){
            self.reiniciarNivel()
        } else {
            self.gameOver()
        }
    }

    method reiniciarNivel(){
        //resetea el movimiento constante de pak para q no se acumule
        self.detenerRecorridoDePak()

        //reiniciar personajes
        busqueda.reiniciarFantasmas()
        pak.reiniciarse()

        //intervalo de reinicio
        game.schedule(2000, {
            pak.habilitarMovimiento()
            busqueda.comenzar()
            self.comenzarRecorridoDePak()        
        })
    }

    method gameOver(){
        self.detenerRecorridoDePak()
        busqueda.detener()
        game.say(pak, "PERDI")
        //self.reiniciarJuego()
    }
    /*
    method reiniciarJuego() {
        game.clear()
        obstaculos.clear()
        mapaActual = mapa1
        //busqueda.reiniciarJuego()
        pak.reiniciarJuego()
        self.configurarJuego()
    }
    */
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
        pak.posicionInicial(position)
    }
}

object _ {
    method dibujar(position) {}
}

object f {                       // coloco un fantasma en el mapa. 
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

object b {
    method dibujar(_position) {
        const barra = new Barra (position = _position)
        game.addVisual(barra)
    }
}
class BarraH {
    var property position = game.at(0, 0)
    method image() = "Barra2.png"
}
object t {
    method dibujar(_position) {
        const barra = new BarraH (position = _position)
        game.addVisual(barra)
    }
}
/*
object marcador {

    method position() = game.at(1, 10)

    method text() = "Puntos: " + pak.puntos().toString()

    method textColor() = "000080FF" //azulOscuro
}
*/