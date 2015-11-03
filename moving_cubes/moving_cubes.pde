float z = 10;

void setup(){
  size(600,600,P3D);
  background(0);
  lights();
}

void draw(){
  background(0);
  for(int i = 20; i < width; i+=110){
    for(int y = 20; y < height; y+=110){
      pushMatrix();
      translate(i, y, z);
      rotateX(-0.25);
      rotateY(-0.1);
      noFill();
      stroke(145,226,46);
      box(70);
      popMatrix();
      z+=0.05;
    } 
  }
}