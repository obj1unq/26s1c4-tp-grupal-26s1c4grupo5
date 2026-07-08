object recorrido{
    
    var property indiceVuelta = 0
    
    const vueltas = [vuelta, vuelta2, vuelta3, vuelta4, vuelta5, vuelta6, vuelta7, vuelta8, vuelta9]
    
    method vueltas() = vueltas
    
    method vueltaDesignada() {
        indiceVuelta = indiceVuelta + 1
        return vueltas.get(indiceVuelta - 1)
    }
    const vuelta =  [game.at(14, 18), game.at(15, 18), game.at(16, 18), game.at(17, 18), game.at(17, 17), 
                     game.at(17, 16), game.at(18, 16), game.at(19, 16), game.at(20, 16), game.at(20, 15), 
                     game.at(20, 14), game.at(20, 13), game.at(20, 12), game.at(19, 12), game.at(18, 12), 
                     game.at(17, 12), game.at(16, 12), game.at(15, 12), game.at(14, 12), game.at(13, 12), 
                     game.at(12, 12), game.at(11, 12), game.at(10, 12), game.at(9 , 12), game.at(8 , 12), 
                     game.at(7 , 12), game.at(7 , 13), game.at(7 , 14), game.at(7 , 15), game.at(7 , 16),
                     game.at(8 , 16), game.at(9 , 16), game.at(10, 16), game.at(10, 17), game.at(10, 18), 
                     game.at(11, 18), game.at(12, 18), game.at(13, 18)]

    const vuelta2 = [game.at(6 , 18), game.at(7 , 18), game.at(8 , 18), game.at(8 , 17), game.at(8 , 16),
                     game.at(7 , 16), game.at(7 , 15), game.at(7 , 14), game.at(6 , 14), game.at(5 , 14), 
                     game.at(5 , 15), game.at(5 , 16), game.at(5 , 17), game.at(5 , 18)]

    const vuelta3 = [game.at(21, 18), game.at(20, 18), game.at(19, 18), game.at(19, 17), game.at(19, 16),
                     game.at(20, 16), game.at(20, 15), game.at(20, 14), game.at(21, 14), game.at(22, 14), 
                     game.at(22, 15), game.at(22, 16), game.at(22, 17), game.at(22, 18)]

    const vuelta4 = [game.at(14, 22), game.at(15, 22), game.at(16, 22), game.at(17, 22), game.at(18, 22), 
                     game.at(19, 22), game.at(20, 22), game.at(21, 22), game.at(22, 22), game.at(22, 21), 
                     game.at(22, 20), game.at(21, 20), game.at(20, 20), game.at(19, 20), game.at(18, 20), 
                     game.at(17, 20), game.at(16, 20), game.at(16, 19), game.at(16, 18), game.at(15, 18), 
                     game.at(14, 18), game.at(13, 18), game.at(12, 18), game.at(12, 19), game.at(12, 20), 
                     game.at(11, 20), game.at(10, 20), game.at(9 , 20), game.at(8 , 20), game.at(7 , 20), 
                     game.at(6 , 20), game.at(6 , 21), game.at(6 , 22), game.at(7 , 22), game.at(8 , 22), 
                     game.at(9 , 22), game.at(10, 22), game.at(11, 22), game.at(12, 22), game.at(13, 22)]

    const vuelta5 = [game.at(14,  6), game.at(15,  6), game.at(16,  6), game.at(17,  6), game.at(18,  6), 
                     game.at(19,  6), game.at(20,  6), game.at(21,  6), game.at(22,  6), game.at(22,  7), 
                     game.at(22,  8), game.at(21,  8), game.at(20,  8), game.at(19,  8), game.at(18,  8), 
                     game.at(17,  8), game.at(16,  8), game.at(16,  9), game.at(16, 10), game.at(15, 10), 
                     game.at(14, 10), game.at(13, 10), game.at(12, 10), game.at(12,  9), game.at(12,  8), 
                     game.at(11,  8), game.at(10,  8), game.at(9 ,  8), game.at(8 ,  8), game.at(7 ,  8), 
                     game.at(6 ,  8), game.at(6 ,  7), game.at(6 ,  6), game.at(7 ,  6), game.at(8 ,  6), 
                     game.at(9 ,  6), game.at(10,  6), game.at(11,  6), game.at(12,  6), game.at(13,  6)]

    const vuelta6 = [game.at(14, 16), game.at(15, 16), game.at(16, 16), game.at(17, 16), game.at(18, 16),
                     game.at(18, 17), game.at(18, 18), game.at(19, 18), game.at(20, 18), game.at(21, 18),
                     game.at(22, 18), game.at(22, 17), game.at(22, 16), game.at(22, 15), game.at(22, 14),
                     game.at(22, 13), game.at(22, 12), game.at(22, 11), game.at(22, 10), game.at(21, 10),
                     game.at(20, 10), game.at(19, 10), game.at(18, 10), game.at(18, 11), game.at(18, 12),
                     game.at(17, 12), game.at(16, 12), game.at(15, 12), game.at(14, 12), game.at(13, 12),
                     game.at(12, 12), game.at(11, 12), game.at(10, 12), game.at(10, 11), game.at(10, 10),
                     game.at(9 , 10), game.at(8 , 10), game.at(7 , 10), game.at(6 , 10), game.at(6 , 11),
                     game.at(6 , 12), game.at(6 , 13), game.at(6 , 14), game.at(6 , 15), game.at(6 , 16),
                     game.at(6 , 17), game.at(6 , 18), game.at(7 , 18), game.at(8 , 18), game.at(9 , 18),
                     game.at(10, 18), game.at(10, 17), game.at(10, 16), game.at(11, 16), game.at(12, 16),
                     game.at(13, 16)]
    
    const vuelta7 = [game.at(1 , 13), game.at(1 , 14), game.at(1 , 15), game.at(1 , 16), game.at(1 , 17), 
                     game.at(1 , 18), game.at(1 , 19), game.at(1 , 20), game.at(1 , 21), game.at(2 , 21), 
                     game.at(3 , 21), game.at(3 , 20), game.at(3 , 19), game.at(3 , 18), game.at(3 , 17), 
                     game.at(3 , 16), game.at(3 , 15), game.at(4 , 15), game.at(5 , 15), game.at(6 , 15), 
                     game.at(7 , 15), game.at(8 , 15), game.at(9 , 15), game.at(9 , 14), game.at(9 , 13), 
                     game.at(9 , 12), game.at(9 , 11), game.at(9 , 10), game.at(9 ,  9), game.at(9 ,  8), 
                     game.at(9 ,  7), game.at(9 ,  6), game.at(8 ,  6), game.at(7 ,  6), game.at(6 ,  6), 
                     game.at(5 ,  6), game.at(4 ,  6), game.at(3 ,  6), game.at(3 ,  5), game.at(3 ,  4), 
                     game.at(3 ,  3), game.at(4 ,  3), game.at(5 ,  3), game.at(5 ,  2), game.at(5 ,  1),
                     game.at(4 ,  1), game.at(3 ,  1), game.at(2 ,  1), game.at(1 ,  1), game.at(1 ,  2), 
                     game.at(1 ,  3), game.at(1 ,  4), game.at(1 ,  5), game.at(1 ,  6), game.at(1 ,  7), 
                     game.at(1 ,  8), game.at(1 ,  9), game.at(1 , 10), game.at(1 , 11), game.at(1 , 12)]

    const vuelta8 = [game.at(26, 13), game.at(26, 14), game.at(26, 15), game.at(26, 16), game.at(26, 17), 
                     game.at(26, 18), game.at(26, 19), game.at(26, 20), game.at(26, 21), game.at(25, 21), 
                     game.at(24, 21), game.at(24, 20), game.at(24, 19), game.at(24, 18), game.at(24, 17), 
                     game.at(24, 16), game.at(24, 15), game.at(23, 15), game.at(22, 15), game.at(21, 15), 
                     game.at(20, 15), game.at(19, 15), game.at(18, 15), game.at(18, 14), game.at(18, 13), 
                     game.at(18, 12), game.at(18, 11), game.at(18, 10), game.at(18,  9), game.at(18,  8), 
                     game.at(18,  7), game.at(18,  6), game.at(19,  6), game.at(20,  6), game.at(21,  6), 
                     game.at(22,  6), game.at(23,  6), game.at(24,  6), game.at(24,  5), game.at(24,  4), 
                     game.at(24,  3), game.at(23,  3), game.at(22,  3), game.at(22,  2), game.at(22,  1), 
                     game.at(23,  1), game.at(24,  1), game.at(25,  1), game.at(26,  1), game.at(26,  2), 
                     game.at(26,  3), game.at(26,  4), game.at(26,  5), game.at(26,  6), game.at(26,  7), 
                     game.at(26,  8), game.at(26,  9), game.at(26, 10), game.at(26, 11), game.at(26, 12)]

    const vuelta9 = [game.at(14, 19), game.at(15, 19), game.at(15, 20), game.at(15, 21), game.at(16, 21), 
                     game.at(17, 21), game.at(17, 20), game.at(17, 19), game.at(17, 18), game.at(17, 17), 
                     game.at(17, 16), game.at(17, 15), game.at(18, 15), game.at(18, 14), game.at(18, 13), 
                     game.at(18, 12), game.at(18, 11), game.at(18, 10), game.at(17, 10), game.at(16, 10), 
                     game.at(15, 10), game.at(14, 10), game.at(13, 10), game.at(12, 10), game.at(11, 10), 
                     game.at(10, 10), game.at(9 , 10), game.at(9 , 11), game.at(9 , 12), game.at(9 , 13),
                     game.at(9 , 14), game.at(9 , 15), game.at(10, 15), game.at(10, 16), game.at(10, 17), 
                     game.at(10, 18), game.at(10, 19), game.at(10, 20), game.at(10, 21), game.at(11, 21), 
                     game.at(12, 21), game.at(12, 20), game.at(12, 19), game.at(13, 19)]
}