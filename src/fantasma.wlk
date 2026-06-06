import pak-man.*
import direcciones.*
import wollok.game.*
class Fantasma{
    var property position = game.at(5,3)
    method image()
    method avanzar()
}

object blinky inherits Fantasma{
    override method image() = "blinky.png"
    
    override method avanzar() {
        const algt = new AEstrella(posActual = game.at(self.position().x(), self.position().y()))
        self.position(algt.buscando())
    }

}

class AEstrella{
    var property posActual
    const presa = pak
    const nodoPresa = new Nodo(position = presa.position()) 
    var property listaAbierta = #{}
    var property listaCerrada = #{}

    method posPresa() = presa.position()
    method buscando(){
        const actual = new Nodo(position = posActual, costoH = self.heuristica(posActual.x(), posActual.y()))
        listaAbierta.add(actual)
        return self.hastaEncontrar()
    }
    method hastaEncontrar(){
        if (listaAbierta.isEmpty()){
            return null
        }
        const actual = listaAbierta.min({nodo => nodo.costoF()})
        if(!(actual.position() == nodoPresa.position())){
            const costoPosible = actual.costoG() + 1
            self.tryando(listaAbierta, listaCerrada, actual, costoPosible, arriba   .siguiente(actual.position()))
            self.tryando(listaAbierta, listaCerrada, actual, costoPosible, derecha  .siguiente(actual.position()))
            self.tryando(listaAbierta, listaCerrada, actual, costoPosible, abajo    .siguiente(actual.position()))
            self.tryando(listaAbierta, listaCerrada, actual, costoPosible, izquierda.siguiente(actual.position()))
            listaCerrada.add(actual)
            listaAbierta.remove(actual)
            return self.hastaEncontrar()
        } return self.encontrando(actual)
    }
    
    method encontrando(nodo){
        if(nodo.nodoPadre() != null && nodo.nodoPadre().costoG() != 0){
            return self.encontrando(nodo.nodoPadre())
        } else{
            return nodo.position()
        }
    }
    method cambiarGyPadre(nodo, nuevoG, nuevoPadre){
        nodo.costoG(nuevoG)
        nodo.nodoPadre(nuevoPadre)
    }
    method crearNodo(pos, g, h, p){
        return new Nodo(position = pos, costoG = g, costoH = h, nodoPadre = p)
    }
    method tryando(setNodos, setNodosCerrados, nodoAComparar, cantidadG, direccion){
        try {
            const nodoABuscar = setNodos.find({nodo => nodo.position() == direccion})
                
            if (nodoABuscar.costoG() > cantidadG){
                self.cambiarGyPadre(nodoABuscar, cantidadG, nodoAComparar)
            }
        } catch e : ElementNotFoundException  {
            try {const nodoABuscal = setNodosCerrados.find({nodo => nodo.position() == direccion})
                if (nodoABuscal.costoG() > cantidadG){
                    self.cambiarGyPadre(nodoABuscal, cantidadG, nodoAComparar)
                    setNodos.add(nodoABuscal)
                    setNodosCerrados.remove(nodoABuscal)
                }
            } catch e : ElementNotFoundException {
                setNodos.add(self.crearNodo(direccion, nodoAComparar.costoG() + 1, self.heuristica(direccion.x(), direccion.y()), nodoAComparar))
            }
        }
    }
    method heuristica(posNX, posNY) = (posNX - nodoPresa.x()).abs() + (posNY - nodoPresa.y()).abs()
}

class Nodo{
    const position 
    var property costoG = 0
    const costoH = 0
    var property nodoPadre = null
    method position() = position
    method nodoPadre() = nodoPadre
    method costoF() = costoG + costoH
    method x() = position.x()
    method y() = position.y()
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
        game.onTick(800, "Busquen, mis pequeños", {buscadores.forEach({buscador => buscador.avanzar()})})
    }

    method detener() {
        game.removeTickEvent("Busquen, mis pequeños")
    }
}