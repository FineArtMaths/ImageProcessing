PImage img1;
PImage img2;

void setup(){
  size(736, 769);
  img1 = loadImage("wallpaper1.jpg");
  img2 = loadImage("wallpaper2.jpg");
  noStroke();
}

void draw(){
  int stripSize = mouseX/20;
  loadPixels();
  int imgToUse = 0;
  int numPixels = width*height;
  for(int i = 0; i < numPixels; i = i + 1){
    if(imgToUse <stripSize){
      pixels[i] = img1.pixels[i];
      imgToUse = imgToUse + 1;
    } else {
      pixels[i] = img2.pixels[i];
      imgToUse = imgToUse + 1;
      if(imgToUse >stripSize*2){
        imgToUse = 0;
      }
    }
  }
  updatePixels();
}


void mouseClicked(){
  saveFrame("interleave.png");
}