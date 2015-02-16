/*
Games Fleadh 2015
JR,BM,AB & MQ
*/

// main screen image.
PImage bg;

int Y_AXIS = 1;
int X_AXIS = 2;
color light,dark;

boolean devMode = false;
boolean sketchFullScreen() 
{
  return ! devMode;
}


void setup()
{
  if (devMode)
  {
    size(800, 640);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  
  
  
 
  
  bg = loadImage("main_screen.jpg");
//  Background();
}

boolean start_screen = true;
boolean main_screen = false;
boolean end_screen = false;
boolean instruction_screen = false;
boolean high_scrore_screen = false;

void draw()
{
  if(start_screen == true)
  {
    main.display();
  }
  else if(main_screen == true)
  {
     light = color(random(200,255),random(200,255),random(200,255));  // Light Blue
     dark =  color(random(0,55),random(0,55),random(0,55));    // Dark Blue
     setGradient(0, 0, width, height, light, dark, Y_AXIS);
  }
  else if(end_screen == true)
  {
  }
  else if(instruction_screen == true)
  {
  }
  else if(high_scrore_screen == true)
  {
  }
  
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) 
{

  noFill();

  if (axis == Y_AXIS) 
  {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) 
    {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) 
  {  // Left to right gradient
    for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}


void Background()
{
//  int numGrad = 10;
//  float sectHeight = height/numGrad;
//  float sectWidth = width;
//  
//  
//  for(int i = 0; i< numGrad; i ++)
//  {
//    fill(150,200,250);
//    rect(0,(i)*sectHeight,sectWidth,sectHeight);
//  }
}
  
