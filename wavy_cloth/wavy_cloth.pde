float angle;
circle[] circles;

void setup(){
  size(400,400);
  angle = 0;
  smooth();
 
  circles = new circle[0];
  for(int i = 0; i < 20; i++){
   angle+=TWO_PI/20;
   for(int y = 0; y < 20; y++){
      angle+=TWO_PI/20;
      new circle(i*20, y*20, angle);
   }
  }
}

void draw(){
  background(255);
  fill(0);
 
  for(int i = 0; i < circles.length; i++){
    circles[i].drawCircle();
  }
  
}

class circle{
  float x, y, angle;
  circle(float _x, float _y, float _angle){
    x = _x;
    y = _y;
    angle = _angle;
    circles = (circle[]) append(circles, this);
  }
  
  void drawCircle(){
    fill(0);
    ellipse(x+cos(angle)*20, y+sin(angle)*20, 7, 7);
    angle+=0.03;
  }
}