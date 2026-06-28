import pak-man.*
import direcciones.*
import wollok.game.*
import juego.*
class Fantasma{
    var property position = game.at(0,0)
    const presa = pak
    method image() = "blinky.png"
    method presa() = presa
    var indiceAMover = 0  // Creo un indice para moverme a la siguiente posicion del recorrido
    method avanzar(){
        self.position(recorrido.vuelta2().get(indiceAMover))
        indiceAMover = (indiceAMover + 1) % recorrido.vuelta2().size() // Voy aumentando el valor del indice y cuando llegue al final, vuelve a 0
    }
}
object fantasma2{
    var property position = game.at(0,0)
    const presa = pak
    method image() = "blinky.png"
    method presa() = presa
    var indiceAMover = 0  // Creo un indice para moverme a la siguiente posicion del recorrido
    method avanzar(){
        self.position(recorrido.vuelta3().get(indiceAMover))
        indiceAMover = (indiceAMover + 1) % recorrido.vuelta3().size() // Voy aumentando el valor del indice y cuando llegue al final, vuelve a 0
    }
}
object recorrido{
    const vuelta = [game.at(1, 9), game.at(2, 9), game.at(3, 9), game.at(4, 9), game.at(4,  8), game.at(4, 7), 
                    game.at(5, 7), game.at(6, 7), game.at(6, 8), game.at(6, 9), game.at(7,  9), game.at(8, 9),
                    game.at(9, 9), game.at(10, 9),game.at(11, 9),game.at(12, 9),game.at(13, 9),game.at(13, 8),
                    game.at(13, 7),game.at(14, 7),game.at(15, 7),game.at(15, 8),game.at(15, 9),game.at(16, 9),
                    game.at(17, 9),game.at(18, 9),game.at(18, 8),game.at(18, 7),game.at(18, 6),game.at(18, 5),
                    game.at(18, 4),game.at(18, 3),game.at(18, 2),game.at(18, 1),game.at(17, 1),game.at(16, 1)]
    method vuelta() = vuelta

    const vuelta2 = [game.at(2, 9), game.at(3, 9), game.at(4, 9), game.at(4, 8), game.at(4, 7),
                     game.at(3, 7), game.at(3, 6), game.at(3, 5), game.at(2, 5), game.at(1, 5), 
                     game.at(1, 6), game.at(1, 7), game.at(1, 8), game.at(1,9)]
    method vuelta2() = vuelta2
    
    const vuelta3 = [game.at(18, 8), game.at(18, 7), game.at(18, 6), game.at(18, 5), game.at(17, 5),
                     game.at(16, 5), game.at(16, 6), game.at(16, 7), game.at(15, 7), game.at(15, 8), 
                     game.at(15, 9), game.at(16, 9), game.at(17, 9), game.at(18,9)]
    method vuelta3() = vuelta3
}

object busqueda {
    const property buscadores = #{} // La idea es poner los fantasmas en este set para que avancen a la vez

    method agregar(buscador) {
        buscadores.add(buscador)
    }

    method eliminar(buscador) {
        buscadores.remove(buscador)
    }

    method comenzar() {
        game.onTick(300, "Busquen, mis pequeños", {buscadores.forEach({buscador => buscador.avanzar()})})
    }

    method detener() {
        game.removeTickEvent("Busquen, mis pequeños")
    }
}