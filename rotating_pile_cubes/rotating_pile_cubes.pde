float rotation = 20;
float heightBox = 10;

void setup(){
  size(600,600,P3D);
  smooth();
  background(255);
}

void draw(){
  fill(255, 5);
  rect(0,0, width, height);
  pushMatrix();
  noFill();
  stroke(0);
  translate(300, 100);
  rotateY(rotation);
  rotateZ(rotation);
  for(int i=0; i < 10; i++){
    translate(0, 10*i);
    box(60,10,60);
  }
  
  popMatrix();
  
  rotation+=0.05;
}