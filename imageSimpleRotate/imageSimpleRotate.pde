PImage l;
float angle = 0;
void setup(){
  size(displayWidth, displayHeight, P2D);
  background(0);
  l = loadImage("landscape.jpg");
  l.resize(500, 500);
  frameRate(30);
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(l, -1*l.width/2, -1*l.height/2);
  popMatrix();
  angle = angle + 0.01;
}
