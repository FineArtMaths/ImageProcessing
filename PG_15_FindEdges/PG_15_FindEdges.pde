/**************************************************************
This code is a bit more advanced than what we did in class,
but it only uses a few little techniques we haven't covered.
These are explained in comments, so hopefully you can make
sense of it and use these some of ideas in your own work.
**************************************************************/

PImage img;
int numPx;
int threshold = 50;
int pointSize = 10;

void setup(){
  size(358, 444);
  numPx = width*height;
  img = loadImage("beckett.jpg");
  noStroke();
  fill(255, 100);
}

void draw(){
  // Set these two values depending on the position of the mouse
  threshold = int(200*float(mouseX)/width);
  pointSize = int(30*float(mouseY)/height);

  background(0);
  // Loop over all the pixels, jumping by 10 at a time
  // (change 10 to 1 for a more classic Photoshop "find edges" effect)
  for(int i = 0; i < numPx; i = i + 10){
    // isEdge is a function we've written below (we didn't cover functions in class)
    if(isEdge(img.pixels, i)){
      fill(img.pixels[i], 100);
      // Note now x and y are calculated here
      rect(i - width*int(i/width), int(i/width), pointSize, pointSize);
    }
  }
}

// This function takes the starting pixel and looks at the 8 
// pixels currounding it. If the colour difference is above
// threshold in any case, it returns TRUE, otherwise FALSE.
boolean isEdge(color[] px, int i){
  if(i > 0){
    if(colourDiff(px[i], px[i-1]) > threshold){
      return true;
    }
  }
  if(i < px.length - 2){
    if(colourDiff(px[i], px[i+1]) > threshold){
      return true;
    }
  }
  if(i > width){
    if(colourDiff(px[i], px[i-width]) > threshold){
      return true;
    }
  }
  if(i < px.length - width - 1){
    if(colourDiff(px[i], px[i+width]) > threshold){
      return true;
    }
  }
  
  if(i > width + 1){
    if(colourDiff(px[i], px[i-width - 1]) > threshold){
      return true;
    }
  }
  if(i > width - 1){
    if(colourDiff(px[i], px[i-width + 1]) > threshold){
      return true;
    }
  }
  if(i < px.length - width){
    if(colourDiff(px[i], px[i+width - 1]) > threshold){
      return true;
    }
  }
  if(i < px.length - width - 2){
    if(colourDiff(px[i], px[i+width]) > threshold){
      return true;
    }
  }
  return false;
}

// This uses abs(a-b) to get the difference between a and b without any minus sign.
// So here we just take the differences between the reds, greens and blues in the two colour.
// This is a useful little function you can steal for your own purposes!
int colourDiff(color c1, color c2){
  return int(abs(red(c1)-red(c2)) + abs(blue(c1)-blue(c2)) + abs(green(c1)-green(c2)));
}

void mouseClicked(){
  saveFrame("edges.png");
}