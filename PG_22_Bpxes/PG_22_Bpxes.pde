PImage img;
int numPx = 1762*1241;

void setup(){
  size(1762, 1241);
  img = loadImage("Butlins-Barry-Island.jpg");
  noStroke();
  loadPixels();
  color lastPx = color(0);
  for(int i = 0; i < numPx; i = i + 1){
    if(random(0,1) > 0.9){
      pixels[i] = img.pixels[i];
      lastPx = pixels[i];
    } else {
      pixels[i] = lastPx;
    }
  }
  updatePixels();
}


void mouseClicked(){
  saveFrame("edges.png");
}