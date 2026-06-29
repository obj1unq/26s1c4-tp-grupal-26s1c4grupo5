import wollok.game.*

object tablero {
    method dentro(position) {
        return position.x().between(0, game.width() -1) and position.y().between(0, game.height() -1) 
    }
    method rangoI(position){
        return position.x().between(0, (game.width() - 1) / 2) and position.y().between(0, (game.height() -1) / 2)
    }
    method rangoD(position){
        return position.x().between((game.width() - 1) / 2, game.width() - 1) and position.y().between((game.height() -1) / 2, (game.height() -1))
    }
}

object direcciones{
    const dir = [arriba1, derecha1, abajo1, izquierda1]
    method dir() = dir
}
object izquierda1 {
    method siguiente(position) {
        return position.left(1)
    }
}
object derecha1 {
    method siguiente(position) {
        return position.right(1)
        
    }
}

object abajo1 {
    method siguiente(position) {
        return position.down(1)
    }
}

object arriba1 {
    method siguiente(position) {
        return position.up(1)
    }
}