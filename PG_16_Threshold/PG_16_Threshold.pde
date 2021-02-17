PImage img;
int numPixels;

void setup(){
  size(358, 444);
  numPixels = width*height;
  img = loadImage("beckett.jpg");
}

int maxOffset = 30;

void draw(){
  background(0);
  int lowPassThreshold = int(255.0*mouseX/width);
  int highPassThreshold = int(255.0*mouseY/height);
  println(lowPassThreshold + ", " + highPassThreshold); 
  loadPixels();
  for(int i = 0; i < numPixels; i = i + 1){
    int shade = int((red(img.pixels[i]) + green(img.pixels[i]) + blue(img.pixels[i]))/3.0);
    if(shade < lowPassThreshold && shade > highPassThreshold){
       pixels[i] = img.pixels[i];
    }
  }
  updatePixels();
}


void mouseClicked(){
  saveFrame("threshold.png");
}