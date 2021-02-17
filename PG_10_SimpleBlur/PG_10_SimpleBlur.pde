PImage img;

void setup(){
  size(1762, 1241);
  img = loadImage("Butlins-Barry-Island.jpg");
  noStroke();
  int numPx = 1762*1241;
  for(int i = 0; i < numPx; i = i + 10){
    int y = round(i/width);
    int x= i - (y*width);
    color c = img.pixels[i];
    fill(red(c), green(c), blue(c), 10);
    rect(x, y, 20, 20);
  }
}