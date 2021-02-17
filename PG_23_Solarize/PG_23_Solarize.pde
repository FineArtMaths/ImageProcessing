PImage img;
int numPx;

void setup(){
  size(1762, 1241);
  numPx = 1762*1241;
  img = loadImage("Butlins-Barry-Island.jpg");
}

int threshold = 100;
void draw(){
  threshold = round(map(mouseY, 0, height, 0, 255));
  background(0);
  loadPixels();
  for(int i = 0; i < numPx; i = i + 1){
    color c = img.pixels[i];
    if (brightness(c) > threshold){
      pixels[i] = c;
    } else {
      pixels[i] = color(255 - red(c), 255 - green(c), 255 - blue(c));
    }
  }
  updatePixels();
}
