void setup (){
  
  println ("X horizontal    Y vertical");
size (1000,500);
background (50,50,100);
}



void draw(){
 
 //luna
  background (50,50,100);
 fill (230);
 circle (mouseX,120,80);
 
    //estrellas
 circle (100,200,5);  
 circle (200,200,5);
 circle (300,300,5);
 circle (115,55,5);
 circle (55,305,5);
 circle (350,250,5);
circle (485,221,5);
circle (500,55,5);
circle (605,350,5);
circle (620,208,5);
circle (700,10,5);
circle (800,300,5);
circle (820,350,5);
circle (950,200,5);
circle (850,50,5);
 
 //texto
 fill(0);
 text ("moon",mouseX,120);
 
   //montañas
  fill (0,255,0);
  circle (200,650,550);
  circle (900,650,500);
  circle (500,650,600);
 
 //casa
 fill(255,255,0);
  rect (450,300,100,70);
  
  //puerta
  fill (100);
  rect (465,320,20,50);
  rect (505,330,25,20);
  
  //techo
  triangle (450,300,550,300,500,240);
  
}
