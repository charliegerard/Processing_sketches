int leftEyeXPos = 100;
int eyesYPos = 200;
int rightEyeXPos = 300;
int eyesSize = 100;
int centerEyeSize = 30;

float centerLeftEyeXPos = leftEyeXPos;
int rightLimitLeftEye = 150;
int leftLimitLeftEye = 50;
boolean rightLimitEyeReached = false;
boolean eyeBlinked = false;
float direction = 1;
float x = centerLeftEyeXPos;
float xRightEye = rightEyeXPos;
float speed = 1.5;


boolean animationStarted = false;

void setup() {
  size(400, 400);
}
void draw() {
  background(0);
  
  if(animationStarted){
      // eyes blank
    fill(255);
    ellipseMode(CENTER);
    // left eye;
    ellipse(leftEyeXPos, eyesYPos - eyesSize/4, eyesSize, eyesSize);
    // right eye;
    ellipse(rightEyeXPos, eyesYPos - eyesSize/4, eyesSize, eyesSize);
    
    //left eye center
    fill(150);
    ellipse(x, eyesYPos - eyesSize/4, centerEyeSize, centerEyeSize);
    fill(0);
    ellipse(x, eyesYPos - eyesSize/4, 10, 10);
    
    // left eye movement;
     x += (speed * direction);   
     if(x > rightLimitLeftEye - centerEyeSize/2 || x < leftLimitLeftEye + centerEyeSize/2){
       direction *= -1;
     }
     
    //right eye center
    fill(150);
    ellipse(xRightEye, eyesYPos - eyesSize/4, centerEyeSize, centerEyeSize);
    fill(0);
    ellipse(xRightEye, eyesYPos - eyesSize/4, 10, 10);
    
    // right eye movement;
    xRightEye += (speed * direction);
    if(xRightEye > 350 || xRightEye < 250){
       direction *= -1;
     }
    
    //lid?
    if(eyeBlinked){
      fill(0,0,0);
    } else {
      noFill();
    }
   
    ellipse(leftEyeXPos, eyesYPos - eyesSize/4, eyesSize, eyesSize);
    ellipse(rightEyeXPos, eyesYPos - eyesSize/4, eyesSize, eyesSize);     
  }

  
  saveFrame("output/eyes_####.png");
}

void mousePressed(){
  //eyeBlinked = true;
  animationStarted = true;
}

void mouseReleased(){
  //eyeBlinked = false;
  animationStarted = false;
}