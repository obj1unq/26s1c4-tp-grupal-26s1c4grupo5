import wollok.game.*
import mapas.*
import pak-man.*
import fantasma.*
import intro.*
import menu.*

object juego {    
    var property mapaActual = intro
    var property indice = 0
    const obstaculos = #{}
    const mapas = [intro, mapa1, mapa2, mapa3]

    method siguienteMapa(){ 
        self.indice(indice + 1) 
        mapaActual = mapas.get(self.indice())
    }
    
    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method hayObstaculo(posicion) =  obstaculos.any({ obstaculo => obstaculo.position() == posicion})

    method verificarCambioDeMapa() {        // Por ahora solo sirve para cambiar del mapa1 al 2.
        if (pak.puntos() == mapaActual.puntosPorMapa()) {
            self.siguienteMapa()
            game.clear()
            obstaculos.clear()
            self.configurarJuego()
        }
    }

    method configurarJuego(){
        menu.configurarTeclas()
        
        mapaActual.construir()
	    game.onCollideDo(pak, {algo => algo.colisionar(pak)})
        
        self.comenzarRecorridoDePak()
        //game.addVisual(marcador)
        game.onTick(1000, "Revisando si se completo el nivel", {self.verificarCambioDeMapa()})
        busqueda.iniciador()
    }

    method configurarIntro(){
        keyboard.any().onPressDo({self.comenzarMapa()})              // Saca la intro y pasa al mapa1
        mapaActual.construir()
        animacionIntro.animarFrase()
        aniPak.avanzar()
    }

    method comenzarMapa(){
        self.siguienteMapa()
        game.clear()
        obstaculos.clear()
        busqueda.buscadores().clear()
        self.configurarJuego()
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
        obstaculos.clear()
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



// object y{
//     const position = game.at(0,0)
//     method position() = position
// }

//object mUno{
//    const position = game.at(4,9)
//    method position() = position
//    method image() = "muroMapa1.png"
//}