Mover[] movers = new Mover[10];

void setup(){
  size(600,600);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  fill(0, 3);
  rect(0,0,width,height); //Creates the fading effect.
  
  for(int i = 0; i < movers.length; i++){
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

class Mover{
  PVector location; //Represents the coordinates of the position of the circle.
  PVector velocity; //Represents the movement applied to the object.
  PVector acceleration; //Represents how fast the object should be moving.
  PVector mouse;
  float topSpeed = 10;
  float circleWidth;
  
  Mover(){
    location = new PVector(random(1,10), random(1,10)); //Random x and y coordinates so all the circles won't be displayed on top of each other.
    velocity = new PVector(1,5);
    acceleration = new PVector(-0.01, 0.5); 
    circleWidth = random(1,20);
  }
  
  void display(){
    stroke(255);
    noFill();
    ellipse(location.x, location.y, circleWidth, circleWidth);
  }
  
  void update(){
    mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse,location); //difference between the circles location and the mouse location.
    dir.normalize(); //Makes this vector a unit vector.
    dir.mult(0.5);
    acceleration = dir; //Use the distance between the mouse and location to determine the acceleration.
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    }
    if(location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    }
    if(location.y < 0){
      location.y = height;
    }
  }
}