import wollok.game.*
import juego.*


object mapa1 {
    const dibujo =[
        [ m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ],
        [ m, _, _, _, _, m, _, _, _, _, _, _, _, _, m, _, _, _, _, m ],
        [ m, _, m, m, _, m, _, m, m, m, m, m, m, _, m, _, m, m, _, m ],
        [ m, _, m, _, _, _, _, _, _, _, _, _, _, _, _, _, _, m, _, m ],
        [ m, _, m, _, m, m, _, m, m, _, _, m, m, _, m, m, _, m, _, m ],
        [ m, _, _, _, _, _, _, m, f, f, f, f, m, _, _, _, _, _, _, m ],
        [ m, _, m, _, m, m, _, m, m, m, m, m, m, _, m, m, _, m, _, m ],
        [ m, _, m, _, _, _, _, _, _, _, _, _, _, _, _, _, _, m, _, m ],
        [ m, _, m, m, _, m, _, m, m, m, m, m, m, _, m, _, m, m, _, m ],
        [ m, _, _, _, _, m, _, _, _, p, _, _, _, _, m, _, _, _, _, m ],
        [ m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ]
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta

    method construir() {
        game.height(dibujo.size()) //configuro el alto segun la cantidad de filas del dibujo
        game.width(dibujo.anyOne().size()) //configuro el ancho segun la cantidad de columnas del dibujo
        //itero por el ancho y luego por el alto.
        (0 .. game.width() - 1).forEach({ x => 
            (0 .. game.height() - 1).forEach({y => 
                dibujo.get(y).get(x).dibujar(game.at(x,y))  //obtengo el dibujante de la cordenada que corresponde a la iteracion y le pido que dibuje en esa cordenada
            })
        })
        game.addVisual("Pak-man.png")
    }
}

