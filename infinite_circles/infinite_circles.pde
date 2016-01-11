final int NUM_CIRCLES = 100;
int diameter = 1;
Circle[] circles;
 
void setup(){
  size(400, 400, P3D);
  noFill();
  frameRate(60);
   
  //Instanciate the array of circles;
  circles = new Circle[NUM_CIRCLES];
 
  //Loop through to create circles;
  for(int i = 0 ; i < NUM_CIRCLES; i++){
    circles[i] = new Circle(diameter, 10.0);
    diameter+=50;
  }
}
 
void draw(){
  background(0);
  translate(width/2, height/2, 0);
  //rotateX(20);
   
  for(int i = 0 ; i < NUM_CIRCLES; i++){
    circles[i].draw();
  }
}
 
class Circle{
   
  float diameter;
  float yOffset = 0;
 
  public Circle(float diameter, float yOffset){
    this.diameter = diameter;
    this.yOffset = yOffset;
  }
   
  void draw(){
    //stroke(255);
    stroke(1,209,229);
    ellipse(0, yOffset, diameter, diameter);
     
    diameter++;
     
    if(diameter > 800){
      diameter = 0;
    }
  }
}