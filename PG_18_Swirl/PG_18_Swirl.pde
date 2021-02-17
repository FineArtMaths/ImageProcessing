///////////////////////////////////////////////////////
// This one is more complicated than the rest for two reasons:
// 1. It uses some maths (sines and cosines); the specific
//    algorithm was found by trial and error.
// 2. It pre-calculates a lot of stuff to make the draw() function
//    go faster; the code could be quite a lot simpler than this
//    if we didn't mind it running very slowly.
///////////////////////////////////////////////////////

PImage img;
int numPixels;
float factor;
int count = 0;
float countFactor = 0.001;
int[] y;
int[] x;
float[] scaleFactorSin;
float[] scaleFactorCos;
boolean[] pixelsAlive;

void setup(){
  size(1762, 1241);
  frameRate(1000);
  numPixels = width*height;
  img = loadImage("Butlins-Barry-Island.jpg");
  factor = PI/numPixels;
  x = new int[numPixels];
  y = new int[numPixels];
  scaleFactorSin = new float[numPixels];
  scaleFactorCos = new float[numPixels];
  pixelsAlive = new boolean[numPixels];
  for(int i = 0; i < numPixels; i = i + 1){
    y[i] = int(i/width);
    x[i] = i - width*y[i];
    scaleFactorSin[i] = y[i]*sin(i*factor);
    scaleFactorCos[i] = x[i]*cos(i*factor);
    pixelsAlive[i] = true;
  }  
}

float countFactorInc = 0.0005;

void draw(){
  // Precalculate the mult value that we'll use in the loop
  count = count + 1;
  countFactorInc = countFactorInc + 0.000005;
  countFactor = countFactor + countFactorInc;
  float mult = count*countFactor;
  background(0);
  
  loadPixels();
  for(int i = 0; i < numPixels; i = i + 1){
    if(pixelsAlive[i]){ 
      int idx = int(i + mult*scaleFactorSin[i] + mult*scaleFactorCos[i]);
      if(idx >=0 && idx < numPixels){
        pixels[i] = img.pixels[idx];
      } else {
        pixelsAlive[i] = false;
      }
    }
  }
  updatePixels();
}


void mouseClicked(){
  saveFrame("edges.png");
}