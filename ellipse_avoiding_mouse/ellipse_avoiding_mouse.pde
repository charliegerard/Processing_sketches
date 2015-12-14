void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(255);
  fill(0);
  noStroke();
  
  for(int x = 0; x < 50; x++){
    for(int y = 0; y < 50; y++){
      PVector position = new PVector(x * 10 + 5, y * 10 + 5);
      PVector mouse = new PVector(mouseX, mouseY);
      
      //substract the mouse position with the position of each ellipse.
      PVector variant = PVector.sub(mouse, position);
      variant.normalize();
      variant.mult(15.00);
      
      // new position of each ellipse;
      PVector newPosition = PVector.sub(position, variant);
      ellipse(newPosition.x, newPosition.y, 5,5);

    }
  } 
}