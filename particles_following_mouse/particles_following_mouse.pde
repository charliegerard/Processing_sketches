float x;
float y;
float easing = 0.05;
Particle[] particles = new Particle[0];

void setup(){
  size(600, 600);
  smooth();
}

void draw(){
  background(0);
 
  particles = (Particle[])append(particles, new Particle());
  
  for(int i = 0; i < particles.length; i++){ 
    particles[i].display();
  }
  
  if (particles.length > 10) {
    particles = (Particle[])append(particles, new Particle());
  }

}

class Particle {
  float targetX;
  float targetY;
  float velX;
  float velY;
  float x;
  float y;
  
  float drag;
  
  Particle(){
    targetX = mouseX;
    targetY = mouseY;
    
    //x = mouseX;
    //y = mouseY;
    
    //velX = random(-10, 10);
    //velY = random(-10, 10);
    velX = random(-10, 10);
    velY = random(-10, 10);
    
    //drag = 0.96;
  }
  
  void display(){
    
    //float distanceX = targetX - x;
    //x += distanceX * easing;
 
    //float distanceY = targetY - y;
    //y += distanceY * easing;
    
    velX+=targetX - x;
    velY+=targetY - y;

    //velY+=0.05;
    
    x+=velX * easing;
    y+=velY * easing;

    fill(255);
    ellipse(x, y, 20, 20);
  }
}