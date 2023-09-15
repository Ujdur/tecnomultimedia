// Ujdur, María Sol
// Comisión 5
// Tp4
// Juego: Asteroids
// Video: https://youtu.be/nf-qdzZ97Pc


var ship; // variable para la nave
var asteroids = []; // arreglo para almacenar los asteroides
var lasers = []; // arreglo para almacenar los laser
var gameStarted = false; // para controlar si el juego arranco
var countdown = 5; // cuenta regresiva que al final no use jeje
var gameDuration = 60; // duracion del juego (1 minuto)
var startTime; // almacenar el tiempo de inicio del juego
var gameEnded = false; // para controlar si el juego termino



function setup() {
  createCanvas(windowWidth, windowHeight); // tamaño de la ventana
}



function draw() {
  background(0); // fondo negro

  if (!gameStarted && !gameEnded) { // pantalla de inicio
    // instrucciones y meta del juego
    textSize(64);
    fill(255);
    textAlign(CENTER, CENTER);
    text("¡Juego Asteroids!", width / 2, height / 2 - 100);
    textSize(25);
    text("INSTRUCCIONES: Movete con las flechitas y dispara con el espacio", width / 2, height / 2 - 20);
    text("META: Rompé todos los asteroides antes de que se termine el tiempo", width / 2, height / 2 + 40);
    textSize(35);
    text("Presiona R para jugar", width / 2, height / 2 + 150);

    if (keyIsPressed && key === 'r') { // comienzo del juego apretando la R
      gameStarted = true;
      startTime = millis(); // registra el tiempo de inicio
      ship = new Ship(); // la nave
      for (var i = 0; i < 5; i++) {
        asteroids.push(new Asteroid()); // hace 5 asteroides
      }
    }
  } else { // juego andando
    var elapsedTime = (millis() - startTime) / 1300; // calcula el tiempo desde el inicio



    // muestra el tiempo en la esquina izquierda
    textSize(32);
    fill(255);
    textAlign(LEFT, TOP);
    var remainingTime = int(max(gameDuration - elapsedTime, 0));
    text("Tiempo: " + remainingTime, 20, 20);

    if (!gameEnded) {
      // bucle de asteroides PRUEBA COLISIONES
      for (var i = 0; i < asteroids.length; i++) {
        if (ship.hits(asteroids[i])) { // prueba que hice para que la nave se choque los asteroide
          console.log('perdiste paa'); // si tocas los asteroides perdes pero no sale ninguna pantalla
        }
        asteroids[i].render(); // dibuja el asteroide
        asteroids[i].update(); // actualiza la pos del asteroide
        asteroids[i].edges(); // maneja los bordes del asteroide
      }


      //laser
      for (var i = lasers.length - 1; i >= 0; i--) {
        lasers[i].render(); // dibuja el laser
        lasers[i].update(); // actualiza la pos del laser
        if (lasers[i].offscreen()) { // comprueba si el laser esta afuera de la pantalla
          lasers.splice(i, 1); // borra el laser si esta afuera
        } else {
          for (var j = asteroids.length - 1; j >= 0; j--) {
            if (lasers[i].hits(asteroids[j])) { // comprueba si el laser golpeo un asteroide
              if (asteroids[j].r > 10) {
                var newAsteroids = asteroids[j].breakup(); // divide los asteroides
                asteroids = asteroids.concat(newAsteroids);
              }
              asteroids.splice(j, 1); // elimina los asteroide
              lasers.splice(i, 1); // borra el laser
              break;
            }
          }
        }
      }

      ship.render(); // dibuja la nave
      ship.turn(); // gira la nave
      ship.update(); // actualiza la pos de la nave
      ship.edges(); // maneja los bordes de la nave


      //PANTALLA GANAR O PERDER
      if (remainingTime === 0) { // ve si el tiempo llega a cero
        gameEnded = true;
      }
    } else { // perder o ganar
      // Muestra "WIN" o "GAME OVER"
      textSize(64);
      textAlign(CENTER, CENTER);
      if (asteroids.length === 0) {
        fill(0, 255, 0); // color verde si ganaste
        text("WIN", width / 2, height / 2);
      } else {
        fill(255, 0, 0); // color rojo si perdiste
        text("GAME OVER", width / 2, height / 2);
      }

      // instrucción para reiniciar
      textSize(32);
      fill(255);
      text("Presiona R para volver a jugar", width / 2, height / 2 + 100);

      if (keyIsPressed && key === 'r') { // Reiniciar el juego si tocamos R
        gameStarted = false;
        gameEnded = false;
        countdown = 5;
        asteroids = [];
        lasers = [];
      }
    }
  }
}

function keyReleased() {
  ship.setRotation(0); // frena la rotacion de la nave si suelto la tecla
  ship.boosting(false); // frena el impulso de la nave si suelto la tecla
}

function keyPressed() { // como se maneja la nave
  if (key == ' ') {
    lasers.push(new Laser(ship.pos, ship.heading)); // dispara el laser
  } else if (keyCode == RIGHT_ARROW) {
    ship.setRotation(0.1); // girar a la derecha
  } else if (keyCode == LEFT_ARROW) {
    ship.setRotation(-0.1); // girar a la izquierda
  } else if (keyCode == UP_ARROW) {
    ship.boosting(true); // ir para adelante / impulso
  }
}



function Asteroid(pos, r) {
  if (pos) {
    this.pos = pos.copy(); // crea el asteroide en la pos que da
  } else {
    this.pos = createVector(random(width), random(height)); // sino hace el asteroide en una pos aleatoria
  }
  if (r) {
    this.r = r * 0.5; // el radio del asteroide como la mitad de ese valor
  } else {
    this.r = random(15, 50); // sino da el radio del asteroide como un valor aleatorio entre 15 y 50
  }

  this.vel = p5.Vector.random2D(); // velocidad aleatoria al asteroide
  this.total = floor(random(5, 15)); // numero de vertices del asteroide entre 5 y 15
  this.offset = [];
  for (var i = 0; i < this.total; i++) {
    this.offset[i] = random(-this.r * 0.5, this.r * 0.5); // hace un arreglo de desplazamientos aleatorios para los vertices
  }

  this.update = function () {
    this.pos.add(this.vel); // actualiza la pos del asteroide y suma la vel
  }

  this.render = function () {
    push();
    stroke(255);
    noFill();
    translate(this.pos.x, this.pos.y);

    beginShape();
    for (var i = 0; i < this.total; i++) {
      var angle = map(i, 0, this.total, 0, TWO_PI);
      var r = this.r + this.offset[i];
      var x = r * cos(angle);
      var y = r * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);

    pop();
  }

  this.breakup = function () {
    var newA = [];
    newA[0] = new Asteroid(this.pos, this.r); // hace dos asteroides del mas grande
    newA[1] = new Asteroid(this.pos, this.r);
    return newA;
  }

  this.edges = function () {
    if (this.pos.x > width + this.r) {
      this.pos.x = -this.r; // hace que el asteroide aparezca del otro lado de la pantalla si se va
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

// laser
function Laser(spos, angle) {
  this.pos = createVector(spos.x, spos.y); // hace un vector para la pos del laser
  this.vel = p5.Vector.fromAngle(angle); // hace un vector por el angulo
  this.vel.mult(10); // aumenta la vel x 10

  this.update = function () {
    this.pos.add(this.vel); // actualiza la pos del laser sumando la vel
  }

  this.render = function () {
    push(); // abre
    stroke(255); // linea blanca
    strokeWeight(4); // grosor de la linea
    point(this.pos.x, this.pos.y); // dibuja un punto en la posic del laser
    pop(); // cierra
  }


//colision laser asteroide
  this.hits = function (asteroid) {
    var d = dist(this.pos.x, this.pos.y, asteroid.pos.x, asteroid.pos.y); // calcula la distancia entre el laser y el asteroide
    if (d < asteroid.r) { // si la distancia es menor que el radio del asteroid va a chocar
      return true;
    } else {
      return false;
    }
  }


// si el laser esta afuera de la pantalla
  this.offscreen = function () {
    if (this.pos.x > width || this.pos.x < 0) { // prueba si el laser esta afuera de la pantalla X
      return true;
    }
    if (this.pos.y > height || this.pos.y < 0) { // prueba si el laser esta afuera de la pantalla Y
      return true;
    }
    return false;
  }
}



function Ship() {
  this.pos = createVector(width / 2, height / 2); // hace un vector para la pos inicial de la nave

  this.r = 20; // radio de la nave
  this.heading = 0; // angulo de direc de la nave
  this.rotation = 0; // vel de rotacion de la nave
  this.vel = createVector(0, 0); // vector de vel de la nave
  this.isBoosting = false;

  this.boosting = function (b) {
    this.isBoosting = b; // activa o desactiva el impulso de la nave
  }

  this.update = function () {
    if (this.isBoosting) {
      this.boost(); // da un impulso a la nave si esta activado
    }
    this.pos.add(this.vel); // actualiza la pos de la nave sumando la vel
    this.vel.mult(0.99); // da una resistencia para mover mas lento la nave
  }

  this.boost = function () {
    var force = p5.Vector.fromAngle(this.heading); // hace un vector de fuerza en la direc de la nave
    force.mult(0.1); // aumenta la fuerza
    this.vel.add(force); // da la fuerza como una aceleracion a la nave
  }

  this.hits = function (asteroid) {
    var d = dist(this.pos.x, this.pos.y, asteroid.pos.x, asteroid.pos.y); // calcula la distancia entre la nave y el asteroide
    if (d < this.r + asteroid.r) { // si la distancia es menor que la suma de los radios colisiona
      return true;
    } else {
      return false;
    }
  }

  this.render = function () {
    push(); // guarda la configuracion de renderizado
    translate(this.pos.x, this.pos.y); // coordenadas al centro de la nave
    rotate(this.heading + PI / 2); // rota la nave segun la direc
    fill(0); // color de relleno negro
    stroke(255); // linea blanca
    triangle(-this.r, this.r, this.r, this.r, 0, -this.r); // dibuja la nave como un triangulo
    pop(); // restaura la configuracion
  }

  this.edges = function () {
    if (this.pos.x > width + this.r) { // prueba si la nave esta afuera de la pantalla X
      this.pos.x = -this.r; // la hace aparecer del otro lado
    } else if (this.pos.x < -this.r) {
      this.pos.x = width + this.r;
    }
    if (this.pos.y > height + this.r) { // prueba si la nave esta afuera de la pantalla Y
      this.pos.y = -this.r; // la hace aparecer del otro lado
    } else if (this.pos.y < -this.r) {
      this.pos.y = height + this.r;
    }
  }

  this.setRotation = function (a) {
    this.rotation = a; // vel de rotacion
  }

  this.turn = function () {
    this.heading += this.rotation; // gira la nave segun la vel
  }
}
