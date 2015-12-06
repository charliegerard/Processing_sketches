/* Todo: Make each line an object to be able to move each 
    of them separately on click.
    Also, at the moment, works only once. Need to change code
    so works no matter how many times I click.
*/

float y = 50;
float direction = 1;
float speed = 20;
boolean lineClicked;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(255);
  
  noFill();
  beginShape();
  vertex(20,50);
  bezierVertex(50,50, 190,y, 380, 50);
  endShape();
  
  beginShape();
  vertex(20,100);
  bezierVertex(50,100, 190,y+50, 380, 100);
  endShape();
  
  if(lineClicked == true){
    lineMove();
  }        
}

void mouseClicked(){
 if(mouseY > 45 && mouseY < 55){
       println("activate");
  lineClicked = true;
 }
}

void lineMove(){
  if(y > 70){
    direction = -direction;
  } else if(y < 30) {
    direction +=1;
  }

  if(speed >= 1){
   speed -= 0.1;
   y+=direction*speed;
  } else {
   y = 50;
  }
}