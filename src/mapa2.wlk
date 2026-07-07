import wollok.game.*
import mapas.*
import objetos.*

object mapa2 inherits Mapa (puntosPorMapa = 1410) {
    const muro = new Muro(position = game.at(5,5), imagen = "muroMapa2.png") // creo un muro con la imagen de todas las paredes.
    const dibujo =[
    //    0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 28
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 27
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 26
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 25
        [ h, _, _, _, _, s, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 24
        [ _, _, _, _, _, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, _, _, _, _ ], // 23
        [ _, _, _, _, _, m, _, c, _, c, _, c, _, c, _, c, _, c, _, c, _, c, _, m, _, _, _, _ ], // 22
        [ _, _, _, _, _, m, c, m, m, m, m, m, m, m, c, m, m, m, m, m, m, m, c, m, _, _, _, _ ], // 21
        [ _, _, _, _, _, m, _, c, _, c, _, c, _, m, _, m, _, c, _, c, _, c, _, m, _, _, _, _ ], // 20
        [ _, _, _, _, _, m, m, m, m, m, m, m, c, m, c, m, c, m, m, m, m, m, m, m, _, _, _, _ ], // 19
        [ _, _, _, _, _, m, _, c, _, c, _, m, _, c, _, c, _, m, _, c, _, c, _, m, _, _, _, _ ], // 18
        [ _, _, _, _, _, m, c, m, m, m, c, m, m, m, c, m, m, m, c, m, m, m, c, m, _, _, _, _ ], // 17
        [ _, _, _, _, _, m, _, c, m, c, _, c, _, c, _, c, _, c, _, c, m, c, _, m, _, _, _, _ ], // 16
        [ _, _, _, _, _, m, c, m, m, m, m, m, m, _, c, _, m, m, m, m, m, m, c, m, _, _, _, _ ], // 15
        [ _, _, _, _, _, m, _, c, _, c, _, c, _, c, p, c, _, c, _, c, _, c, _, m, _, _, _, _ ], // 14
        [ _, _, _, _, _, m, c, m, m, m, m, m, m, _, c, _, m, m, m, m, m, m, c, m, _, _, _, _ ], // 13
        [ _, _, _, _, _, m, _, c, m, c, _, c, _, c, _, c, _, c, _, c, m, c, _, m, _, _, _, _ ], // 12
        [ _, _, _, _, _, m, c, m, m, m, c, m, m, m, c, m, m, m, c, m, m, m, c, m, _, _, _, _ ], // 11
        [ _, _, _, _, _, m, _, c, _, c, _, m, _, c, _, c, _, m, _, c, _, c, _, m, _, _, _, _ ], // 10
        [ _, _, _, _, _, m, m, m, m, m, m, m, c, m, c, m, c, m, m, m, m, m, m, m, _, _, _, _ ], // 9
        [ _, _, _, _, _, m, _, c, _, c, _, c, _, m, _, m, _, c, _, c, _, c, _, m, _, _, _, _ ], // 8
        [ _, _, _, _, _, m, c, m, m, m, m, m, m, m, c, m, m, m, m, m, m, m, c, m, _, _, _, _ ], // 7
        [ _, _, _, _, _, m, _, c, _, c, _, c, _, c, _, c, _, c, _, c, _, c, _, m, _, _, _, _ ], // 6
        [ _, _, _, _, _, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, _, _, _, _ ], // 5
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 4
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 3
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 2
        [ v, v, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 1
        [ g, h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, v, _, _, _ ]  // 0
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta

    override method obstaculos() = [
        game.at(5,5),  game.at(6,5),  game.at(7,5),  game.at(8,5),  game.at(9,5),  game.at(10,5), game.at(11,5),
        game.at(12,5), game.at(13,5), game.at(14,5), game.at(15,5), game.at(16,5), game.at(17,5), game.at(18,5),
        game.at(19,5), game.at(20,5), game.at(21,5), game.at(22,5), game.at(23,5),
        game.at(5,6),  game.at(23,6),
        game.at(5,7),  game.at(7,7),  game.at(8,7),  game.at(9,7),  game.at(10,7), game.at(11,7), game.at(12,7),
        game.at(13,7), game.at(15,7), game.at(16,7), game.at(17,7), game.at(18,7), game.at(19,7), game.at(20,7),
        game.at(21,7), game.at(23,7),
        game.at(5,8),  game.at(13,8), game.at(15,8), game.at(23,8),
        game.at(5,9),  game.at(6,9),  game.at(7,9),  game.at(8,9),  game.at(9,9),  game.at(10,9), game.at(11,9),
        game.at(13,9), game.at(15,9), game.at(17,9), game.at(18,9), game.at(19,9), game.at(20,9), game.at(21,9),
        game.at(22,9), game.at(23,9),
        game.at(5,10), game.at(11,10),game.at(17,10),game.at(23,10),
        game.at(5,11), game.at(7,11), game.at(8,11), game.at(9,11), game.at(11,11),game.at(12,11),game.at(13,11),
        game.at(15,11),game.at(16,11),game.at(17,11),game.at(19,11),game.at(20,11),game.at(21,11),game.at(23,11),
        game.at(5,12), game.at(8,12), game.at(20,12),game.at(23,12),
        game.at(5,13), game.at(7,13), game.at(8,13), game.at(9,13), game.at(10,13),game.at(11,13),game.at(12,13),
        game.at(16,13),game.at(17,13),game.at(18,13),game.at(19,13),game.at(20,13),game.at(21,13),game.at(23,13),
        game.at(5,14), game.at(23,14),
        game.at(5,15), game.at(7,15), game.at(8,15), game.at(9,15), game.at(10,15),game.at(11,15),game.at(12,15),
        game.at(16,15),game.at(17,15),game.at(18,15),game.at(19,15),game.at(20,15),game.at(21,15),game.at(23,15),
        game.at(5,16), game.at(8,16), game.at(20,16),game.at(23,16),
        game.at(5,17), game.at(7,17), game.at(8,17), game.at(9,17), game.at(11,17),game.at(12,17),game.at(13,17),
        game.at(15,17),game.at(16,17),game.at(17,17),game.at(19,17),game.at(20,17),game.at(21,17),game.at(23,17),
        game.at(5,18), game.at(11,18),game.at(17,18),game.at(23,18),
        game.at(5,19), game.at(6,19), game.at(7,19), game.at(8,19), game.at(9,19), game.at(10,19),game.at(11,19),
        game.at(13,19),game.at(15,19),game.at(17,19),game.at(18,19),game.at(19,19),game.at(20,19),game.at(21,19),
        game.at(22,19),game.at(23,19),
        game.at(5,20), game.at(13,20),game.at(15,20),game.at(23,20),
        game.at(5,21), game.at(7,21), game.at(8,21), game.at(9,21), game.at(10,21),game.at(11,21),game.at(12,21),
        game.at(13,21),game.at(15,21),game.at(16,21),game.at(17,21),game.at(18,21),game.at(19,21),game.at(20,21),
        game.at(21,21),game.at(23,21),
        game.at(5,22), game.at(23,22),
        game.at(5,23), game.at(6,23), game.at(7,23), game.at(8,23), game.at(9,23), game.at(10,23),game.at(11,23),
        game.at(12,23),game.at(13,23),game.at(14,23),game.at(15,23),game.at(16,23),game.at(17,23),game.at(18,23),
        game.at(19,23),game.at(20,23),game.at(21,23),game.at(22,23),game.at(23,23)]
    
    method construir() {
        self.construir(dibujo)
        game.addVisual(muro)
    }
}