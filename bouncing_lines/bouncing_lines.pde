PVector location;
PVector velocity;
Ball[] balls = new Ball[10];

void setup(){
  size(400,400);
  
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(random(0.1,5), 0, 0);
  }
}

void draw(){
  //background(255);
  fill(0, 10);
  rect(0,0,width,height);
  
  for(int i = 0; i < balls.length; i++){
    float mass = balls[i].mass;
    PVector gravity = new PVector(0, 0.1*mass);
    balls[i].applyForces(gravity);
    
    balls[i].checkEdges();
    balls[i].update();
    balls[i].display();
  }
}

class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  color c;
  float mass;
  
  Ball(float m, float x, float y){
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(random(0, 10), random(0,10));
    acceleration = new PVector(0, 0);
    c = color(random(0,255), random(0,255), random(0,255));
  }
  
  void applyForces(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    noFill();
    stroke(c);
    
    //ellipse(location.x, location.y, 30, 30);
    line(location.x, location.y, location.x + 30, location.y + 30);
  } 
  
  void checkEdges(){
    if(location.x < 0){
      velocity.x *= -1;
    } else if(location.x > width){
      velocity.x *= -1;
    }
    
    if(location.y > height){
      velocity.y *= -1;
    } else if(location.y < 0){
      velocity.y *= -1;
    } 
  }
}