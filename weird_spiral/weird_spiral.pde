float x = 0.0;
float y = 0.0;
float r = 0.0;
float theta = 0.0;

void setup(){
  size(600,600);
  background(0);
  smooth();
}

void draw(){
  x = r * cos(theta);
  y = r * sin(theta);
  
  fill(random(255), random(255), random(255));
  ellipse(x + width/2, y+height/2, y,x);
  
  theta += 0.2;
  r += 0.8;
  
  if(r > width){
    r = 0;
  }
}
