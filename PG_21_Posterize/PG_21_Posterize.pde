PImage img;
int numPx;

void setup(){
  size(1762, 1241);
  numPx = 1762*1241;
  img = loadImage("Butlins-Barry-Island.jpg");
}

int grains = 10;
void draw(){
  grains = max(1, 200*mouseX/width);
  background(0);
  loadPixels();
  for(int i = 0; i < numPx; i = i + 1){
    pixels[i] = getColour(img.pixels, i);
  }
  updatePixels();
}

color getColour(color[] px, int i){
  return color(grains*(int(red(px[i])/grains)), 
               grains*(int(green(px[i])/grains)), 
               grains*(int(blue(px[i])/grains))
               ); 
}


void mouseClicked(){
  saveFrame("edges.png");
}