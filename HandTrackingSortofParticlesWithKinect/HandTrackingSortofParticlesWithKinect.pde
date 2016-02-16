import org.openkinect.processing.*; //<>//
ParticleSystem ps;

// Kinect Library object
Kinect kinect;

float minThresh = 480;
float maxThresh = 830;
PImage img;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);
  ps = new ParticleSystem(new PVector(width/2, 50));
}


void draw() {
  background(0);

  img.loadPixels();

  // Get the raw depth as array of integers
  int[] depth = kinect.getRawDepth();

  float sumX = 0;
  float sumY = 0;
  float totalPixels = 0;
  
  int record = kinect.height;
  int rx = 0;
  int ry = 0;

  for (int x = 0; x < kinect.width; x++) {
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * kinect.width;
      int d = depth[offset];

      if (d > minThresh && d < maxThresh && x > 100) {
        img.pixels[offset] = color(255, 0, 150);
        
        if (y < record) {
          record = y;
          rx = x;
          ry = y;
        }

        sumX += x;
        sumY += y;
        totalPixels++;
      } else {
        img.pixels[offset] = color(0);
      }
    }
  }

  img.updatePixels();
  image(img, 0, 0);

  float avgX = sumX / totalPixels;
  float avgY = sumY / totalPixels;
  fill(150, 0, 255);
  //ellipse(avgX, avgY, 64, 64);
  ellipse(rx, ry, 64, 64);

  for (int i = 0; i < 10; i++) {
    //ps.addParticle(avgX, avgY);
    ps.addParticle(rx, ry);
  }
  ps.run();

  //fill(255);
  //textSize(32);
  //text(minThresh + " " + maxThresh, 10, 64);
}