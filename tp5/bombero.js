function Bombero() {
  this.pos = createVector(width / 2, height / 2); // hace un vector para la pos inicial del bombero

  this.r = 50; // radio del bombero
  this.heading = 0; // angulo de la direc del bombero
  this.rotation = 0; // vel de rotacion del bombero
  this.vel = createVector(0, 0); // vector de vel del bombero
  this.isBoosting = false;

  this.boosting = function (b) {
    this.isBoosting = b; // activa o desactiva el impulso del bombero
  }

  this.update = function () {
    if (this.isBoosting) {
      this.boost(); // da un impulso al bombero
    }
    this.pos.add(this.vel); // actualiza la pos del bombero sumando la vel
    this.vel.mult(0.99); // da una resistencia para mover mas lento al bombero
  }

  this.boost = function () {
    var force = p5.Vector.fromAngle(this.heading); // hace un vector de fuerza en la direc del bombero
    force.mult(0.1); // aumenta la fuerza
    this.vel.add(force); // da como una aceleracion al bombero
  }

  this.hits = function (book) {
    var d = dist(this.pos.x, this.pos.y, book.pos.x, book.pos.y); // calcula la distancia entre el bombero y el libro
    if (d < this.r + book.r * 10) { // si la distancia es menor que los radios, colisiona
      return true;
    } else {
      return false;
    }
  }

  this.render = function() {
    push();
    translate(this.pos.x, this.pos.y);
    rotate(this.heading + PI / 2);
    image(bomberito, -this.r, -this.r, this.r * 2, this.r * 2); // carga y muestra la imagen del bombero
    pop();
  }

  this.edges = function () {
    if (this.pos.x > width + this.r) { // prueba si el bombero se sale de la pantalla X
      this.pos.x = -this.r; // lo hace aparecer del otro lado
    } else if (this.pos.x < -this.r) {
      this.pos.x = width + this.r;
    }
    if (this.pos.y > height + this.r) { // prueba si el bombero sale de la pantalla Y
      this.pos.y = -this.r; // lo hace aparecer del otro lado
    } else if (this.pos.y < -this.r) {
      this.pos.y = height + this.r;
    }
  }

  this.setRotation = function (a) {
    this.rotation = a; // vel de rotacion
  }

  this.turn = function () {
    this.heading += this.rotation; // gira el bombero segun la vel
  }
}
