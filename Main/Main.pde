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

boolean colourSelect = true;
boolean start_screen = false;
boolean main_screen = true;
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
    if(colourSelect == true)
    {
       light = color(random(150,255),random(150,255),random(10,255));  // Light 
       dark =  color(0);//(random(0,55),random(0,55),random(0,55));           // Dark 
       colourSelect = false;
    }
     inGame.display();
     Truck1.update();
     Truck1.display();
     
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


