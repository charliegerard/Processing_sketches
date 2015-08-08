float angle = 10.0;
float speed = 1.0;
float scalar = 1;

void setup(){
  size(600,600);
  background(13, 24, 33);
  smooth();
}

void draw(){
  drawCircles();
}

void drawCircles(){
  background(13, 24, 33);
  float x = 300 + cos(angle) * scalar;
  float y = 300 + sin(angle) * scalar;
  
  fill(1, 240, 230);
  ellipse(x,y,30,30);
  
  angle += speed;
  scalar += speed;
}


void mousePressed(){
  background(13, 24, 33);
}
