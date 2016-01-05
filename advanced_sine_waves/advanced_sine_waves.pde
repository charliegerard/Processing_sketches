float amplitude;
float y;
float offset;
float step = 0.5;
float I = 1 / step;
int frames = 0;

void setup(){
  size(800,400, P3D);
  background(0);
  smooth();
}

void draw(){
  stroke(255);
  background(0);
  
  frames +=2;
  
  for(int i = -50; i < height+50; i+=10){
    //left position;
    offset = width/2 + 100 * sin(i * PI / 180) - 100;
    //amplitude of waves.
    amplitude = 50 * sin((frames + i) * PI / 180); 
 
    for(int z = 0; z < width; z++){
      if(z < offset || z > offset+ (360 * step)){
        y = i;
      } else {
        y = amplitude * cos(PI / 180 * (z - offset) * I) + i - amplitude;
      }
      noFill();
      strokeWeight(2);
      point(z, y);
    }
  }
}