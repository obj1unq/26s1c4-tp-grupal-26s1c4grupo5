import pak-man.*
import juego.*
import intro.*
import fantasma.*

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
        pak.sumarPuntos(valor)
        game.removeVisual(self)
    }
}

object m {
    method dibujar(_position) {} // no hace nada, pero se usa para ver visualmente donde estan los muros en los mapas
}
class Muro {
    const imagen
    const position    = game.at(0,0)
    method position() = position
    method image()    = imagen
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
object v inherits Barra (){
    method dibujar(_position) {
        const barra = new Barra (position = _position)
        game.addVisual(barra)
    }
}
class BarraH {
    var property position = game.at(0, 0)
    method image() = "Barra2.png"
}
object h inherits Barra (){
    method dibujar(_position) {
        const barra = new BarraH (position = _position)
        game.addVisual(barra)
    }
}
object g {
    var property position = game.at(0, 0) 
    method image() = "fondo11.png"
    method dibujar(_position) {
        self.position(_position)
        game.addVisual(self)
    }
}

class Numero {
    var property position
    var property valor = 0
    var property indice

    method image() = valor.toString() + ".png"
    method divisor(){
    if(indice == 0) return 1000
    if(indice == 1) return 100
    if(indice == 2) return 10
    return 1
    }
    method actualizar(puntos){
        valor = puntos.div(self.divisor()) % 10
    }
}
class Vida {
    var property position
    method image() = "pak-derecha-boca-abierta.png"
}
object marcador {
    const vidas = []
    const numeros = []

    method crearNumeros(posicion){   
        (0..3).forEach({i => 
            const numero = new Numero(
                position = posicion.right(i+3),
                indice = i) 
            numeros.add(numero)
            game.addVisual(numero)
        })
    }
    method actualizarPuntuacion(puntos){
        numeros.forEach({n => n.actualizar(puntos)})
    }
    method crearVidas(posicion){
        var indice = 0
        (0..2).forEach({v => 
            const vida = new Vida(
                position = posicion.right(indice))
            indice += 1
            vidas.add(vida)
            game.addVisual(vida)
            })
    }
    method actualizarVidas(cantDeVidas){
        if(vidas.size() > cantDeVidas){
            const ultVida = vidas.last()
            game.removeVisual(ultVida)
            vidas.remove(ultVida)
        }
    }
}