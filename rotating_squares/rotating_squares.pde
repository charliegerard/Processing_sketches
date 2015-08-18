int rectWidth = 20;
int rectHeight = rectWidth;
int xRect = 5;
int yRect = 5;

void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(0);
  rectMode(CENTER);
  
  for(int x=10; x < width; x+=20){
    for(int y=10; y < height; y+=20){
        pushMatrix();
        fill(random(155),200,255);

        noStroke();
        translate(x, y);
        rotate(radians(x+y+frameCount*10)*0.5, 10);
        rect(xRect,yRect,rectWidth,rectHeight);
        popMatrix();
    }
  }
}
