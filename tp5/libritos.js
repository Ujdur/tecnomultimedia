function Book(pos, r) {
  if (pos) {
    this.pos = pos.copy(); // crea el libro en la posicion que se da
  } else {
    this.pos = createVector(random(width), random(height)); // si no, hace el libro en una posicion aleatoria
  }
  if (r) {
    this.r = r * 0.5; // el radio del libro como la mitad de ese valor
  } else {
    this.r = random(15, 50); // si no se da el radio del libro como un valor aleatorio entre 15 y 50
  }

  this.vel = p5.Vector.random2D(); // velocidad aleatoria para el libro
  this.total = floor(random(5, 15)); // número de vértices del libro entre 5 y 15
  this.offset = [];
  for (var i = 0; i < this.total; i++) {
    this.offset[i] = random(-this.r * 0.5, this.r * 0.5); // hace un arreglo de desplazamientos randoms para los vertices
  }

  this.update = function () {
    this.pos.add(this.vel); // actualiza la pos del libro y suma la velocidad
  }

  this.render = function() {
    push();
    translate(this.pos.x, this.pos.y);
    for (var i = 0; i < this.total; i++) {
      var angle = map(i, 0, this.total, 0, TWO_PI);
      var x = (this.r + this.offset[i]) * cos(angle);
      var y = (this.r + this.offset[i]) * sin(angle);
      image(booksImage, x, y, this.r * 2, this.r * 2); // carga y muestra la imagen del libro
    }
    pop();
  }

  this.breakup = function () {
    var newBooks = [];
    newBooks[0] = new Book(this.pos, this.r); // hace dos libros del mas grande
    newBooks[1] = new Book(this.pos, this.r);
    return newBooks;
  }

  this.edges = function () {
    if (this.pos.x > width + this.r) {
      this.pos.x = -this.r; // hace que el libro aparezca del otro lado de la pantalla si se va
    } else if (this.pos.x < -this.r) {
      this.pos.x = width + this.r;
    }
    if (this.pos.y > height + this.r) {
      this.pos.y = -this.r;
    } else if (this.pos.y < -this.r) {
      this.pos.y = height + this.r;
    }
  }
}
