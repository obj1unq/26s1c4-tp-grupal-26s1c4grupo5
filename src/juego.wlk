import wollok.game.*
import intro.*
import mapa1.*
import mapa2.*
import mapa3.*
import pak-man.*
import fantasma.*

object juego {    
    var property mapaActual = intro
    var property indice = 0
    const mapas = [intro, mapa1, mapa2, mapa3]

    method hayObstaculo(_posicion) =  mapaActual.obstaculos().any({ position => position == _posicion})
    method verificarCambioDeMapa() {
        if (pak.puntos() == mapaActual.puntosPorMapa()) {
            self.siguienteMapa()
            game.clear()
            self.configurarJuego()}
    }
    method siguienteMapa(){ 
        self.indice(indice + 1) 
        mapaActual = mapas.get(self.indice())
    }
    method configurarJuego(){
        self.configurarTeclas()
        mapaActual.construir()
	    game.onCollideDo(pak, {algo => algo.colisionar(pak)})
        self.comenzarRecorridoDePak()
        game.onTick(1000, "Revisando si se completo el nivel", {self.verificarCambioDeMapa()})
        busqueda.iniciador()
    }
    method configurarTeclas(){
	    keyboard.left ().onPressDo({pak.cambiarOrientacionSiPuede(izquierda)})
	    keyboard.right().onPressDo({pak.cambiarOrientacionSiPuede(derecha)  })
	    keyboard.up   ().onPressDo({pak.cambiarOrientacionSiPuede(arriba)   })
	    keyboard.down ().onPressDo({pak.cambiarOrientacionSiPuede(abajo)    })
    }
    method configurarIntro(){
        keyboard.any().onPressDo({self.verificarCambioDeMapa()})              // Saca la intro y pasa al mapa1
        mapaActual.construir()
        animacionIntro.animarFrase()
        aniPak.avanzar()
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
        self.detenerRecorridoDePak()        //resetea el movimiento constante de pak para q no se acumule.
        busqueda.reiniciarFantasmas()       //reiniciar personajes.
        pak.reiniciarse()
        game.schedule(2000, {               //intervalo de reinicio.
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
        mapaActual = mapa1
        self.indice(0)
        //busqueda.reiniciarJuego()
        pak.reiniciarJuego()
        self.configurarJuego()
    }
    */
}

/*
object marcador {

    method position() = game.at(1, 10)

    method text() = "Puntos: " + pak.puntos().toString()

    method textColor() = "000080FF" //azulOscuro
}
*/
