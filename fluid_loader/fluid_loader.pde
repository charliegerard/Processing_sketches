int degrees = 360;
float x, y;
float radius = 50;
float angle = 0;
float w = 0.0;
float hue = 0.0;
float colorChange = 0.0;

void setup(){
  size(400,400);
  smooth();
  x = width/2;
  y = height/2;
  colorMode(HSB, 300, 100, 100);
}

void draw(){
  fill(0, 5);
  rect(0,0, width, height);
  
  filter(DILATE);
  noStroke();
  fill(hue,100,100);

  ellipse(x + cos(w) * radius, y+sin(w) * radius, 20,20);
  
  ellipse(x + cos(-w) * radius, y+sin(-w) * radius, 20,20);


  w+=0.1;
   
  hue+=colorChange;
  
  if(hue < 360){
    colorChange+= 0.01;
  } else {
    colorChange = -colorChange;
  }

}