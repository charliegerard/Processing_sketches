int w; //width of wave;
int xspacing = 16; //spacing between each ellipse on wave

float theta = 0.0; //start angle at 0;
float amplitude = 50; //Height of the wave
float amountPixels = 500;
float dx;
float[] yvalues; // storing height values from wave.

void setup(){
  size(600, 300);
  w = width+16;
  dx = (TWO_PI / amountPixels) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw(){
  background(0);
  calculateWave();
  renderWave();
}

void calculateWave(){
  theta += 0.02;
  
  float x = theta;
  for(int i = 0; i < yvalues.length; i++){
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}
  
void renderWave(){
  noStroke();
  fill(255);
  for(int x = 0; x < yvalues.length; x++){
    ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
  }
}