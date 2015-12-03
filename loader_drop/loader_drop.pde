float horizontal = 200;
float vertical = 200;

Ellipse ball;

void setup(){
  size(400,400);
  background(255);
  smooth();
}

void draw(){
  ball = new Ellipse(horizontal, vertical, 20, 20);
  ball.display();
  ball.goRight();
  ball.goUp();
  ball.goLeft();
  ball.goDown();
  
};

class Ellipse{
  float xpos, ypos;
  int widthBall, heightBall;
  Ellipse(float x, float y, int w, int h){
    xpos = x;
    ypos = y;
    widthBall = w;
    heightBall = h;
  }
  
  void display(){
    fill(0);
    filter( DILATE );
    ellipse(xpos, ypos, widthBall, heightBall);
  }
  
  void goRight(){
    if(vertical == 200){ 
      if(horizontal < width-100){
        horizontal+=2; 
      } 
    }
  };
  
  void goUp(){
    if(horizontal == width-100){  
      if(vertical >= 50){
        vertical -= 2;
      }
    }
  };
  
  void goLeft(){
    if(vertical <= 100){
      if(horizontal >= 100){
        horizontal-=2;
      }
    }
  };
  
  void goDown(){
    if(horizontal <= 100){
      if(vertical <= height-100){
        vertical+=2;
      }
    }
  };
}
 