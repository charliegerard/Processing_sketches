Cell[][] grid;

int colums = 80;
int rows = 80;

void setup(){
  size(800,800);
  grid = new Cell[colums][rows];
  for(int i = 0; i < colums; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j] = new Cell(i*15, j*15, width/60, height/60, i+j);
    }
  }
}

void draw(){
  background(0);
  for(int i = 0; i < colums; i++){
    for(int j = 0; j < rows; j++){
      grid[i][j].display();
    }
  }
}

class Cell{
  float x,y;
  float w,h;
  float angle;
  
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
    fill(mouseX, mouseY, mouseX);
  }
  
  void display(){
    stroke(255);
    fill(random(255), random(255), random(255));
    rect(x,y,w,h);
  }
}

