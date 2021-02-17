PImage g;
PImage l;

void setup(){
  size(displayWidth, displayHeight);

  g = loadImage("landscape.jpg");
  g.resize(width, height);
  g.filter(INVERT);
  g.loadPixels();

  l = loadImage("landscape.jpg");
  l.resize(width, height);
  l.loadPixels();
}

int modMax = 200000;
int fc = 0;
int fcDir = 1;

void draw(){
  background(0);
  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    pixels[i] = color(
      min(red(g.pixels[i]), red(improvedMod(l.pixels[i]+ fc, l.pixels.length))),
      min(green(g.pixels[i]), green(improvedMod(l.pixels[i]+ fc, l.pixels.length))),
      min(blue(g.pixels[i]), blue(improvedMod(l.pixels[i]+ fc, l.pixels.length)))
    );
  }
  updatePixels();
  fc += fcDir;
/*  if(fc >= modMax - 1 || fc <= 0){
    fcDir *= -1;
  }*/
}

int improvedMod(int n, int m){
  int r = n % m;
  if(r < 0){
    r += m;
  }
  return r;
}

void mousePressed(){
  saveFrame("######.png");
}
