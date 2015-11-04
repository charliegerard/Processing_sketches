import gifAnimation.*;
GifMaker gifExport;

void setup(){
 size(600, 400);
 background(0);
 smooth();
 
 gifExport = new GifMaker(this, "test.gif");
 gifExport.setRepeat(0);
}
  
void draw(){
 fill(0,5);
 rect(0,0,width,height);
   
 stroke(255);
 strokeWeight(1);
 
 float t = frameCount / 200.00;
 for(int i = 0; i < 10; i++){
   bezier(
     0, height/2,
     0, noise(1, i, t)*height,
     noise(2, i , t)*width, noise(3, i, t)*height,
     width, noise(4,i, t)*height
     );
 }
 if (frameCount%2==0 &&  frameCount<10000) {
    gifExport.setDelay(5); // = speed of the animated GIF
    gifExport.addFrame();
  }
if (frameCount>121) gifExport.finish();

}