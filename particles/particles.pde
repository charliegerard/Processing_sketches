float PARTICLE_RADIOUS = 3.0;
float PARTICLE_NUM = 1000;
float FORCE = 6.0;

ArrayList<Particle> particles;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  frameRate(24);  
  particles = new ArrayList<Particle>();
  for(int i=0; i < PARTICLE_NUM; i++){
    particles.add(new Particle());
  }
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for(Particle particle : particles){
    particle.draw();
  }
  
  popMatrix();
  
  for(Particle particle : particles){
    particle.update();
  }
}

class Particle{
  PVector position;
  PVector velocity;
  color c;
  
  Particle(){
    position = new PVector(random(200) - 100, random(200) - 100);
    //velocity = new PVector(random(10), random(10));
    velocity = new PVector(1,1);
    c = color(random(255), random(255), random(255));
  }
  
  void draw(){
    fill(c);
    ellipse(position.x, position.y, PARTICLE_RADIOUS * 2, PARTICLE_RADIOUS * 2);
  }
  
  void update(){
    PVector acceleration = new PVector(FORCE * -1.0 * position.x / position.mag(), FORCE * -1.0 * position.y / position.mag());
    velocity.add(acceleration);
    position.add(velocity);
  }
}