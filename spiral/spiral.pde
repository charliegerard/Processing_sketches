float x=50;
float circleWidth=50;
float circleHeight=50;
float angle=0.1;
 
void setup(){
  background(0);
  size(600,600);
}
 
void draw(){
  // move origin to the centre of the canvas
  translate(width/2,height/2);
  //rotation in radians increasing each loop
  rotate(angle);
  angle+=0.1;
  noFill();
  stroke(random(255), random(255), random(255));
  ellipse(x,0,circleWidth,circleHeight);
  
  x+=0.5;
  circleWidth+=0.5;
  circleHeight+=0.25;
}