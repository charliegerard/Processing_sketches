int number = 10;
float d1 = 220, d2 = 100;
 
void setup() {
  size(500, 400, P3D);
  noFill();
}
 
//void draw() {
//  colorMode(HSB, number);
//  background(0);
//  translate(width/2, height/2);
//  //rotateX(map(mouseY, 0, height, PI, -PI));
  
//  //rotateY(map(mouseX, 0, width, -PI, PI));
  
//  float r, x, y, t, fc = float(frameCount) / 40;
  
//  for (float i = 0; i < 2; i++) {
//    t = i * TWO_PI / number;
//    x = d2 * cos(t + fc);
//    y = d2 * sin(t + fc);
//    r = abs(d1 + x);
//    stroke((sin(i*TWO_PI/number)+1)*number/5,number*((sin(i*TWO_PI/number)+2)/4 + .3), number*((cos(i*TWO_PI/number)+2)/4 + .1));
//    pushMatrix();
//    translate(0, 0, y / 2);
//    ellipse(0, 0, r, r);   
//    popMatrix();
//  }
  
//}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(map(mouseX, 0, height, PI, -PI));
  rotateY(map(mouseY, 0, width, -PI, PI));
  
  float t, fc = float(frameCount) / 40;
  
  for(int i = 0; i < number; i++){
    t = i * TWO_PI / number;
    float radius = abs(220 + 100 * cos(t + fc));
    stroke(255);
    ellipse(0,0,radius, radius);
  }
}