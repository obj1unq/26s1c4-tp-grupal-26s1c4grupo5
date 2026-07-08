import pak-man.*
import wollok.game.*
import juego.*
import recorrido.*
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