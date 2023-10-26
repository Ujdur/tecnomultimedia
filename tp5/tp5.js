// Ujdur, María Sol
// Comisión 5
// TP5

var bombero; // variable para el bombero
var books = []; // arreglo para almacenar los libros
var lasers = []; // arreglo para almacenar los lasers
var gameStarted = false; // para controlar si el juego arranco
var countdown = 5; // cuenta regresiva que al final no use jeje
var gameDuration = 60; // duración del juego (mas o menos 1 minuto)
var startTime; // almacena el tiempo del inicio del juego
var gameEnded = false; // para controlar si el juego termino

var bomberito; // variable para la imagen del bombero
var booksImage; // variable para la imagen de los libros
//var fuego; // Variable para la imagen del laser

function preload() {
  // carga las imagenes antes de iniciar el juego
  bomberito = loadImage("png1.png");
  booksImage = loadImage("libros.png");
  //fuego = loadImage("fire.png");
}

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
    text("¡Juego de FAHRENHEIT 451!", width / 2, height / 2 - 100);
    textSize(25);
    text("INSTRUCCIONES: Movete con las flechitas y dispara con el espacio", width / 2, height / 2 - 20);
    text("META: Quemá todos los libros antes de que se termine el tiempo", width / 2, height / 2 + 40);
    textSize(35);
    text("Presiona R para jugar", width / 2, height / 2 + 150);

    if (keyIsPressed && key === 'r') { // comienzo del juego apretando la R
      gameStarted = true;
      startTime = millis(); // registra el tiempo de inicio
      bombero = new Bombero(); // el bombero
      for (var i = 0; i < 5; i++) {
        books.push(new Book()); // hace 5 libros
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
      // bucle de libros PRUEBA COLISIONES
      for (var i = 0; i < books.length; i++) {
        if (bombero.hits(books[i])) { // prueba que hice para que el bombero se choque con los libros
          console.log('perdiste paa'); // si tocas los libros, perdes, pero no sale ninguna pantalla
        }
        books[i].render(); // dibuja el libro
        books[i].update(); // actualiza la posición del libro
        books[i].edges(); // maneja los bordes del libro
      }

      //laser
      for (var i = lasers.length - 1; i >= 0; i--) {
        lasers[i].render(); // dibuja el laser
        lasers[i].update(); // actualiza la posicion del laser
        if (lasers[i].offscreen()) { // comprueba si el laser esta afuera de la pantalla
          lasers.splice(i, 1); // borra el laser si esta afuera
        } else {
          for (var j = books.length - 1; j >= 0; j--) {
            if (lasers[i].hits(books[j])) { // comprueba si el laser golpeo un libro
              if (books[j].r > 10) {
                var newBooks = books[j].breakup(); // divide los libros
                books = books.concat(newBooks);
              }
              books.splice(j, 1); // elimina los libros
              lasers.splice(i, 1); // borra el laser
              break;
            }
          }
        }
      }

      bombero.render(); // dibuja el bombero
      bombero.turn(); // gira el bombero
      bombero.update(); // actualiza la posicion del bombero
      bombero.edges(); // maneja los bordes del bombero

      //PANTALLA GANAR O PERDER
      if (remainingTime === 0) { // ve si el tiempo llega a cero
        gameEnded = true;
      }
    } else { // perder o ganar
      textSize(64);
      textAlign(CENTER, CENTER);
      if (books.length === 0) {
        fill(0, 255, 0); // color verde si ganaste
        text("LOS BOMBEROS GANAN", width / 2, height / 2);
      } else {
        textSize(50);
        fill(255, 0, 0); // color rojo si perdiste
        text("LOS REBELDES LOGRARON LA REVOLUCIÓN :(", width / 2, height / 2);
      }

      // instrucción para reiniciar
      textSize(32);
      fill(255);
      text("Presiona R para volver a jugar", width / 2, height / 2 + 100);

      if (keyIsPressed && key === 'r') { // Reiniciar el juego si tocas R
        gameStarted = false;
        gameEnded = false;
        countdown = 5;
        books = [];
        lasers = [];
      }
    }
  }
}

function keyReleased() {
  bombero.setRotation(0); // frena la rotacion del bombero si soltas la tecla
  bombero.boosting(false); // frena el impulso del bombero si soltas la tecla
}

function keyPressed() { // como se maneja el bombero
  if (key == ' ') {
    lasers.push(new Laser(bombero.pos, bombero.heading)); // dispara el laser
  } else if (keyCode == RIGHT_ARROW) {
    bombero.setRotation(0.1); // girar a la derecha
  } else if (keyCode == LEFT_ARROW) {
    bombero.setRotation(-0.1); // girar a la izquierda
  } else if (keyCode == UP_ARROW) {
    bombero.boosting(true); // ir para adelante / impulso
  }
}
