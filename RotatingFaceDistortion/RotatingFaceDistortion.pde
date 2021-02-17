PImage img;
PGraphics layer;

void setup(){
  size(displayHeight, displayHeight);
  img = loadImage("beckett.jpg");
  img.resize(height, height);
  layer = createGraphics(floor(width*2), floor(height*2));
  cachedPixelIdx = new color[img.pixels.length];
  calcCache();
  precache();
  frameRate(1000);
}

color[] cachedPixelIdx;
float[] addToX;
float[] addToY;

void calcCache(){
  addToX = new float[img.pixels.length];
  addToY = new float[img.pixels.length];
  for(int i = 0; i < img.pixels.length; i++){
    int x = i % height;
    int y = i / height;
    addToX[i] = y*y/(scale - 1000);
    addToY[i] = x*y/(scale - 1000);
  }
}

void precache(){
  for(int i = 0; i < img.pixels.length; i++){
    int x = i % height;
    int y = i / height;
    int newX = improvedMod(floor(
        x + scale*sin(y/div)// + addToX[i]
      ), height);
    int newY = improvedMod(floor(
        y + scale*cos(x/div)// + addToY[i]
      ), height);
    cachedPixelIdx[i] = height * newY + newX;
  }
}

float scale = 0;
float div = 0;

void draw(){
  layer.beginDraw();
  layer.background(255, 0, 0);
  layer.loadPixels();
  println(frameCount);
  float newScale = (float(width) - pow(frameCount, 1.5))/10;
  float newDiv = pow(frameCount, 1.5)/10;
  if(newScale != scale || newDiv != div){
    scale = newScale;
    div = newDiv;
    precache();
  }
  for(int i = 0; i < img.pixels.length; i++){
    int x = i % img.width;
    int y = i / img.width;
    color c =color(img.pixels[cachedPixelIdx[i]]);
    c = color(map(x, 0, width, red(c) - 50, red(c) + 50), map(y, 0, height, green(c) - 50, green(c) + 50), blue(c), 255);
    layer.pixels[layer.width*(y) + x] = c;
    layer.pixels[layer.width*(y) + layer.width - x - 1] = c;
    layer.pixels[layer.width*(layer.height - y - 1) + x] = c;
    layer.pixels[layer.width*(layer.height - y - 1) + layer.width - x - 1] = c;
  }
  layer.updatePixels();
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  image(layer, -1*layer.width/2, -1*layer.height/2);
  popMatrix();
//  saveFrame("######.png");
}

int improvedMod(int num, int mod){
  int retVal = num % mod;
  while(retVal < 0){
    retVal += mod;
  }
  return retVal;
}
