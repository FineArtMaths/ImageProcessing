void setup(){
  size(displayWidth, displayHeight);
  PImage g = loadImage("geometric.jpg");
  PImage l = loadImage("landscape.jpg");
  image(g, 0, 0, width, height);
  blend(l, 0, 0, width, height, 0, 0, width, height, MULTIPLY);
}