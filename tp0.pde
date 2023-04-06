// Ujdur, María Sol
// Comisión 5
// Tp0


PImage imagen; //renombrar




void setup (){
  
 size (800,400);
 textSize (18);

 
 imagen = loadImage ("imagen.jpg"); //en el parentesis tiene que estar el nombre de la imagen
 imagen.resize (422,400); //tamaño imagen

}




void draw (){

background (255);



  
  //PRIMER IMAGEN
  image (imagen,0,0);
  //SEGUNDA IMAGEN
  image (imagen,width/2,0);  
  
  
  

  fill (255);
  strokeWeight (1);
  stroke(200);
  rect (2,0,400,398);




  noStroke();
  
  
  
  
  //MANGO AMARILLO
  fill (  250, 215, 50);
  beginShape();
vertex (214,208);
vertex (218,208);
vertex (223,208);
vertex (228,208);
vertex (234,208);
vertex (242,208);
vertex (251,209);
vertex (259,209);
vertex (264,211);
vertex (272,212);
vertex (278,213);
vertex (285,215);
vertex (291,216);
vertex (299,217);
vertex (308,219);
vertex (313,221);
vertex (320,223);
vertex (329,226);
vertex (340,228);
vertex (344,230);
vertex (351,231);
vertex (356,232);
vertex (364,232);
vertex (370,233);
vertex (378,233);
vertex (384,234);
vertex (387,234);
vertex (393,260);
vertex (393,286);
vertex (391,296);
vertex (377,318);
vertex (371,317);
vertex (370,314);
vertex (369,310);
vertex (368,308);
vertex (365,305);
vertex (362,303);
vertex (360,302);
vertex (354,299);
vertex (351,297);
vertex (346,295);
vertex (336,292);
vertex (324,288);
vertex (313,286);
vertex (301,285);
vertex (294,284);
vertex (285,283);
vertex (276,281);
vertex (256,277);
vertex (242,273);
vertex (229,269);
vertex (208,241);
vertex (203,217);
vertex (214,208);
  endShape ();
  
  
  fill(240, 200, 50,150);
  beginShape ();
vertex (214,214);
vertex (386,246);
vertex (386,261);
vertex (390,281);
vertex (202,238);
  endShape();
  
  
  fill(240, 200, 50);
  beginShape ();
vertex (233,241);
vertex (393,278);
vertex (392,293);
vertex (376,316);
vertex (369,300);
vertex (345,288);
vertex (226,267);
  endShape();
  
  
  
  
 //COMIENZO DEL MANGO PARTE NEGRA (izquierda)
  fill(50);
beginShape ();
vertex (196,207);
vertex (214,207);
vertex (216,222);
vertex (240,228);
vertex (243,250);
vertex (231,267);
vertex (231,271);
vertex (200,264);
vertex (194,207);
endShape();




//PARTECITA NEGRA DEL MANGO (derecha)
  fill (50);
    beginShape (); 
vertex (374,315);
vertex (372,317);
vertex (374,319);
vertex (377,320);
vertex (394,295);
vertex (397,282);
vertex (395,242);
vertex (388,235);
vertex (392,254);
vertex (387,255);
vertex (385,253);
vertex (379,254);
vertex (379,264);
vertex (379,266);
vertex (388,280);
vertex (390,287);
vertex (390,294);
vertex (385,303);
vertex (374,316);
vertex (374,315);
    endShape ();
 
  
   
  
 //PATE DONDE DICE DeWALT
  quad ( 194,207, 82,189, 77,245, 201,264);
  
  triangle (57,269,51,175,96,216);
  triangle (49,173,82,190,82,210);
 
 
 
 
 //CUADRADITOS GRISES
  fill (170);
  quad ( 151,200,193,206,196,218,152,211);
  quad ( 194,206,202,249,192,250,181,204);
  fill(160);
  quad (145,198,120,195,121,206,143,211);
  fill (160,240);
  quad (114,193,114,207,93,203,91,190);
  fill (160,220);
  quad (85,189,87,203,62,197,60,178);




//LINEA ENTRE EL MANGO NEGRO Y AMARILLO
  stroke(5);
  fill(0);
  line (194,206,205,264);
  
  
  
  
  //PARTE PLATEADA DEL MARTILLO
  noStroke();
   
    fill (200);
  circle (40,330,40);
  
      fill (190);
   circle (40,330,30);
  
  fill(190);
  quad (20,325,24,293,59,299,60,329);
  quad (25,286,32,295,38,210,25,214);
  
  fill(155);
  beginShape();
  vertex (43,154);
vertex (42,136);
vertex (47,101);
vertex (50,61);
vertex (46,64);
vertex (31,151);
vertex (44,195);
  endShape();
  
  fill(190);
  beginShape();
vertex (26,205);
vertex (30,152);
vertex (43,65);
vertex (40,112);
vertex (33,153);
vertex (33,205);
  endShape();
  
  fill (220);
   circle (40,310,23);
   
  
  
  
  //PARTE DEL MARTILLO (NEGRO)
  noStroke();
  fill (50);
  beginShape ();
  vertex (60,264);
vertex (55,268);
vertex (56,291);
vertex (60,294);
vertex (58,300);
vertex (54,304);
vertex (50,303);
vertex (48,304);
vertex (48,307);
vertex (32,308);
vertex (30,224);
vertex (27,220);
vertex (25,214);
vertex (27,205);
vertex (30,198);
vertex (34,151);
vertex (40,145);
vertex (45,162);
vertex (48,168);
vertex (57,175);
vertex (60,264);
  endShape ();
  
  beginShape();
vertex (37,304);
vertex (24,299);
vertex (24,291);
vertex (37,293);
vertex (37,304);
  endShape();

   noStroke();
    fill (50);
  circle (40,310,16);
  
  
  
  
  //SOMBRAS
  strokeWeight (1);
  fill(0);
  stroke(5);
line (26,283,27,216);

stroke (5);
line (26,205,30,160);

beginShape();
vertex (45,294);
vertex (44,271);
vertex (56,251);
vertex (77,236);
vertex (68,252);
vertex (57,260);
vertex (48,272);
vertex (47,303);
endShape();

strokeWeight (2);
stroke(10);
fill (255);
line (31,223,35,312);
line (33,150,30,198);
line (41,152,45,161);
line (45,161,47,167);
line (47,167,56,180);

strokeWeight (1);
stroke(155);
line (78,238,142,244);

fill(120,165);
beginShape ();
vertex (51,298);
vertex (58,298);
vertex (59,333);
vertex (51,340);
vertex (49,296);
endShape();

strokeWeight (4);
line (57,336,50,345);
strokeWeight (2);
line (50,345,39,349);
line (25,296,20,325);




//TEXTO
fill (200,150);
text ("DeWalt",105,233);

line (104,234,152,242);
line (106,212,154,218);

beginShape();
vertex (41,228);
vertex (40,226);
vertex (39,223);
vertex (39,218);
vertex (45,220);
vertex (47,229);
vertex (49,219);
endShape();
circle (43,208,10);
line (53,200,52,231);

stroke (0,220);
strokeWeight (1);
line (51,62,47,102);
line (47,102,43,125);

stroke(255,130);
line (44,93,42,110);
line (44,93,48,64);
}




void mousePressed (){
  
  println ("vertex (" + mouseX + "," + mouseY + ");");
  
}
