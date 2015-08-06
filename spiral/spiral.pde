float angle;
float widthShape;
float heightShape;

void setup(){
  size(300,300);
  background(255);
  smooth();
  
  noFill();
  rectMode(CENTER);
  stroke(128);
}

void draw(){
  angle = angle + 0.02;
 
  if(widthShape > 200){
    widthShape = -widthShape;
  } else {
    widthShape = widthShape + 0.5;
  }
  heightShape = widthShape;
  
  translate(width/2, height/2);
  rotate(angle);
  stroke(random(255), random(255), random(255));
  rect(0, 0, widthShape, heightShape);
}
