float xstart, ystart, squaresize;

void setup() {
  size(600, 600);
  background(150);
  xstart = random(100);
  ystart = random(100);
  squaresize = height/10;
}

void draw() {
  fill(150, 150, 150, 15);
  noStroke();
  rect(0, 0, width, height);

  stroke(0, 50);
  fill(6, 160, 200);
  
  xstart += 0.01;
  ystart += 0.02;

  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=3) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4);
  float edgeSize = noiseFactor * 20;
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}
