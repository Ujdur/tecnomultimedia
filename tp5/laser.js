function Laser(spos, angle) {
  this.pos = createVector(spos.x, spos.y); // hace un vector para la pos del laser
  this.vel = p5.Vector.fromAngle(angle); // hace un vector por el angulo
  this.vel.mult(10); // aumenta la velocidad x10

  this.update = function () {
    this.pos.add(this.vel); // actualiza la pos del laser sumando la velocidad
  }

  this.render = function () {
    push(); // abre
    stroke(255, 0, 0); // linea blanca
    strokeWeight(6); // grosor de la linea
    point(this.pos.x, this.pos.y); // dibuja un punto en la pos del laser
    pop(); // cierra
  }

  //colision laser libro
  this.hits = function (book) {
    var d = dist(this.pos.x, this.pos.y, book.pos.x, book.pos.y); // calcula la distancia entre el laser y el libro
    if (d < book.r * 3) { // si la distancia es menor que el radio x3 del libro, va a chocar
      return true;
    } else {
      return false;
    }
  }

  // si el laser esta a fuera de la pantalla
  this.offscreen = function () {
    if (this.pos.x > width || this.pos.x < 0) { // prueba si el laser sale de la pantalla X
      return true;
    }
    if (this.pos.y > height || this.pos.y < 0) { // prueba si el laser sale de la pantalla Y
      return true;
    }
    return false;
  }
}
