 //Llamo a las funciones y las asigno
int pantallaActual = 0;
int finalObtenido = 0;
boolean botonPresionado = false;

//Llamo a la imagen
PImage[] imagenes = new PImage[15];

//Llamo a la fuente tipográfica
PFont fuente;



void setup() {
  
  //Tamaño de pantalla
  size(600, 600);

  //Cargar fuente
  fuente = loadFont("luzu.vlw");
  textFont(fuente);
  
  //Definir ubicación y tamaño de los textos
  textAlign(CENTER);
  textSize(16);
  
  //Cargar imágenes
  for (int i = 0; i < imagenes.length; i++) {
    imagenes[i] = loadImage("imagen" + i + ".jpg");
  }
  
  //Comenzar en la primera imagen
  pantallaActual = 0;
}

void draw() {
  
  //Fondo blanco
  background(255);
  
  //Mostrar imagen d la pantalla actual
  image(imagenes[pantallaActual], 0, 0);
  
  //Mostrar botón de la pantalla actual
  if (pantallaActual == 0) {
    mostrarBotonIniciar();
    mostrarBotonCreditos();
  } else if (pantallaActual == 10 || pantallaActual == 11 || pantallaActual == 12 || pantallaActual == 13) {
    mostrarBotonReinicio();
  } else if (pantallaActual == 14) {
    mostrarBotonVolver();
    Creditos();
  } else {
    mostrarBotonContinuar();
  }
  
  //Confirmar los botones
  if (pantallaActual == 2) {
    mostrarBotonFinal3();
  } else if (pantallaActual == 4) {
    mostrarBotonFinal2();
  } else if (pantallaActual == 6) {
    mostrarBotonFinalPreso();
  } else if (pantallaActual == 7) {
    mostrarBotonFinalPreso2();
  } else if (pantallaActual == 8) {
    mostrarBotonFinalBosque();
  }
  
  //Reinicio con el botón
  if (!mousePressed) {
    botonPresionado = false;
  }

  // Rectángulo del texto y color blanco  medio transparente
  if (pantallaActual != 0 && pantallaActual != 14) {
    fill(255, 255, 255, 200);
    rectMode(CENTER);
    rect(width / 2, height - 535, 600, 100);
    
    //Definir color y tamaño del texto de los botones
    fill(0);
    textAlign(CENTER);
    textSize(20);
    
    //Texto de los botones
    switch (pantallaActual) {
      case 1:
        text("Eres un bombero en un mundo donde los bomberos\ndeben quemar los libros para que las\npersonas no tengan un pensamiento independiente", width / 2, height - 550);
        break;
      case 2:
        text("Un día mientras trabajas vez\nun libro tirado en el piso que\nte llama la atención", width / 2, height - 550);
        break;
      case 3:
        text("Lo escondes en tu mochila y\nvolves a tu casa algo preocupado ya que\nno sabes si alguien te ha visto", width / 2, height - 550);
        break;
      case 4:
        text("El libro te da mucha curiosidad\npero sabes que te puede traer\nproblemas tenerlo", width / 2, height - 550);
        break;
      case 5:
        text("¡Te descubrieron!\nSeguro un compañero te vió\nagarrar el libro y te delató", width / 2, height - 550);
        break;
      case 6:
        text("Tu compañero trata de hacerte\nentrar en razón y te pide que te\nentregues a las autoridades", width / 2, height - 550);
        break;
      case 7:
        text("Huyes pero debes\nmantenerte escondido para que\nno te encuentren", width / 2, height - 550);
        break;
      case 8:
        text("A lo lejos ves un refugio,\ndebes decidir si esconderte en el\nbosque o ir a inspeccionar", width / 2, height - 550);
        break;
      case 9:
        text("Una vez allí te das cuenta que\nes un escondite para lectores profugos y\ndecides quedarte con ellos", width / 2, height - 550);
        break;
      case 10:
        text("Te haces amigos de los profugos,te dejan leer\ntodos sus libros y decides crear un grupo de\nrevolucionarios para luchar contra el sistema represor", width / 2, height - 550);
        break;
      case 11:
        text("Decides quemar el libro y\nvivir una vida monotona en\nla ignorancia", width / 2, height - 550);
        break;
      case 12:
        text("Los bomberos te encuentran y\nte entregan a las autoridades para\nque cumplas una larga condena", width / 2, height - 550);
        break;
      case 13:
        text("Te pierdes en el bosque y te vuelves\nuno con la naturaleza, vives una\nlarga vida como un salvaje hasta morir", width / 2, height - 550);
        break;
    }
  }
}

//Cambiamos de pantalla con el boton de INICIAR
void mostrarBotonIniciar() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height / 2 - 50 && mouseY < height / 2) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 1;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, height / 2 - 25, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Iniciar", width / 2, height / 2 - 20);
}

//Cambiamos de pantalla con el boton de CRÉDITOS
void mostrarBotonCreditos() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height / 2 && mouseY < height / 2 + 50) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 14;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, height / 2 + 25, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Créditos", width / 2, height / 2 + 30);
}

//Cambiamos de pantalla con el boton de CONTINUAR
void mostrarBotonContinuar() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height - 75 && mouseY < height - 25) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      cambiarPantalla();
    }
  } else {
    fill(255);
  }

  rectMode(CENTER);
  rect(width / 2, height - 50, 300, 50);

  fill(0);
  textAlign(CENTER);
  textSize(16);
  if (pantallaActual == 2) {
    text("Esconder libro", width / 2, height - 45);
  } else if (pantallaActual == 4) {
    text("¡Lo leeré! Me intriga demasiado", width / 2, height - 45);
  } else if (pantallaActual == 6) {
    text("Tumbar al bombero y huir", width / 2, height - 45);
  } else if (pantallaActual == 7) {
    text("Ir a un lugar alejado de la gente", width / 2, height - 45);
  } else if (pantallaActual == 8) {
    text("Ir al refugio", width / 2, height - 45);
  } else {
    text("Continuar", width / 2, height - 45);
  }
}

//Cambiamos de pantalla con el boton de REINICIAR
void mostrarBotonReinicio() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height - 75 && mouseY < height - 25) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      reiniciarAventura();
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, height - 50, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Reiniciar", width / 2, height - 45);
}

void mostrarBotonFinal3() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > 480 && mouseY < 520) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 11;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, 500, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Quemar el libro", width / 2, 505);
}

//Cambiamos de pantalla con el boton definiendo un FINAL MONOTONO
void mostrarBotonFinal2() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > 480 && mouseY < 520) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 11;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, 500, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("No vale la pena, lo quemaré", width / 2, 505);
}

//Cambiamos de pantalla con el boton definiendo un FINAL PRESO
void mostrarBotonFinalPreso() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > 480 && mouseY < 520) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 12;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, 500, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Entregarte", width / 2, 505);
}

//Cambiamos de pantalla con el boton definiendo un FINAL PRESO
void mostrarBotonFinalPreso2() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > 480 && mouseY < 520) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 12;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, 500, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Esconderse en la gran ciudad", width / 2, 505);
}

//Cambiamos de pantalla con el boton definiendo un FINAL EN EL BOSQUE
void mostrarBotonFinalBosque() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > 480 && mouseY < 520) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 13;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, 500, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Correr hacia el bosque", width / 2, 505);
}

//Cambiamos de pantalla con el boton para VOLVER AL INICIO
void mostrarBotonVolver() {
  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height - 75 && mouseY < height - 25) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 0;
    }
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(width / 2, height - 50, 300, 50);
  
  fill(0);
  textAlign(CENTER);
  text("Volver", width / 2, height - 45);
}


void cambiarPantalla() {
  pantallaActual++;
  
  // Confirmar el final
  if (pantallaActual > 12) {
    finalObtenido = Final();
    pantallaActual = 1;
  }
}


int Final() {
  int finalResultado = 0;
  switch (pantallaActual) {
    case 10:
      finalResultado = 1;
      break;
  }
  return finalResultado;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciarAventura();
  }
}

void reiniciarAventura() {
  pantallaActual = 0;
  finalObtenido = 0;
}

void Creditos() {
  
  //Última imagen
  image(imagenes[14], 0, 0);

//Color y ubicación del rectangulo
  fill(255);
  rectMode(CENTER);
  rect(width / 2, height - 50, 300, 50);
  
  //Color y ubicación del texto
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("CREDITOS:", width / 2, height / 2 - 100);
  textSize(30);
  text("Directora: Ujdur M. Sol", width / 2, height / 2 - 50);
  text("Ilustradora: Ujdur M. Sol", width / 2, height / 2);
  text("Programadora: Ujdur M. Sol", width / 2, height / 2 + 50);

  if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height - 75 && mouseY < height - 25) {
    fill(150);
    if (mousePressed && !botonPresionado) {
      botonPresionado = true;
      pantallaActual = 0;
    }
  } else {
    fill(255);
  }

  rectMode(CENTER);
  rect(width / 2, height - 50, 300, 50);

  fill(0);
  textAlign(CENTER);
  text("Volver", width / 2, height - 45);
}
