float x = 200;
float y = 200;
float boxX = 30;
float boxY =30;
float boxZ = 30;
float rotationX = 0;
float rotationY = 0;
float radius = 5;
float growingBox = 0.0;

void setup(){
  size(400,400, P3D);
  background(0);
}

void draw(){
  background(0);
  //fill(0, 8);
  //rect(0,0,width,height);
  noFill();
  stroke(255);
  strokeWeight(0.5);
  
  translate(width/2, height/2, 200);
  rotateX(rotationX);
  rotateY(rotationY);
  box(boxX,boxY,boxZ);
  
  fill(255);
  translate(0 - (boxX/2), 0 - (boxY/2), boxZ/2);
  sphere(radius);
  
  translate(0 + boxX, 0, 0);
  sphere(radius);
  
  translate(0 - boxX, 0 + boxY, 0);
  sphere(radius);
 
  translate(0 + boxX, 0 , 0);
  sphere(radius);
  
  //Back spheres;
  translate(0, 0 , -boxZ);
  sphere(radius);
  
  translate(0 - boxX, 0, 0);
  sphere(radius);
  
  translate(boxX, 0 - boxY, 0);
  sphere(radius);
  
  translate(0 - (boxX), 0, 0);
  sphere(radius);
  
  rotationX+=0.05;
  rotationY+=0.05;
  
  if(boxX < 100){
    growingBox+=0.1;
  } else {
    growingBox = -growingBox;
  }
  
  boxX+=growingBox;
  boxY+=growingBox;
  boxZ+=growingBox;

}