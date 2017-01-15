float a = 0;
float b = 0;
float c = 0;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  
  a = 0;
  for(int i = 0; i < width; i+=10){
    b = 0;
    for(int y = 0; y < height; y+=10){
      float angle = map(noise(a,b,c), 0, 1.0, 0, 2*PI);
      float x = 50 * cos(angle);
      float j = 50 * sin(angle);
      stroke(255);
      line(i, y, i+x, y+j);
      b += 0.05;
    }
    a += 0.05;
  }
  c += 0.01;
}