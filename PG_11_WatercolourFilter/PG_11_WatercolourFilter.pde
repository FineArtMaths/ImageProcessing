PImage img;
int numPx = 20000;
int csize = 10;
int alpha = 50;

void setup(){
  size(1762, 1241);
  img = loadImage("Butlins-Barry-Island.jpg");
  image(img, 0, 0);
  frameRate(100);
  noStroke();
}

void draw(){
  loadPixels();
  for(int i = 0; i < numPx; i++){
    int x= round(random(0, width - 1));
    int y = round(random(0, height - 1));
    int idx = (y*width) + x;
    fill(red(pixels[idx]), green(pixels[idx]), blue(pixels[idx]), alpha);
    ellipse(x, y, csize, csize);
  }
}