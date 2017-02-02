float circleWidth = 30;
PVector wind;
float gravity;
Mover mover;
Water water;

void setup(){
  size(800,600);
  
  mover = new Mover(1, 0, 0);
  water = new Water(-width/2, 400, width, height, 0.1);  
}

void draw(){
  background(0);
  translate(width/2,0);
  
  water.display();
  
  float m = mover.mass;
  PVector gravity = new PVector(0, 0.1*m);
  
  PVector friction = mover.velocity.get();
  friction.mult(-1);
  friction.normalize();
  // A bit lost from that part. Don't really understand 100% coefficient magnitude
  float c = 0.01;
  float normal = 1;
  float coefficientMagnitude = c * normal;
  friction.mult(coefficientMagnitude);
  // The end of the non-clear part.
  
  mover.applyForce(friction);
  mover.applyForce(gravity);
  
  if(mover.isInside(water)){
    mover.drag(water);
  }
  mover.update();
  mover.display();
  mover.checkEdges();
}

class Mover{
  PVector velocity;
  PVector acceleration;
  PVector position;
  float mass;

  Mover(float m, float x, float y){
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0.1);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void display(){
    fill(255);
    ellipse(position.x, position.y, circleWidth, circleWidth);
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void checkEdges(){   
    if(position.x > width){
      position.x = width;
      velocity.x *= -1;
    } else if(position.x < 0){
      position.x = 0;
      velocity.x *= -1;
    }
    
    if(position.y > height){
      position.y = height;
      velocity.y *= -1;
    } else if (position.y < 0){
      position.y = 0;
      velocity.y *= -1;
    }
  }
  
  boolean isInside(Water wat){
    if(position.x > wat.xPosition && position.x < wat.xPosition + wat.waterWidth && position.y > wat.yPosition && position.y < wat.yPosition+wat.waterHeight){
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Water wat){
    float speed = velocity.mag();
    float dragMagnitude = wat.c * speed * speed;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
  }
}

class Water{
  int xPosition;
  int yPosition;
  int waterWidth;
  int waterHeight;
  float c;
  
  Water(int x, int y, int w, int h, float _c){
    xPosition = x;
    yPosition = y;
    waterWidth = w;
    waterHeight = h;
    c = _c;
  }
  
  void display(){
    fill(155);
    rect(xPosition, yPosition, waterWidth, waterHeight);
  }

}