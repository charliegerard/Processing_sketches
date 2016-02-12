
float d = 0;

void setup() {
  size(500, 400);
  smooth();
  background(255);
}
 
void draw() {
  noFill();
  stroke(0);
  translate(width/2, height/2);
  
  rotate(d*PI/300);

  for (float i = 0; i <= TWO_PI; i = i + PI/16) {
    //6th parameters separates the arcs
    arc(0, 0, d, d, i, i+0.05, OPEN);
  }
  
  d = d + .5;
  if (d > 500) {
    d=0;
  }
  
}