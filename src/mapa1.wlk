import wollok.game.*
import mapas.*
import intro.*
import objetos.*

object mapa1 inherits Mapa (puntosPorMapa = 490) {
    const muro = new Muro(position = game.at(4,9), imagen = "muroMapa1.png") // creo un muro con la imagen de todas las paredes.
    const dibujo =[
    //    0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 28
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 27
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 26
        [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 25
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 24
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 23
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 22
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 21
        [ h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 20
        [ _, _, _, _, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, _, _, _, _ ], // 19
        [ _, _, _, _, m, _, c, _, c, m, c, _, c, _, c, _, c, _, m, _, c, _, _, m, _, _, _, _ ], // 18
        [ _, _, _, _, m, c, m, m, _, m, _, m, m, m, m, m, m, c, m, c, m, m, _, m, _, _, _, _ ], // 17
        [ _, _, _, _, m, _, m, _, c, _, c, _, c, _, c, _, c, _, c, _, c, m, c, m, _, _, _, _ ], // 16
        [ _, _, _, _, m, c, m, c, m, m, _, m, m, _, _, m, m, c, m, m, _, m, _, m, _, _, _, _ ], // 15
        [ _, _, _, _, m, _, c, _, c, _, c, m, _, _, _, _, m, _, c, _, c, _, c, m, _, _, _, _ ], // 14
        [ _, _, _, _, m, c, m, c, m, m, _, m, m, m, m, m, m, c, m, m, _, m, _, m, _, _, _, _ ], // 13
        [ _, _, _, _, m, _, m, _, c, _, c, _, c, _, c, _, c, _, c, _, c, m, c, m, _, _, _, _ ], // 12
        [ _, _, _, _, m, c, m, m, _, m, _, m, m, m, m, m, m, c, m, c, m, m, _, m, _, _, _, _ ], // 11
        [ _, _, _, _, m, _, c, _, c, m, c, _, c, p, c, _, c, _, m, _, c, _, c, m, _, _, _, _ ], // 10
        [ _, _, _, _, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, m, _, _, _, _ ], // 9
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 8
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 7
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 6
        [ _, h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 5
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 4
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 3
        [ _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 2
        [ v, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _ ], // 1
        [ g, h, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, v, _, _, _ ]  // 0
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta
    
    override method obstaculos() = [
        game.at(4,9),  game.at(5,9),  game.at(6,9),  game.at(7,9),  game.at(8,9),  game.at(9,9),  game.at(10,9),
        game.at(11,9), game.at(12,9), game.at(13,9), game.at(14,9), game.at(15,9), game.at(16,9), game.at(17,9),
        game.at(18,9), game.at(19,9), game.at(20,9), game.at(21,9), game.at(22,9), game.at(23,9),
        game.at(4,10), game.at(9,10), game.at(18,10),game.at(23,10),
        game.at(4,11), game.at(6,11), game.at(7,11), game.at(9,11), game.at(11,11),game.at(12,11),game.at(13,11),
        game.at(14,11),game.at(15,11),game.at(16,11),game.at(18,11),game.at(20,11),game.at(21,11),game.at(23,11),
        game.at(4,12), game.at(6,12), game.at(21,12),game.at(23,12),
        game.at(4,13), game.at(6,13), game.at(8,13), game.at(9,13), game.at(11,13),game.at(12,13),game.at(13,13),
        game.at(14,13),game.at(15,13),game.at(16,13),game.at(18,13),game.at(19,13),game.at(21,13),game.at(23,13),
        game.at(4,14), game.at(11,14),game.at(16,14),game.at(23,14),
        game.at(4,15), game.at(6,15), game.at(8,15), game.at(9,15), game.at(11,15),game.at(12,15),game.at(15,15),
        game.at(16,15),game.at(18,15),game.at(19,15),game.at(21,15),game.at(23,15),
        game.at(4,16), game.at(6,16), game.at(21,16),game.at(23,16),
        game.at(4,17), game.at(6,17), game.at(7,17), game.at(9,17), game.at(11,17),game.at(12,17),game.at(13,17),
        game.at(14,17),game.at(15,17),game.at(16,17),game.at(18,17),game.at(20,17),game.at(21,17),game.at(23,17),
        game.at(4,18), game.at(9,18), game.at(18,18),game.at(23,18),
        game.at(4,19), game.at(5,19), game.at(6,19), game.at(7,19), game.at(8,19), game.at(9,19), game.at(10,19),
        game.at(11,19),
        game.at(12,19),game.at(13,19),game.at(14,19),game.at(15,19),game.at(16,19),game.at(17,19),game.at(18,19),
        game.at(19,19),
        game.at(20,19),game.at(21,19),game.at(22,19),game.at(23,19)]

    method construir() {
        self.construir(dibujo)
        self.agregarFantasmas()
        game.addVisual(muro)
    }
    
    method muro() = muro // metodo unicamente utilizado para test.
}