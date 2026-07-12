import wollok.game.*
import mapas.*
import objetos.*
import fantasma.*

object mapa3 inherits Mapa (puntosPorMapa = 2270) {
  const muro   = new Muro(position = game.at(0,0), imagen = "muroMapa3.png") // creo un muro con la imagen de todas las paredes.
  const dibujo =[
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 28
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 27
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 26
    [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 25
    [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 24
    [ _, m, _, m, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, m, _, m, _ ], // 23
    [ m, c, m, c, m, m, m, m, m, m, m, m, m, _, _, m, m, m, m, m, m, m, m, m, c, m, c, m ], // 22
    [ m, _, _, _, c, _, _, _, c, _, _, _, c, m, m, c, _, _, _, c, _, _, _, c, _, _, _, m ], // 21
    [ m, _, m, _, m, m, m, m, m, m, _, m, _, m, m, _, m, _, m, m, m, m, m, m, _, m, _, m ], // 20
    [ m, _, m, _, _, _, c, _, _, _, c, m, c, _, _, c, m, c, _, _, _, c, _, _, _, m, _, m ], // 19
    [ m, c, m, c, m, m, m, m, m, m, _, m, m, m, m, m, m, _, m, m, m, m, m, m, c, m, c, m ], // 18
    [ m, _, m, _, m, _, c, c, _, m, c, _, _, _, _, _, _, c, m, _, c, c, _, m, _, m, _, m ], // 17
    [ m, _, m, _, m, _, m, m, _, m, _, m, m, m, m, m, m, _, m, _, m, m, _, m, _, m, _, m ], // 16
    [ m, _, m, _, _, _, c, c, _, _, _, _, c, _, _, c, _, _, _, _, c, c, _, _, _, m, _, m ], // 15
    [ m, c, m, m, m, m, m, m, m, _, m, m, m, _, _, m, m, m, _, m, m, m, m, m, m, m, c, m ], // 14
    [ m, _, _, _, c, _, c, _, c, _, m, _, _, _, _, _, _, m, _, c, _, c, _, c, _, _, _, m ], // 13
    [ m, _, m, m, m, _, m, _, m, _, m, _, _, _, _, _, _, m, _, m, _, m, _, m, m, m, _, m ], // 12
    [ m, _, _, _, m, _, m, _, m, _, m, m, m, m, m, m, m, m, _, m, _, m, _, m, _, c, _, m ], // 11
    [ m, c, m, c, m, c, m, c, m, c, _, _, _, c, c, _, _, _, c, m, c, m, c, m, c, m, c, m ], // 10
    [ m, _, m, c, m, _, m, _, m, _, m, _, m, _, _, m, _, m, _, m, _, m, _, m, _, m, _, m ], // 9
    [ m, _, _, _, m, _, m, _, m, _, m, c, m, c, c, m, c, m, c, m, _, m, _, m, c, _, _, m ], // 8
    [ m, _, m, m, m, _, m, _, m, _, _, c, _, _, _, _, c, _, _, m, _, m, _, m, m, m, _, m ], // 7
    [ m, c, m, _, _, c, _, c, _, _, m, m, m, m, m, m, m, m, _, _, c, _, c, _, _, m, c, m ], // 6
    [ m, _, m, _, m, _, m, _, m, _, m, _, c, p, _, c, _, m, _, m, _, m, _, m, _, m, _, m ], // 5
    [ m, _, m, c, m, _, m, _, m, c, m, _, m, m, m, m, _, m, c, m, _, m, _, m, c, m, _, m ], // 4
    [ m, _, m, _, _, _, c, _, _, _, m, _, _, _, _, _, _, m, _, _, _, c, _, _, _, m, _, m ], // 3
    [ m, c, m, m, m, _, _, _, m, m, m, c, m, c, c, m, c, m, m, m, _, _, _, m, m, m, c, m ], // 2
    [ m, _, _, _, c, _, _, _, c, _, _, _, m, _, _, m, _, _, _, c, _, _, _, c, _, _, _, m ], // 1
    [ g, m, m, m, m, m, m, m, m, m, m, m, _, m, m, _, m, m, m, m, m, m, m, m, m, m, m, _ ]  // 0
  ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta
  
  method construir() {
    self.construir(dibujo)
    self.agregarFantasmas()
    game.addVisual(muro)
  }
}