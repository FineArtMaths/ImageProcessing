  PImage l;
  PImage g;
  PImage s;

void setup(){
  size(displayWidth, displayHeight, P2D);
  l = loadImage("landscape.jpg");
  g = loadImage("geometric.jpg");
  s = loadImage("silhouette.jpg");
  s.filter(BLUR, 100);
  s.resize(g.width, g.height);
  s.filter(INVERT);
  g.mask(s);
}


void draw(){
  l.filter(DILATE);
  image(l, 0, 0, width, height);
  image(g, 0, 0, width, height);
}