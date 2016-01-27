import de.voidplus.leapmotion.*;

LeapMotion leap;
float x = 0.8;
float y = 0.05;
boolean rotating = false;

void setup(){
  size(400,400, P3D);
  background(0);
  lights();
  leap = new LeapMotion(this).withGestures();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  noStroke();
  directionalLight(255, 200, 100, 1, 1, 0);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  rotateX(-0.3);
  rotateY(-x);
  box(80);
  if(rotating == true){   
      x+=y;
      
      if(x < 5){
        y += 0.002;
      } else {
        y -= 0.001;
      }
      
      if(y < -0.08){
        y -= 0.01;
        rotating = false;
      }
  }
}

void leapOnSwipeGesture(SwipeGesture g, int state){
  rotating = !rotating;
}
