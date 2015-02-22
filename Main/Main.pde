/*
Games Fleadh 2015
JR,BM,AB & MQ
*/

// main screen image.
PImage bg;
PImage fg;
PImage karl; //karl is the truck, respect him
PImage clarence;//clarence is the monkey, respect him
PImage i_banana;
int Y_AXIS = 1;
int X_AXIS = 2;
color light;
color dark;

// for the animation of the truck
//int currentFrame;
//int numFrames = 2;
//PImage[] Lkarl = new PImage[numFrames]; // 2 is number of images
//PImage[] Rkarl = new PImage[numFrames];


int TREE_COUNT;
int ROAD_COUNT;

boolean colourSelect = true;
boolean start_screen = true;
boolean main_screen = false;
boolean end_screen = false;
boolean instruction_screen = false;
boolean high_scrore_screen = false;

ArrayList<RoadSide> road = new ArrayList<RoadSide>();
//ArrayList<Trees> tree = new ArrayList<Trees>();
ArrayList<Power_ups> banana_pu = new ArrayList<Power_ups>();
ArrayList<Fuel> fuel_pu = new ArrayList<Fuel>();

boolean devMode = true;
boolean sketchFullScreen() 
{
  return ! devMode;
}

// counter
int counter = frameCount % 300;

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
  
  //karl = loadImage("truck1.bmp");
  //bg = loadImage("main_screen.jpg");
  //fg = loadImage("RoadSide1.png");
  //Lkarl[0] = loadImage("truck1left.bmp");
  //Lkarl[1] = loadImage("truck2left.bmp");
  //Rkarl[0] = loadImage("truck1.bmp");
  //Rkarl[1] = loadImage("truck2.bmp");
  clarence = loadImage("monkey.png");
  // i_banana = loadI
  
  create_banana();
}

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
       RoadSide.pos.y = 4.5*height/6;
       RoadSide.display();
       RoadSide.update();
       println(RoadSide.pos.x);
       println(RoadSide.prog);
     }
     
     //truck.pos.x = width/2;
     //truck.pos.y = height/6;
     truck.update();
     truck.display();
     monkey.display();
     monkey.update();
     
     for(int i = 0; i < banana_pu.size(); i ++)
     {
       if( counter == 0)
       {
         banana_pu.get(i).display();
       }
     }
     
     if(banana_pu.isEmpty() )
     {
       create_banana();
     }
     
     for(int i = 0; i < fuel_pu.size(); i ++)
     {
       
       fuel_pu.get(i).fuel_display();
     }
     
     if(fuel_pu.isEmpty())
     {
       create_fuel_power_up();
     }
     
  }
  if(end_screen == true)
  {
    endscreen.display();
  }
  if(instruction_screen == true)
  {
    instruction.display();
  }
  if(high_scrore_screen == true)
  {
    Hscore.display();
  }
  
  
}


void create_banana()
{
  float x;
  float y;
  float h = 0;
  float w = 0;
  int num_banana = 8;
  
  for(int i = 0; i < num_banana; i ++)
  {
    x = random(width/5, 2*width - 50);
    y = random(-height/2 , 0);
    banana_pu.add(new Power_ups(x, y, h, w));
  }   
} // end create banana function 

void create_fuel_power_up()
{
  float fx, fy;
  float fh = 0;
  float fw = 0;
  int num_fuel = 1;
  
  for(int i = 0; i < num_fuel; i ++)
  {
    fx = random(0, width - 50);
    fy = 150;
    fuel_pu.add(new Fuel(fx, fy, fh, fw) );
  }  
}
void intialiseBG()
{  
  
    TREE_COUNT = 4;
    ROAD_COUNT = 4;
    
    //for(int i = 0; i < TREE_COUNT; i++) 
    {
      //tree.add(new Trees());
    } 
    
    for(int i = 0; i < ROAD_COUNT; i++) 
    {
      road.add(new RoadSide());
    } 
 
}
