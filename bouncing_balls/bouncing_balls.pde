Spot[] spots;

void setup(){
  size(700,100);
  int numSpots = 70;
  int diameter = width/numSpots;
  spots = new Spot[numSpots];
  for(int i=0; i < spots.length; i++){
    float x = diameter/2 + i*diameter;
    float rate = random(0.5, 1);
    spots[i] = new Spot(x, 50, diameter, rate);
  }
  noStroke();
}

void draw(){
  fill(0,12);
  rect(0,0,width, height);
  fill(255);
  for(int i = 0; i < spots.length; i++){
    spots[i].move();
    spots[i].display();
  }
}

class Spot{
  float x, y;
  float diameter;
  float speed;
  int direction = 1;
  
  Spot(float xpos, float ypos, float dia, float sp){
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }
  
  void move(){
    y += (speed * direction);
    if((y > (height - diameter/2)) || (y < diameter/2)){
      direction *= -1;
    }
  }
  
  void display(){
    ellipse(x,y,diameter, diameter);
  }
}