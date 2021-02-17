PImage img;
int numPixels;
int amount = 1;

void setup(){
  size(358, 444);
  numPixels = width*height;
  img = loadImage("beckett.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw(){
  amount = int(100.0*float(mouseX)/width)+1;
  int step = max(amount/10, 1);
  background(0);
  for(int i = 0; i < numPixels; i = i + step){
    fill(img.pixels[i], 10);
    rect(i - width*int(i/width), int(i/width), amount, amount);
  }
}