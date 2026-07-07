import pak-man.*
import wollok.game.*
import juego.*
class Fantasma{
    
    var property position
    const property posicionInicial 

    var indiceAMover = 0  // Creo un indice para moverme a la siguiente posicion del recorrido
    
    const camino = recorrido.vueltaDesignada()
    
    method image() = "blinky.png"
    
    method avanzar(){
        self.position(camino.get(indiceAMover))
        indiceAMover = (indiceAMover + 1) % camino.size() // Voy aumentando el valor del indice y cuando llegue al final, vuelve a 0
    }
    method colisionar(pak){
        juego.eventoPerderVida()
    }
    method reaparecer(){
        position = posicionInicial
        indiceAMover = 0
    }
}
object recorrido{
    
    var property indiceVuelta = 0
    
    const vueltas = [vuelta, vuelta2, vuelta3]
    
    method vueltas() = vueltas
    
    method vueltaDesignada() {
        indiceVuelta = indiceVuelta + 1
        return vueltas.get(indiceVuelta - 1)
    }
    const vuelta = [game.at(14, 18), game.at(15, 18), game.at(16, 18), game.at(17, 18), game.at(17, 17), game.at(17, 16), 
                    game.at(18, 16), game.at(19, 16), game.at(20, 16), game.at(20, 15), game.at(20, 14), game.at(20, 13),
                    game.at(20, 12), game.at(19, 12), game.at(18, 12), game.at(17, 12), game.at(16, 12), game.at(15, 12),
                    game.at(14, 12), game.at(13, 12), game.at(12, 12), game.at(11, 12), game.at(10, 12), game.at(9 , 12),
                    game.at(8 , 12), game.at(7 , 12), game.at(7 , 13), game.at(7 , 14), game.at(7 , 15), game.at(7 , 16),
                    game.at(8 , 16), game.at(9 , 16), game.at(10, 16), game.at(10, 17), game.at(10, 18), game.at(11, 18), 
                    game.at(12, 18), game.at(13, 18)]
    method vuelta() = vuelta

    const vuelta2 = [game.at(6, 18), game.at(7, 18), game.at(8, 18), game.at(8, 17), game.at(8, 16),
                     game.at(7, 16), game.at(7, 15), game.at(7, 14), game.at(6, 14), game.at(5, 14), 
                     game.at(5, 15), game.at(5, 16), game.at(5, 17), game.at(5, 18)]
    method vuelta2() = vuelta2
    
    const vuelta3 = [game.at(21, 18), game.at(20, 18), game.at(19, 18), game.at(19, 17), game.at(19, 16),
                     game.at(20, 16), game.at(20, 15), game.at(20, 14), game.at(21, 14), game.at(22, 14), 
                     game.at(22, 15), game.at(22, 16), game.at(22, 17), game.at(22, 18)]
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
    method iniciador(){
        game.schedule(3000, {self.comenzar()})
    }
    
    method comenzar() {
        game.onTick(400, "Busquen, mis pequeños", {buscadores.forEach({buscador => buscador.avanzar()})})
    }

    method detener() {
        game.removeTickEvent("Busquen, mis pequeños")
    }

    method reorganizar(){
        self.detener()
        self.reaparecerFantasmas()
    }

    method reiniciarFantasmas(){
        self.detener()
        buscadores.clear()
        self.reaparecerFantasmas()
        recorrido.indiceVuelta(0)
    }

    method reaparecerFantasmas() = self.buscadores().forEach({fantasma => fantasma.reaparecer()})

}