import gifAnimation.*;
GifMaker gifExport;

float radius = 10;
float z = 0;
float movementForward = 1;

void setup(){
  size(400,400, P3D);
  lights();
  background(0);
  smooth();
  
  gifExport = new GifMaker(this, "test.gif");
  gifExport.setRepeat(0);
}

void draw(){
  background(0);
  for(int i = 0; i < width; i+=50){
    for(int y = 0; y < height; y+=50){
      for(float z = 0; z < width; z+=50){
        pushMatrix();
        translate(i, y, z);
        noFill();
        stroke(255);
        sphereDetail(4);
        sphere(radius);
        popMatrix();
        z += movementForward;
      }
    }
  }
  movementForward+=0.3;
  if (frameCount%2==0 &&  frameCount<10000) {
    gifExport.setDelay(5); // = speed of the animated GIF
    gifExport.addFrame();
  }
  if (frameCount>121) gifExport.finish();
}