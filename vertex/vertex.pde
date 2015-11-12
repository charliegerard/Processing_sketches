float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(640, 360);
  background(0);
}

void draw() {
  noFill();
  stroke(144, 56, 235);
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 0,300); // Option #1: 2D Noise
   
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  for(int i = 0; i < 100; i+=10){
    vertex(width, height);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}