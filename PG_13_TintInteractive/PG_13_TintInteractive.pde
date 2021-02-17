PImage img;

void setup(){
  size(736, 769);
  img = loadImage("wallpaper1.jpg");
}

void draw(){
  tint (255*mouseX/width, 255*mouseY/height, 255);
  println("tint(" + 255*mouseX/width + ", " + 255*mouseY/height + ", 255);");
  image(img, 0, 0);
}