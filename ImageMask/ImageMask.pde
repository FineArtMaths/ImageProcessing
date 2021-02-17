PGraphics mask;
PImage img;
int radius = 60;
color black = color(0);

void setup(){
  size(1762, 1241);
  img = loadImage("Butlins-Barry-Island.jpg");
  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.background(255);
  mask.endDraw();
}

void draw(){
  background(0);
  loadPixels();
  for(int i = 0; i < pixels.length; i = i + 1){
    if(mask.pixels[i] == black){
      pixels[i] = img.pixels[i];
    }
  }
  updatePixels();
}

void mouseMoved(){
  mask.beginDraw();
  mask.fill(0);
  mask.stroke(0);
  mask.ellipse(mouseX, mouseY, radius, radius);
  mask.endDraw();
}