import wollok.game.*

object animacionIntro{
    var indice = 0
    const frases = ["Amarillo", "Verde", "Rojo", "Azul"]
    const imaPak = ["abierta", "mcerrada", "cerrada", "mabierta"]
    method animarFrase(){game.onTick(100, "AnimarPressAny", {self.aumentarIndice()})}
    method frase() = frases.get(indice)
    method imaPak() = imaPak.get(indice)
    method aumentarIndice(){indice = (indice + 1) % frases.size()} // Voy aumentando el valor del indice y cuando llegue al final, vuelve a 0
}

object anyKey{
    const position = game.at(8,5)
    method position() = position
    method image() = "Key" + animacionIntro.frase() + ".png"
}

object aniPak{
    var property position = game.at(0,14)
    method avanzar() {game.onTick(400, "Mover AniPak", {position = position.right(2)})}
    method image() = "pak-derecha2-" + animacionIntro.imaPak() + ".png"
}
object cartel{
    var property position = game.at(3,20)
    method image() = "titulopak21100.png"
}