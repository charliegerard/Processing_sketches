float x = 20.0;
float size = 1.0;
long lastTime = 0;
int test = 0;
int timeSinceLastBox;

Cube[] cubes = new Cube[5];

void setup(){
  background(0);
  size(400,400, P3D);
  
  for(int i = 0; i < cubes.length; i++){
    cubes[i] = new Cube(20);
  }
  timeSinceLastBox = millis();
}

void draw(){
  background(0);
  directionalLight(206, 206, 206, 0, 0, -1);
  ambientLight(100, 100, 100);
  translate(width/2,height-50);
  rotateX(8.9);
  rotateY(8.6);
  
  for(int i = 0; i <cubes.length; i++){
      translate(0,i+50);
      cubes[i].drawCube();
      cubes[i].updateCube();
  }
 
}
  
class Cube{
  int w;
  int y;
  
  Cube(int w){
    this.w = w;
  }
  
  void drawCube(){
      fill(255,0,0);
      noStroke();
      box(w);
  }
  
  void updateCube(){
    if(w < 23 || w < 10){
      size += 0.05;
    } else {
      size -= 0.05;
    }
    w+=size;
  }
  
}