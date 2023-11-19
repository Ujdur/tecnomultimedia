// Ujdur, María Sol
// Comisión 5
// Recuperatorio tp4
// Juego: PONG

let gameStarted = false; // controla si el juego comenzo
let creditsScreen = false; // controla la pantalla de creditos
let winScreen = false; // controla la pantalla para ganar
let gameLost = false; // controla la pantalla para perder
let button; // boton de creditos
let backButton; // boton para volver atras
let restartButton; // boton de reinicio

let PelotaX, PelotaY; // coordenadas de la pelota
let PelotaXvel, PelotaYvel; // velocidad de la pelota

let BaseX, BaseWidth, BaseHeight; // coordenadas y dimensiones de la paleta

// ladrillos
let brickHorizontal, brickVertical, brickWidth, brickHeight; // configuracion de los ladrillos
let bricks; // almacenamiento los ladrillos
let brickDistance; // espacio entre ladrillos

let score; // puntos

let victoryTitle = "¡Victoria!"; // titulo para la pantalla de ganar
let victoryMessage = "Presiona para reiniciar"; // texto r para la pantalla de victoria

function setup() {
  createCanvas(400, 400); // pantalla
  showInstructions(); // instrucciones

  // inicio del juego
  PelotaX = width / 2; // posX de la pelota
  PelotaY = height - 30; // posY de la pelota
  PelotaXvel = 5; // velX de la pelota
  PelotaYvel = -5; // velY de la pelota
  BaseX = (width - 60) / 2; // posX de la paleta
  BaseWidth = 60; // ancho de la paleta
  BaseHeight = 10; // alto de la paleta
  brickHorizontal = 5; // cantidad de ladrillos horizontales
  brickVertical = 8; // cantidad d ladrillos verticales
  brickWidth = 40; // ancho de los ladrillos
  brickHeight = 15; // alto de los ladrillos
  brickDistance = 10; // espacio entre ladrillos
  score = 0; // score inicial

  // inicio de los ladrillos
  bricks = [];
  for (let c = 0; c < brickVertical; c++) {
    bricks[c] = [];
    for (let r = 0; r < brickHorizontal; r++) {
    bricks[c][r] = { x:
    0, y:
    0, status:
      1
    };
  }
}

// boton de creditos
button = createButton('Créditos');
button.position(width / 2 - 50, height / 2 + 80);
button.mousePressed(showCredits);

// boton de reinicio
restartButton = createButton('Reiniciar');
restartButton.size(120, 40);
restartButton.position(width / 2 - 60, height / 2 + 80);
restartButton.mousePressed(restartGame);
restartButton.hide(); // esconde el boton de reinicio al principio
}

function draw() {
  if (gameStarted && !creditsScreen) {

    background(0); // Fondo negro

    // ladrillos
    let remainingBricks = 0; // cuantos ladrillos quedan
    for (let c = 0; c < brickVertical; c++) {
      for (let r = 0; r < brickHorizontal; r++) {
        let brick = bricks[c][r];
        if (brick.status === 1) {
          let brickX = c * (brickWidth + brickDistance) + brickDistance;
          let brickY = r * (brickHeight + brickDistance) + brickDistance;
          fill(255); // color de los ladrillos
          rect(brickX, brickY, brickWidth, brickHeight); // hace el ladrillo
          remainingBricks++; // contador de ladrillos que quedan
        }
      }
    }

    // paleta
    fill(255); // color de la paleta
    rect(BaseX, height - BaseHeight, BaseWidth, BaseHeight); // hace la paleta

    // pelota
    fill(255); // color de la pelota
    ellipse(PelotaX, PelotaY, 10); // hace la pelota

    // pos de la pelota
    PelotaX += PelotaXvel; // posX de la pelota
    PelotaY += PelotaYvel; // posY de la pelota

    // colisiones de la pelota con las paredes
    if (PelotaX > width || PelotaX < 0) {
      PelotaXvel *= -1; // cambia la direccion X cuando la pelota golpea la pared de los costados
    }
    if (PelotaY < 0) {
      PelotaYvel *= -1; // cambia la direccion Y cuando la pelota golpea la pared de arriba
    }
    if (PelotaY > height) {
      // si la pelota sale de la pantalla se reinicia
      PelotaX = width / 2;
      PelotaY = height - 30;
      PelotaXvel = 5;
      PelotaYvel = -5;
      gameLost = true; // perder
    }

    // colisiones de la pelota con la paleta
    if (PelotaY > height - BaseHeight && PelotaYvel > 0) {
      if (PelotaX > BaseX && PelotaX < BaseX + BaseWidth) {
        PelotaYvel *= -1; // cambia la direc Y cuando la pelota golpea la paleta
      }
    }

    // Colisiones de la pelota con los ladrillos
    for (let c = 0; c < brickVertical; c++) {
      for (let r = 0; r < brickHorizontal; r++) {
        let brick = bricks[c][r];
        if (brick.status === 1) {
          if (
            PelotaX + 5 > c * (brickWidth + brickDistance) &&
            PelotaX - 5 < c * (brickWidth + brickDistance) + brickWidth &&
            PelotaY + 5 > r * (brickHeight + brickDistance) &&
            PelotaY - 5 < r * (brickHeight + brickDistance) + brickHeight
            ) {
            PelotaYvel *= -1; // cambia la direc Y cuando la pelota golpea un ladrillo
            brick.status = 0; // marcar el ladrillo como "roto"
            score++; // aumenta el score del jugador
          }
        }
      }
    }

    // mover la paleta con las flechas
    if (keyIsDown(LEFT_ARROW) && BaseX > 0) {
      BaseX -= 5; // mueve la paleta para la izquierda
    }
    if (keyIsDown(RIGHT_ARROW) && BaseX < width - BaseWidth) {
      BaseX += 5; // mueve la paleta para la derecha
    }

    // score
    fill(255); // color para el texto
    textSize(16); // tamaño del texto
    text("Puntaje: " + score, 10, 20); // mostrar los puntos en la pantalla

    // ganar
    if (remainingBricks === 0) {
      showVictoryScreen(); // mostrar la pantalla de victoria
    }

    // perder
    if (gameLost) {
      showGameOverScreen(); // mostrar la pantalla de perder
    }
  } else if (creditsScreen) {

    // pantalla de creditos
    background(0); // fondo negro
    fill(255); // color blanco para el texto
    textSize(24); // tamaño del texto
    textAlign(CENTER, CENTER); // texto centrado
    text("Juego hecho por Sol Ujdur", width / 2, height / 2); //mostrar el mensaje de los creditos
    backButton.show(); // boton para volver atras
  } else if (winScreen) {

    // pantalla de victoria
    showVictoryScreen(); // mostrar la pantalla de win
  }
}

// funcion para mostrar la pantalla de victoria
function showVictoryScreen() {
  background(0); // fondo negro
  textSize(32); // tamaño del texto grande
  fill(255); // color blanco para el texto
  textAlign(CENTER, CENTER); // texto centrado
  text(victoryTitle, width / 2, height / 2 - 50); // mostrar el titulo de victoria
  textSize(16); // tamaño del texto mas chico
  text(victoryMessage, width / 2, height / 2 + 50); // muestra el mensaje de victoria
  restartButton.show(); // boton de reinicio
  noLoop(); // frena el loop para que el juego no siga
  winScreen = true; // el jugador gana
}

// funcion para mostrar la pantalla de perder
function showGameOverScreen() {
  background(0); // fondo negro
  textSize(32); // tamaño del texto grande
  fill(255); // color blanco para el texto x50 a
  textAlign(CENTER, CENTER); // otra vez centramos el texto
  text("¡Game Over!", width / 2, height / 2 - 50); // mostrar el mensaje de game over
  textSize(16); // tamaño del texto mas chico
  restartButton.show(); // boton de reinicio
  noLoop(); // frenamos el loop para que el juego no siga
  gameLost = false; // restablece la variable de perder
}

function keyPressed() {
  // eventos de teclado
  if (!gameStarted && !creditsScreen && !winScreen && !gameLost) {
    gameStarted = true; // iniciar el juego
    button.remove(); // borrar el boton de creditos
    loop(); // iniciar el loop
  }

  if ((key === 'c' || key === 'C') && !winScreen && !gameLost) {
    showCredits(); // mostrar la pantalla de los creditos
  }

  if ((key === 'r' || key === 'R') && (winScreen || gameLost)) {
    restartGame(); // reiniciar el juego
  }
}



// funcion para mostrar la pantalla de creditos
function showCredits() {
  creditsScreen = true; // se esta mostrando la pantalla de creditos
  showBackButton(); // boton para volver atras
}

// funcion para mostrar las instrucciones del juego
function showInstructions() {
  background(0); // fondo negro
  textSize(30); // tamaño del texto grande
  fill(255); // color blanco para el texto
  textAlign(CENTER, CENTER); // texto centrado
  text("PONG Game", width / 2, height / 2 - 100); // titulo del juego
  textSize(16); // texto mas chico
  text("Meta: Destruye todos los ladrillos sin perder el pong", width / 2, height / 2 - 40); // meta del juego
  text("Instrucciones: Muévete con las flechitas", width / 2, height / 2 - 10); // instrucciones del juego
  text("Inicio: Presiona una tecla para comenzar", width / 2, height / 2 + 20); // iniciar del juego
  text("Presiona 'C' para ver los créditos", width / 2, height / 2 + 50); // creditos del juego

  if (backButton) {
    backButton.hide(); // esconde el boton para volver para atras
  }
}

// funcion para el boton de volver atras
function showBackButton() {
  backButton = createButton('Volver'); // hace el boton
  backButton.size(120, 40); // tamaño del boton
  backButton.position(width / 2 - 60, height / 2 + 80); // pos del boton
  backButton.mousePressed(returnToStart); // da una funcion al boton para volver para atras
  backButton.hide(); // esconde el boton para volver
}

// funcion para volver al inicio
function returnToStart() {
  creditsScreen = false; // restablece la pantalla de creditos
  winScreen = false; // restablece la pantalla de victoria
  gameLost = false; // restablece la pantalla de perder
  backButton.hide(); // esconde el boton de volver
  showInstructions(); // muestra las instrucciones del inicio
  loop(); // reinicia el loop
}

// funcion para reiniciar
function restartGame() {
  gameStarted = false; // reiniciar el juego
  winScreen = false; // restablece la pantalla de victoria
  gameLost = false; // restablece la pantalla de perder
  score = 0; // reinicia el score

  for (let c = 0; c < brickVertical; c++) {
    for (let r = 0; r < brickHorizontal; r++) {
      bricks[c][r].status = 1; // reiniciar el estado de los ladrillos
    }
  }

  restartButton.hide(); // esconde elboton de reinicio
  showInstructions(); // muestra las instrucciones al reiniciar
  loop(); // reinicia el loop
}
