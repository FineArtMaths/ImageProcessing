PImage img1;
PImage img2;

void setup(){
  size(736, 769);
  img1 = loadImage("wallpaper1.jpg");
  img2 = loadImage("wallpaper2.jpg");
  noStroke();
  loadPixels();
  int imgToUse = 0;
  int numPixels = width*height;
  for(int i = 0; i < numPixels; i = i + 1){
    if(imgToUse == 0){
      pixels[i] = img1.pixels[i];
      imgToUse = 1;
    } else {
      pixels[i] = img2.pixels[i];
      imgToUse = 0;
    }
  }
  updatePixels();
}