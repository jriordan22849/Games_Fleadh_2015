/*
Games Fleadh 2015
JR,BM,AB & MQ
*/

// main screen image.
PImage bg;
int Y_AXIS = 1;
int X_AXIS = 2;
color light;
color dark;

int TREE_COUNT;
int ROAD_COUNT;

ArrayList<RoadSide> road = new ArrayList<RoadSide>();
ArrayList<Trees> tree = new ArrayList<Trees>();

boolean devMode = true;
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
      intialiseBG();
       light = color(random(150,255),random(150,255),random(10,255));  // Light 
       dark =  color(0);//(random(0,55),random(0,55),random(0,55));           // Dark 
       colourSelect = false;
    }
     inGame.display();
     for(RoadSide RoadSide:road)
     {
       RoadSide.display();
       RoadSide.update();
       println(RoadSide.pos.x);
       println(RoadSide.prog);
     }
     //Truck.pos.x = width/2;
     //Truck.pos.y = height/6;
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

void intialiseBG()
{  
  
    TREE_COUNT = 4;
    ROAD_COUNT = 4;
    
    for(int i = 0; i < TREE_COUNT; i++) 
    {
      tree.add(new Trees());
    } 
    
    for(int i = 0; i < ROAD_COUNT; i++) 
    {
      road.add(new RoadSide());
    } 
 
}

