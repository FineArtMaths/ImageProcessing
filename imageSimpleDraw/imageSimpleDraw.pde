
PImage l;

void setup(){
  size(displayWidth, displayHeight, P2D);
  l = loadImage("landscape.jpg");
}

void draw(){
  l.filter(DILATE);
  image(l, 0, 0, width, height);
}