float x;
float y;
float easing = 0.05;
Particle[] particles = new Particle[0];
float hue = 0.0;
float colorGraduation = 0.0;

void setup(){
  size(600, 600);
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  //background(0);
  fill(0, 8);
  rect(0,0,width, height);
 
  particles = (Particle[])append(particles, new Particle());
  
  for(int i = 0; i < particles.length; i++){ 
    particles[i].update();
    particles[i].display();
  }
  
  if (particles.length > 10) {
    particles = (Particle[])append(particles, new Particle());
  }

}

class Particle {
  float velX;
  float velY;
  float x;
  float y;
  
  float drag;
  float particleSize;
  
  Particle(){
    
    x = mouseX;
    y = mouseY;
   
    velX = random(-10, 10);
    velY = random(-10, 10);
    
    drag = 0.96;
    particleSize = 20;
    hue = 0;
  }
  
  void update(){
    velX*=drag;
    velY*=drag;
    
    x+=velX;
    y+=velY;
    if(particleSize > 0){
      particleSize-=0.5;
    }

    stroke(hue, 255, 255);
    
    if(hue < 360){
      hue += 0.5;
    } 

  }
  
  void display(){

    noFill();
    ellipse(x, y, particleSize, particleSize);
  }
}