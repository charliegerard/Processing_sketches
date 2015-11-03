float speed = 1;
float y = 180;
float x = 100;
float radius = 50;
float direction = 1;

void setup(){
  size(600,600);
  background(20);
  smooth();
}

void draw(){
  translate(width/2, height/2);
  stroke(random(255), 50, random(150), random(100));
  float radMin = 360 / 60 * speed;
  rotate(radians(radMin));
  line(0,0,0,y);
  
  speed += 0.1;
  
  if(y >= 200){
    direction = -direction;
  }
  if( y <= 180 ) {
    direction += 0.05;
  }
  y = y + direction;
}