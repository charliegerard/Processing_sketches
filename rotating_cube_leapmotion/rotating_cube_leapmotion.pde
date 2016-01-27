import de.voidplus.leapmotion.*;

LeapMotion leap;
float x = 0.8;
float y = 0.1;
boolean rotating = false;
int boxColor = 0;

void setup(){
  size(800,800, P3D);
  background(0);
  lights();
  leap = new LeapMotion(this).withGestures();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  noStroke();
  directionalLight(255, 255, 255, 1, 1, -2);
  spotLight(255, 255, 255, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  rotateX(-0.3);
  rotateY(-x);
  fill(boxColor);
  box(80);
  
  if(rotating == true){
    if(boxColor < 255){
       boxColor+=5;
    }

    x+=y;
      
    if(x > 10){
      y -= 0.01;
    } else if(x < 0.8){
      y = 0.1;
      rotating = false;
      x=1.0; 
    }
     
  }
}

void mousePressed(){
  rotating = !rotating;
}

void leapOnSwipeGesture(SwipeGesture g, int state){
  rotating = !rotating;
}
