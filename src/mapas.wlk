import wollok.game.*
import juego.*

class Mapa {
    method construir(diseño) {
        game.height(diseño.size()) //configuro el alto segun la cantidad de filas del dibujo
        game.width(diseño.anyOne().size()) //configuro el ancho segun la cantidad de columnas del dibujo
        //itero por el ancho y luego por el alto.
        (0 .. game.width() - 1).forEach({ x => 
            (0 .. game.height() - 1).forEach({y => 
                diseño.get(y).get(x).dibujar(game.at(x,y))  //obtengo el dibujante de la cordenada que corresponde a la iteracion y le pido que dibuje en esa cordenada
            })
        })
        // game.addVisual()
    }
}

object mapa1 inherits Mapa {
    const dibujo =[
        [ m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ],
        [ m, c, c, c, c, m, c, c, c, c, c, c, c, c, m, c, c, c, c, m ],
        [ m, c, m, m, c, m, c, m, m, m, m, m, m, c, m, c, m, m, c, m ],
        [ m, c, m, c, c, c, c, c, c, c, c, c, c, c, c, c, c, m, c, m ],
        [ m, c, m, c, m, m, c, m, m, c, c, m, m, c, m, m, c, m, c, m ],
        [ m, c, c, c, c, c, c, m, _, _, _, m, m, c, c, c, c, c, c, m ],
        [ m, c, m, c, m, m, c, m, m, m, m, m, m, c, m, m, c, m, c, m ],
        [ m, c, m, c, c, c, c, c, c, c, c, c, c, c, c, c, c, m, c, m ],
        [ m, c, m, m, c, m, c, m, m, m, m, m, m, c, m, c, m, m, c, m ],
        [ m, c, c, c, c, m, c, c, c, p, c, c, c, c, m, c, c, c, c, m ],
        [ m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ]
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta
    
    method construir() {
        self.construir(dibujo)
    }
}

