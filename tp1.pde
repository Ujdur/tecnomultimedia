// Ujdur, María Sol
// Comisión 5
// TP1
//shitpost

PFont fuente;

PImage imagen_0;
PImage imagen_1;
PImage imagen_2;
PImage imagen_3;
PImage imagen_4;
PImage imagen_5;
int marcaEnElTiempo;
int estado;
int mitY = 240;

int botonX = 280; // Posición en X del botón
int botonY = 420; // Posición en Y del botón
int botonAncho = 80; // Ancho del botón
int botonAlto = 30; // Alto del botón

// Variables para almacenar los valores iniciales
float texto0;
float texto1;
float texto2;
float texto3;
int texto4;
float texto5;
int texto6;

void setup () {
  size (640, 480);

  estado = 0;

  fuente = loadFont ("Simpsonfont.vlw");
  textFont (fuente);
  textAlign (CENTER);

  imagen_0 = loadImage ("imagen_0.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_0.resize (640, 480); //tamaño imagen
  imagen_1 = loadImage ("imagen_1.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_1.resize (640, 480); //tamaño imagen
  imagen_2 = loadImage ("imagen_2.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_2.resize (640, 480); //tamaño imagen
  imagen_3 = loadImage ("imagen_3.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_3.resize (640, 480); //tamaño imagen
  imagen_4 = loadImage ("imagen_4.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_4.resize (640, 480); //tamaño imagen
  imagen_5 = loadImage ("imagen_5.jpg"); //en el parentesis tiene que estar el nombre de la imagen
  imagen_5.resize (640, 480); //tamaño imagen

  //Estado inicial
  reiniciarSketch();
  
    //Valores iniciales
  texto0 = 10;
  texto1 = 700;
  texto2 = 0;
  texto3 = (random(30, 33));
  texto4 = 45;
  texto5 = 45;
  texto6 = 14;
  
}

void draw () {

  texto0 = texto0 + 0.1;
  texto1 = texto1 - 0.7;
  texto2 = texto2 + 0.4;
  texto3 = (random(30, 33));
  texto4 = 45;
  texto5 = 45 + 10;
  texto6 = 14;
  
  int diferenciaTemporal = millis() - marcaEnElTiempo; //cuando declaro una variable en el draw no la puedo usar en otros eventos

  //maq estados
  if (estado == 0) {
    image (imagen_0, 0, 0);

    fill (0, 255, 0);
    textSize (texto0);
    text ("Estas cansadx de comprar\nmartillos todos los dias", 320, mitY);

    if (diferenciaTemporal >= 6000) { //6segundos
      estado = 1;
      marcaEnElTiempo = millis();
    }
    //
  } else if (estado == 1) {
    image (imagen_1, 0, 0);

    fill (200, 0, 0);
    text ("¿Ni siquiera entendes para que sirven?", texto1, mitY);

    if (diferenciaTemporal >= 6*1000) { //6segundos
      estado =2;
      marcaEnElTiempo = millis();
    }
    //
  } else if (estado == 2) {
    image (imagen_2, 0, 0);

    fill (0, 0, 255);
    textSize (33);
    text ("o simplemente no se acomodan\na tus necesidades?", 320, texto2);

    if (diferenciaTemporal >= 7*1000) { //7segundos
      estado =3;
      marcaEnElTiempo = millis();
    }

    //
  } else if (estado == 3) {
    image (imagen_3, 0, 0);

    fill (200, 200, 0);
    textSize (texto3);
    text ("PREPARATE\nPORQUE LLEGO EL NUEVO...", 320, mitY);

    if (diferenciaTemporal >= 6000) { //6segundos
      estado =4;
      marcaEnElTiempo = millis();
    }
    //
  } else if (estado == 4) {
    image (imagen_4, 0, 0);

    fill (random (0, 150));
    textSize (texto4);
    text ("MARTILLO   ELECTRICO", 320, 290);

    if (diferenciaTemporal >= 6000) { //6segundos
      estado =5;
      marcaEnElTiempo = millis();
    }
    //
  } else if (estado == 5) {
    image (imagen_5, 0, 0);

    fill (255-frameCount/4);
    textSize (texto5);
    text ("LLAME YA", 320, mitY);
    fill (random (0, 100));
    textSize(20);
    text ("no nos hacemos responsables por un mal uso del producto.", 320, 300);

    if (diferenciaTemporal >= 9000) { //9segundos
      estado =6;
      marcaEnElTiempo = millis();
    }
    //
  }
  if (estado == 6) {
    fill(255);
    rect(botonX, botonY, botonAncho, botonAlto);
    fill(0);
    textSize(texto6);
    textAlign(CENTER, CENTER);
    text("Reiniciar", botonX + botonAncho/2, botonY + botonAlto/2);
  }

  // ...
}

void mousePressed() {
  if (estado == 6 && mouseX >= botonX && mouseX <= botonX + botonAncho &&
    mouseY >= botonY && mouseY <= botonY + botonAlto) {
    reiniciarSketch();
  }
}

void reiniciarSketch() {
  estado = 0;
  marcaEnElTiempo = millis();

  // Tam y pos del texto = valores iniciales
  texto0 = 10;
  texto1 = 700;
  texto2 = 0;
  texto3 = (random(30, 33));
  texto4 = 45;
  texto5 = 45 + 10;
  texto6 = 14;

  // Vuelve a cargar las imágenes
  imagen_0 = loadImage("imagen_0.jpg");
  imagen_0.resize(640, 480);
  imagen_1 = loadImage("imagen_1.jpg");
  imagen_1.resize(640, 480);
  imagen_2 = loadImage("imagen_2.jpg");
  imagen_2.resize(640, 480);
  imagen_3 = loadImage("imagen_3.jpg");
  imagen_3.resize(640, 480);
  imagen_4 = loadImage("imagen_4.jpg");
  imagen_4.resize(640, 480);
  imagen_5 = loadImage("imagen_5.jpg");
  imagen_5.resize(640, 480);
}
