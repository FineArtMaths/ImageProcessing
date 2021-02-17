PImage img;
int numPixels;
int amount = 1;

void setup(){
  size(358, 444);
  numPixels = width*height;
  img = loadImage("beckett.jpg");
}

int pxSize = 30;

void draw(){
  pxSize = max(1, int(100 * float(mouseX)/width));
  background(0);
  for(int y = 0; y < height; y = y + pxSize){
    for(int x = 0; x < width; x = x + pxSize){
      fill(img.pixels[y*width + x]);
      rect(x, y, pxSize, pxSize);
    }
  }
}


void mouseClicked(){
  saveFrame("pixellate.png");
}