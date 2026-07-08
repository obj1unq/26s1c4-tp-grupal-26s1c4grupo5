import wollok.game.*
import mapas.*
import objetos.*
import fantasma.*

object mapa3 inherits Mapa (puntosPorMapa = 2280) {
  const muro   = new Muro(position = game.at(0,0), imagen = "muroMapa3.png") // creo un muro con la imagen de todas las paredes.
  const dibujo =[
  //  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 28
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 27
    [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 26
    [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 25
    [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 24
    [ m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ], // 23
    [ m, c, m, c, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, c, m, c, m ], // 22
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
    [ g, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m ]  // 0
  ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta
    
  override method obstaculos() = [
    game.at(1,0),  game.at(2,0),  game.at(3,0),  game.at(4,0),  game.at(5,0),  game.at(6,0),  game.at(7,0),
    game.at(8,0),  game.at(9,0),  game.at(10,0), game.at(11,0), game.at(12,0), game.at(13,0), game.at(14,0),
    game.at(15,0), game.at(16,0), game.at(17,0), game.at(18,0), game.at(19,0), game.at(20,0), game.at(21,0),
    game.at(22,0), game.at(23,0), game.at(24,0), game.at(25,0), game.at(26,0), game.at(27,0),
    game.at(0,1),  game.at(12,1), game.at(15,1), game.at(27,1),
    game.at(0,2),  game.at(2,2),  game.at(3,2),  game.at(4,2),  game.at(8,2),  game.at(9,2),  game.at(10,2),
    game.at(12,2), game.at(15,2), game.at(17,2), game.at(18,2), game.at(19,2), game.at(23,2), game.at(24,2),
    game.at(25,2), game.at(27,2),
    game.at(0,3),  game.at(2,3),  game.at(10,3), game.at(17,3), game.at(25,3), game.at(27,3),
    game.at(0,4),  game.at(2,4),  game.at(4,4),  game.at(6,4),  game.at(8,4),  game.at(10,4), game.at(12,4),
    game.at(13,4), game.at(14,4), game.at(15,4), game.at(17,4), game.at(19,4), game.at(21,4), game.at(23,4),
    game.at(25,4), game.at(27,4),
    game.at(0,5),  game.at(2,5),  game.at(4,5),  game.at(6,5),  game.at(8,5),  game.at(10,5), game.at(17,5),
    game.at(19,5), game.at(21,5), game.at(23,5), game.at(25,5), game.at(27,5),
    game.at(0,6),  game.at(2,6),  game.at(10,6), game.at(11,6), game.at(12,6), game.at(13,6), game.at(14,6),
    game.at(15,6), game.at(16,6), game.at(17,6), game.at(25,6), game.at(27,6),
    game.at(0,7),  game.at(2,7),  game.at(3,7),  game.at(4,7),  game.at(6,7),  game.at(8,7),  game.at(19,7),
    game.at(21,7), game.at(23,7), game.at(24,7), game.at(25,7), game.at(27,7),
    game.at(0,8),  game.at(4,8),  game.at(6,8),  game.at(8,8),  game.at(10,8), game.at(12,8), game.at(15,8),
    game.at(17,8), game.at(19,8), game.at(21,8), game.at(23,8), game.at(27,8),
    game.at(0,9),  game.at(2,9),  game.at(4,9),  game.at(6,9),  game.at(8,9),  game.at(10,9), game.at(12,9),
    game.at(15,9), game.at(17,9), game.at(19,9), game.at(21,9), game.at(23,9), game.at(25,9), game.at(27,9),
    game.at(0,10), game.at(2,10), game.at(4,10), game.at(6,10), game.at(8,10), game.at(19,10),game.at(21,10),
    game.at(23,10),game.at(25,10),game.at(27,10),
    game.at(0,11), game.at(4,11), game.at(6,11), game.at(8,11), game.at(10,11),game.at(11,11),game.at(12,11),
    game.at(13,11),game.at(14,11),game.at(15,11),game.at(16,11),game.at(17,11),game.at(19,11),game.at(21,11),
    game.at(23,11),game.at(27,11),
    game.at(0,12), game.at(1,12), game.at(27,12), game.at(3,12), game.at(4,12), game.at(6,12), game.at(8,12),
    game.at(10,12),game.at(17,12),game.at(19,12),game.at(21,12),game.at(23,12),game.at(24,12),game.at(25,12),
    game.at(0,13), game.at(10,13),game.at(17,13),game.at(27,13),
    game.at(0,14), game.at(2,14), game.at(3,14), game.at(4,14), game.at(5,14), game.at(6,14), game.at(7,14),
    game.at(8,14), game.at(10,14),game.at(11,14),game.at(12,14),game.at(15,14),game.at(16,14),game.at(17,14),
    game.at(19,14),game.at(20,14),game.at(21,14),game.at(22,14),game.at(23,14),game.at(24,14),game.at(25,14),
    game.at(27,14),
    game.at(0,15), game.at(2,15), game.at(25,15),game.at(27,15),
    game.at(0,16), game.at(2,16), game.at(4,16), game.at(6,16), game.at(7,16), game.at(9,16), game.at(11,16),
    game.at(12,16),game.at(13,16),game.at(14,16),game.at(15,16),game.at(16,16),game.at(18,16),game.at(20,16),
    game.at(21,16),game.at(23,16),game.at(25,16),game.at(27,16),
    game.at(0,17), game.at(2,17), game.at(4,17), game.at(9,17), game.at(18,17),game.at(23,17),game.at(25,17),
    game.at(27,17),
    game.at(0,18), game.at(2,18), game.at(4,18), game.at(5,18), game.at(6,18), game.at(7,18), game.at(8,18),
    game.at(9,18), game.at(11,18),game.at(12,18),game.at(13,18),game.at(14,18),game.at(15,18),game.at(16,18),
    game.at(18,18),game.at(19,18),game.at(20,18),game.at(21,18),game.at(22,18),game.at(23,18),game.at(25,18),
    game.at(27,18),
    game.at(0,19), game.at(2,19), game.at(11,19),game.at(16,19),game.at(25,19),game.at(27,19),
    game.at(0,20), game.at(2,20), game.at(4,20), game.at(5,20), game.at(6,20), game.at(7,20), game.at(8,20),
    game.at(9,20), game.at(11,20),game.at(13,20),game.at(14,20),game.at(16,20),game.at(18,20),game.at(19,20),
    game.at(20,20),game.at(21,20),game.at(22,20),game.at(23,20),game.at(25,20),game.at(27,20),
    game.at(0,21), game.at(13,21),game.at(14,21),game.at(27,21),
    game.at(0,22), game.at(2,22), game.at(4,22), game.at(5,22), game.at(6,22), game.at(7,22), game.at(8,22),
    game.at(9,22), game.at(10,22),game.at(11,22),game.at(12,22),game.at(13,22),game.at(14,22),game.at(15,22),
    game.at(16,22),game.at(17,22),game.at(18,22),game.at(19,22),game.at(20,22),game.at(21,22),game.at(22,22),
    game.at(23,22),game.at(25,22),game.at(27,22),
    game.at(0,23), game.at(1,23), game.at(2,23), game.at(3,23), game.at(4,23), game.at(5,23), game.at(6,23),
    game.at(7,23), game.at(8,23), game.at(9,23), game.at(10,23),game.at(11,23),game.at(12,23),game.at(13,23),
    game.at(14,23),game.at(15,23),game.at(16,23),game.at(17,23),game.at(18,23),game.at(19,23),game.at(20,23),
    game.at(21,23),game.at(22,23),game.at(23,23),game.at(24,23),game.at(25,23),game.at(26,23),game.at(27,23)]

  method construir() {
    self.construir(dibujo)
    self.agregarFantasmas()
    game.addVisual(muro)
  }
}