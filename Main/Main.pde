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


int TREE_COUNT;
int ROAD_COUNT;

boolean colourSelect = true;
boolean start_screen = false;
boolean main_screen = true;
boolean end_screen = false;
boolean instruction_screen = false;
boolean high_scrore_screen = false;

ArrayList<RoadSide> road = new ArrayList<RoadSide>();
//ArrayList<Trees> tree = new ArrayList<Trees>();
ArrayList<Power_ups> banana_pu = new ArrayList<Power_ups>();
ArrayList<Fuel> fuel_pu = new ArrayList<Fuel>();
ArrayList<Stones> stones = new ArrayList<Stones>();
ArrayList<Tree> tree = new ArrayList<Tree>();

boolean devMode = true;
boolean sketchFullScreen() 
{
  return ! devMode;
}

// counter
int counter = frameCount % 300;
int score = 0;
int speed = 5;

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
  
  fg = loadImage("RoadSide1.png");
  clarence = loadImage("monkey.png");

  
  create_banana();
  create_stones();
  create_tree();
     
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
     create_road();
     
     for(RoadSide RoadSide:road)
     {
       RoadSide.pos.y = 4.5*height/6;
       RoadSide.display();
       RoadSide.update();
       println(RoadSide.pos.x);
       println(RoadSide.prog);
     }
     
     for(int i = 0; i < stones.size(); i ++)
     {
       stones.get(i).display();
       stones.get(i).update();
       stones.get(i).check_stone();
     }
         
     for(int i = 0; i < tree.size(); i ++)
     {
       tree.get(i).draw_tree();
       tree.get(i).update();
       tree.get(i).check_tree();
     }
     
     truck.update();
     truck.display();

//     for(int i = 0; i < banana_pu.size(); i ++)
//     {
//       if( counter == 0)
//       {
//         banana_pu.get(i).display();
//       }
//     }
//          
//     
//     if(banana_pu.isEmpty() )
//     {
//       create_banana();
//     }
     
     for(int i = 0; i < fuel_pu.size(); i ++)
     {
       fuel_pu.get(i).fuel_display();
     }
     
     if(fuel_pu.isEmpty())
     {
       create_fuel_power_up();
     }

     truck.update();
     truck.display();
     fuel.display_level();
     fuel.line_for_fuel_level();   
    
      // display score
     textSize(30);
     fill(#FF0303);
     text("Score: " + score, 10, 50);
     
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

void create_tree()
{
  float x;
  float y;
  float tree_height;
  int num_tree = 5;
 
  for(int i = 0; i < num_tree; i ++)
  {
     x = random( 0, width - 50);
     y = 550;
     tree_height = height - 150;
     tree.add(new Tree(x, y, tree_height));
  } 
}

void create_road()
{
  float x = 0;
  float y = height / 1.16363636363636;
  fill(#FCA014);
  stroke(#FCA014);
  rect(x, y, width, height - y);
}

void create_stones()
{
  float RrandomX;
  float RrandomY;
  float var = height / 1.16363636363636;
  float Rw;
  float Rh;
  int num_stones = 1000;
  
  for(int i = 0; i < num_stones; i ++)
  {
    RrandomX =random(0, 800);
    RrandomY = random( var , height);
    Rw = random(2,7);
    Rh =  random(2,7);
    stones.add(new Stones(RrandomX, RrandomY, Rw, Rh));
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
    
    for(int i = 0; i < ROAD_COUNT; i++) 
    {
      road.add(new RoadSide());
    } 
}


