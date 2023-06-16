//Link al video de YouTube: https://youtu.be/UcrFoK6uMNI
// Ujdur, María Sol
// Comisión 5
// TP2
//Ilusión óptica



//Nombramos la imagen
PImage imagen;

//Cantidad de circulos del primer y segundo cono
int NumCirc = 10;            // Número de círculos iniciales
int NumCircNuevos = 5;       // Número de círculos nuevos en el cono superpuesto

//Dimensiones de los circulos, desde el mas chico al mas grande
float CircChico = 18;        // Círculo más chiquito 
float CircGrande = 200;      // Círculo más grande

//Marcamos las coordenadas X, Y y las velocidades de los círculos del primer cono
float[] Xcirc;               // X de los círculos iniciales
float[] Ycirc;               // Y de los círculos iniciales
float[] VelCirc;             // Velocidad de los círculos iniciales

//Marcamos las coordenadas X e Y y las velocidades de los círculos del segundo cono
float[] XcircNuevos;         // X de los segundos círculos
float[] YcircNuevos;         // Y de los segundos círculos
float[] VelCircNuevos;       // Velocidad de los segundos círculos



void setup() {
  size(800, 400);

//Carga la imagen y el tamaño
  imagen = loadImage("imagen.jpg");
  imagen.resize(400, 400);

//Tamaño en base a la cantidad de círculos del primer cono
  Xcirc = new float[NumCirc];
  Ycirc = new float[NumCirc];
  VelCirc = new float[NumCirc];

//Tamaño en base a la cantidad de círculos del segundo cono
  XcircNuevos = new float[NumCircNuevos];
  YcircNuevos = new float[NumCircNuevos];
  VelCircNuevos = new float[NumCircNuevos];

//Donde inician las posiciones y las velocidades del primer cono (x:600 - y:200)
//Asignamos la velocidad usando map para dar valores en un rango especifico
  for (int i = 0; i < NumCirc; i++) {
    Xcirc[i] = 600;
    Ycirc[i] = 200;
    VelCirc[i] = map(i, 0, NumCirc - 1, 0.02, 0.1);
  }

  //Lo mismo que en el anterior pero con el segundo cono practicamente
  for (int i = 0; i < NumCircNuevos; i++) {
    XcircNuevos[i] = Xcirc[i]; // Los segundos círculos tienen las mismas posiciones iniciales que los círculos anteriores
    YcircNuevos[i] = Ycirc[i];
    VelCircNuevos[i] = map(i, 0, NumCircNuevos - 1, 0.02, 0.1); // La velocidad de los nuevos círculos se ajusta para un movimiento igual a los círculos anteriores
  }
}



void draw() {
  
  //Tapo el fondo para que sea blanco
  background(255);

  //Asigno el valor del contorno de los circulos
  strokeWeight(3);

  //Dibujo de los círculos del primer cono dandoles un orden descendiente, del mas grande al mas chico
  //Uso i para los circulos del primer cono
  for (int i = NumCirc - 1; i >= 0; i--) {
    
    //Aca uso CircChico como tamaño "base" y le voy sumando valores para llegar al tamaño de los circulos que quiero
    float size = CircChico + 50 + i * (CircGrande - CircChico) / (NumCirc);

  //En resumen, estas dos lineas se usan para mapear i y que tenga un desplazamiento de -50 y 50 desde la pos del mouse
    float MoverX = mouseX + map(i, 0, NumCirc, -50, 50);
    float MoverY = mouseY + map(i, 0, NumCirc, -50, 50);
  
  //Aca use lerp para que los circulos no sigan al mouse independientemente, sino que sea un movimiento suavizado
  //A parte, esto calcula el tamaño entre el circulo mas chico y el mas grande
    Xcirc[i] = lerp(Xcirc[i], MoverX, VelCirc[i]); // Transición suave en X
    Ycirc[i] = lerp(Ycirc[i], MoverY, VelCirc[i]); // Transición suave en Y

  //En esta parte asigne los colores de los circulos dependiendo si eran pares o impares, esta linea fue una excusa para usar if y else practicamente jajjaj
    if (i % 2 == 0) {
      fill(255); // Círculos blancos
    } else {
      fill(0); // Círculos negros
    }

  //Aca ya teniamos asignado de antes el valor del tamano (size) por lo que nada mas tuve que poner las coordenadas X e Y (con Ycirc[i] y Xcirc[i])
    ellipse(Xcirc[i], Ycirc[i], size, size); // Dibujar círculo
  }
  
    //Llamo una funcion propia
  funcionPropia();
}



  //Funcion propia
void funcionPropia() {
  
  //Bucles anidados dentro de la función propia
  //Aca es mas de lo anterior pero con las modificaciones correspondientes para que el cono mas chico se ajuste a lo que queria
  for (int i = 0; i < NumCircNuevos; i++) {
    
    //Uso INV para agarrar los valores antewriores y que el cono quede invertido, lo uso para ver las posiciones de los primeros círculos (Xcirc e Ycirc)
    int INV = NumCircNuevos - 1 - i;
    float size = CircChico + i * (CircChico - CircChico / (NumCircNuevos));
    float MoverX = Xcirc[INV];
    float MoverY = Ycirc[INV];
    
    //Aca use constrain para limitar un poco el movimiento vertical 
    MoverY = constrain(MoverY, size / 2, height - size / 2);
    
    //Esto funciona igual que antes, es para mover los círculos del nuevo cono con el mouse y que cree el efecto de cono y no circulos apilados
    XcircNuevos[i] = lerp(XcircNuevos[i], MoverX, VelCircNuevos[i]);
    YcircNuevos[i] = lerp(YcircNuevos[i], MoverY, VelCircNuevos[i]);

  //Otra vez asignamos los colores de los circulos
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }

    //Hacemos los circulos nuevos y le asignamos el tamaño
    ellipse(XcircNuevos[i], YcircNuevos[i], size, size);

  //Aca me hice matete e hice mas circulos con las mismas operaciones
  //Use las mismas operaciones de antes para dibujar circulos mas chicos a dentro de cada circulo nuevo
  //La diferencia es que el tamaño de los circulos se calcula usando la variable "TamChico" y nombre los circulos nuevos de "i" a "j"
    for (int j = i; j >= 0; j--) {
      float TamChico = CircChico + j * (CircChico - CircChico / (NumCircNuevos + 1));
      float MoverAnidadoX = Xcirc[INV];
      float MoverAnidadoY = Ycirc[INV];
      MoverAnidadoY = constrain(MoverAnidadoY, TamChico / 2, height - TamChico / 2);
      XcircNuevos[j] = lerp(XcircNuevos[j], MoverAnidadoX, VelCircNuevos[j]);
      YcircNuevos[j] = lerp(YcircNuevos[j], MoverAnidadoY, VelCircNuevos[j]);

  //De nuevo asigno colores
      if (j % 2 == 0) {
        fill(255);
      } else {
        fill(0);
      }

      ellipse(XcircNuevos[j], YcircNuevos[j], TamChico, TamChico);
    }
  }
  
    //LLamo a la imagen y la ubico en las coordenadas 0,0 para que quede en la mitad de la pantalla
    image(imagen, 0, 0);
}



/*
PImage imagen;
int NumCirc = 15;            // Número de círculos
float CircChico = 10;        // Circulo más chico
float CircGrande = 200;      // Circulo más grande

float[] Xcirc;               // X de los círculos
float[] Ycirc;               // Y de los círculos
float[] VelCirc;             // Velocidad de los círculos

void setup() {
  size(800, 400);

  imagen = loadImage("images.jpg");
  imagen.resize(400, 400);

  Xcirc = new float[NumCirc];
  Ycirc = new float[NumCirc];
  VelCirc = new float[NumCirc];

  // Inician las posiciones y la velocidad de los círculos
  for (int i = 0; i < NumCirc; i++) {
    Xcirc[i] = 600;
    Ycirc[i] = 200;
    VelCirc[i] = map(i, 0, NumCirc - 1, 0.02, 0.1);
  }
  
  stroke (40);
}

void draw() {
  background(255);

  strokeWeight(3);
  for (int i = NumCirc - 1; i >= 0; i--) {
    float size = CircChico + i * (CircGrande - CircChico) / (NumCirc - 1);

    float MoverX = mouseX + map(i, 0, NumCirc , -50, 50);
    float MoverY = mouseY + map(i, 0, NumCirc , -50, 50);

    Xcirc[i] = lerp(Xcirc[i], MoverX, VelCirc[i]); //transición suave en X
    Ycirc[i] = lerp(Ycirc[i], MoverY, VelCirc[i]); //transición suave en Y

    if (i % 2 == 0) {
      fill(40);                  // Cuadrados blancos
    } else {
      fill(255);                    // Cuadrados negros
    }

    rectMode(CENTER); // Establecer el modo de dibujo en el centro del cuadrado
    rect(Xcirc[i], Ycirc[i], size, size);  // Dibujar cuadrado
  }

  image(imagen, 0, 0);
}

*/
