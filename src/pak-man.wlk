import juego.*

object pak {

    var posicionInicial           = game.at(0, 0)
    var property vidas            = 3
    var property puntos           = 0
    var property position         = game.at(0, 0)
    var property puedeMoverse     = true
    var property orientacionConst = quieto
    var property tieneBocaAbierta = false

    method tieneMasVidas()        = vidas > 0
    method image()                = "pak-" + orientacionConst.nombreDir() + "-boca-" + self.moverBoca() + ".png"
    method puedeMoverseHacia(dir) = puedeMoverse and self.puedeIr(dir)
    method puedeIr(direccion)     = (!juego.hayObstaculo(direccion.siguiente(position)))
    method estaEnMovimiento()     = self.puedeIr(orientacionConst)
    method moverBoca(){
      if (tieneBocaAbierta){
        return "cerrada"
        } 
        return "abierta" 
    }

    method posicionInicial(posicion){ posicionInicial = posicion }
    method cambiarOrientacionSiPuede(futuraDireccion){
      if (self.puedeMoverseHacia(futuraDireccion)){
          orientacionConst = futuraDireccion
          juego.reiniciarMovimientoDeProta(self)
      }
    }
    method mover(){
      if (self.puedeMoverseHacia(orientacionConst)){
          position = orientacionConst.siguiente(position)
          self.alternarBoca()
      }
    }
    method alternarBoca(){
        tieneBocaAbierta = !tieneBocaAbierta
    }
    method perderVida(){
      vidas -= 1
      juego.actualizarVidasDePak(self.vidas())
    }
    method reiniciarse(){
      self.reaparecer()
    }
    method puedeMoverse(bool){puedeMoverse = bool}
    method reaparecer(){
      juego.desaparecer(self)
      self.volverAPosicionInicial()
      juego.aparecer(self)
      self.puedeMoverse(true)
    }
    method reiniciarEstado(){
      vidas = 3
      puntos = 0
      self.volverAPosicionInicial()
      self.puedeMoverse(false)
    }
    method volverAPosicionInicial(){
      position = posicionInicial
      orientacionConst = quieto
    }
    method sumarPuntos(cantidad){
      puntos += cantidad
      juego.actualizarPuntuacion(puntos)
    }
}

object quieto{
    method siguiente(position) = position
    method nombreDir() = "derecha"
}

object derecha {
  method siguiente(position) { return position.right(1) }
  method nombreDir() = "derecha"
}

object abajo {
  method siguiente(position) { return position.down(1) }
  method nombreDir() = "abajo"
}

object arriba {
  method siguiente(position) { return position.up(1) }
  method nombreDir() = "arriba"
}

object izquierda {
    method siguiente(position) { return position.left(1) }
    method nombreDir() = "izquierda"
}