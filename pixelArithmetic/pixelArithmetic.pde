PImage i;

void setup(){
  size(600, 600, P2D);
  i = loadImage("landscape.jpg");
  i.resize(600, 600);
}

void draw(){
  loadPixels();
  for(int j = 0; j < 100; j++){
    int x = round(random(0, width - 1));
    int y = round(random(0, height - 1));
    pixels[y*width + x] = i.pixels[y*width + x];
  }
  updatePixels();
}