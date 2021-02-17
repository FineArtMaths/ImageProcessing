PImage img;
int numPx;

void setup(){
  size(1762, 1241);
  img = loadImage("Butlins-Barry-Island.jpg");
  numPx = 1762*1241;
}

void draw(){
  color tmpPx = 0;
  int mx = mouseX;
  int idx;
  loadPixels();
  for(int y = 0; y < height; y = y + 1){
    for(int x = 0; x < width; x = x + 1){
      idx = y*width + x;
      if(x <= mx){
        pixels[idx] = img.pixels[idx];
        if(x == mx){
          tmpPx=img.pixels[idx];
        }
      } else {
        pixels[idx] = tmpPx;
      }
    }
  }
  updatePixels();
}


void mouseClicked(){
  saveFrame("edges.png");
}