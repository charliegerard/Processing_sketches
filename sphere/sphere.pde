float rotation = 1;
float radius = 100;
float radiusChange = 0.5;

void setup(){
 size(600, 400, P3D);
 background(0);
 smooth();
 lights();
}
  
void draw(){
 background(0);
 noFill(); 
 stroke(255);
 strokeWeight(0.5);
 translate(width/2, height/2, 50);
 rotateY(rotation);
 sphereDetail(10, 70);
 sphere(radius);
 
 rotation += 0.01;
}