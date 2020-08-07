// Written by Andrew Sink, August 2020
// https://twitter.com/AndrewASink
// Code used from contributors below
/**
 * selectInput() for loadImage() in settings() (v1.1)
 * GoToLoop (2016-May-19)
 *
 * Forum.Processing.org/two/discussion/16705/
 * null-pointer-exception-when-loading-image-in-settings-p3-1-1#Item_1
 */

import controlP5.*;

ControlP5 cp5;

static final String RENDERER = JAVA2D; // JAVA2D, FX2D, P2D, P3D, OPENGL
PImage canvas;


void settings() {
  selectInput("Please select canvas picture:", "selectImage");
  print("Please select a picture to modify.\n");
  while (canvas == null)  delay(100);
  size(canvas.width, canvas.height, RENDERER);
  noSmooth();
  noLoop();
}


void draw() {
background(canvas);
}

void selectImage(final File f) {
  if (f == null || f.isDirectory()) {
    println("Window was closed or the user hit cancel.");
    System.exit(0);
  }
 
  final String canvasPath = f.getPath();
  println(canvasPath);
  print("Picture loaded successfully. Please press Enter or Return to remove color.\n");
 
  if ((canvas = loadImage(canvasPath)) == null) {
    println("is an invalid image file. Try again...\n");
    selectInput("Please select canvas picture:", "selectImage");
  }
}

void keyPressed() {
  if (keyCode == RETURN || keyCode == ENTER) {
    loadPixels();
  canvas.loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x+y*width;
      float r = red(canvas.pixels[loc]);
      float g = green(canvas.pixels[loc]);
      float b = blue(canvas.pixels[loc]);
      //pixels[loc] = color(r, g, b);
      pixels[loc] = color(r*.3+g*.59+b*.11);
    }
  }
  updatePixels();
print("File succesfully converted to greyscale.\nPlease click anywhere to exit program.\n");
}

  else 
redraw();
  }


void mousePressed() {                     
  save("Greyscale_Updated.png");
  print("File saved successfully\n");
  exit();
}
