import pak-man.*
import direcciones.*
import wollok.game.*
import juego.*
class Fantasma{
    var property position = game.at(12,6)
    method image()
    method avanzar()
}

object blinky inherits Fantasma{
    override method image() = "blinky.png"
    
    const algt = new AEstrella(posActual = game.at(self.position().x(), self.position().y()))
    override method avanzar() {
        self.position(algt.buscando())
    }

}

class AEstrella{
    var property posActual
    const presa = pak
    var property listaAbierta = #{}
    var property listaCerrada = #{}

    method posPresa() = presa.position()
    method siEsDentroDelMapaYNohayObstaculo(posicion){
        return tablero.dentro(posicion) and !juego.hayObstaculo(posicion)
    }
    
    method buscando(){
        const actual = new Nodo(position = posActual, costoG = 0, costoH = self.heuristica(posActual.x(), posActual.y()))
        listaAbierta.add(actual)
        return self.hastaEncontrar()
    }
    method hastaEncontrar(){
        if (listaAbierta.isEmpty()){
            return null
        }
        const actual = listaAbierta.min({nodo => nodo.costoF()})
        const parriba    =    arriba1.siguiente(actual.position())
        const pderecha   =   derecha1.siguiente(actual.position())
        const pabajo     =     abajo1.siguiente(actual.position())
        const pizquierda = izquierda1.siguiente(actual.position())
        if(actual.position() != presa.position()){
            const costoPosible = actual.costoG() + 1
            if (self.siEsDentroDelMapaYNohayObstaculo(parriba)){
                self.revisandoVecino(actual, costoPosible, parriba)
            }
            if (self.siEsDentroDelMapaYNohayObstaculo(pderecha)){
                self.revisandoVecino(actual, costoPosible, pderecha)
            }
            if (self.siEsDentroDelMapaYNohayObstaculo(pabajo)){
                self.revisandoVecino(actual, costoPosible, pabajo)
            }
            if (self.siEsDentroDelMapaYNohayObstaculo(pizquierda)){
                self.revisandoVecino(actual, costoPosible, pizquierda)
            }
            listaCerrada.add(actual)
            listaAbierta.remove(actual)
            return self.hastaEncontrar()
        } return self.encontrando(actual)
    }
    method revisandoVecino(nodoAComparar, cantidadG, direccion){    
        const enListaCerrada = listaCerrada.findOrDefault({nodo => nodo.position() == direccion}, null)
        const enListaAbierta = listaAbierta.findOrDefault({nodo => nodo.position() == direccion}, null)
        if (enListaCerrada != null){
            if(enListaCerrada.costoG() > cantidadG){
                self.cambiarGyPadre(enListaCerrada, cantidadG, nodoAComparar)
                listaAbierta.add(enListaCerrada)
                listaCerrada.remove(enListaCerrada)
            }
        
        } else if (enListaAbierta != null){
            if(enListaAbierta.costoG() > cantidadG){
                self.cambiarGyPadre(enListaAbierta, cantidadG, nodoAComparar)
            }
        } else {
            const nuevoNodo = self.crearNodo(direccion, cantidadG, self.heuristica(direccion.x(), direccion.y()), nodoAComparar)
            listaAbierta.add(nuevoNodo)
        }
    }    
    method encontrando(nodo){
        if (nodo.nodoPadre() == null) {
            return nodo.position() 
        }
        if (nodo.nodoPadre().position() == posActual) {
            return nodo.position() 
        }
        return self.encontrando(nodo.nodoPadre())
    }
    method cambiarGyPadre(nodo, nuevoG, nuevoPadre){
        nodo.costoG(nuevoG)
        nodo.nodoPadre(nuevoPadre)
    }
    method crearNodo(pos, g, h, p){
        return new Nodo(position = pos, costoG = g, costoH = h, nodoPadre = p)
    }
    method heuristica(posNX, posNY) = (posNX - presa.position().x()).abs() + (posNY - presa.position().y()).abs()
}

class Nodo{
    const position 
    var property costoG
    const costoH
    var property nodoPadre = null
    method position()  = position
    method nodoPadre() = nodoPadre
    method costoH()    = costoH
    method costoF()    = costoG + costoH
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