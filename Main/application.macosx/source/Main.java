import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {

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
int light;
int dark;

// for the animation of the truck
//int currentFrame;
//int numFrames = 2;
//PImage[] Lkarl = new PImage[numFrames]; // 2 is number of images
//PImage[] Rkarl = new PImage[numFrames];


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

boolean devMode = true;
public boolean sketchFullScreen() 
{
  return ! devMode;
}

// counter
int counter = frameCount % 300;
int score = 0;

public void setup()
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
  fg = loadImage("RoadSide1.png");
  //Lkarl[0] = loadImage("truck1left.bmp");
  //Lkarl[1] = loadImage("truck2left.bmp");
  //Rkarl[0] = loadImage("truck1.bmp");
  //Rkarl[1] = loadImage("truck2.bmp");
  clarence = loadImage("monkey.png");
  // i_banana = loadI
  
  create_banana();
}

public void draw()
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
     
     textSize(30);
     fill(0xffFF0303);
     text("Score: " + score, 10, 50);
     
     for(RoadSide RoadSide:road)
     {
       RoadSide.pos.y = 4.5f*height/6;
       RoadSide.display();
       RoadSide.update();
       println(RoadSide.pos.x);
       println(RoadSide.prog);
     }
     

     //truck.pos.x = width/2;
     //truck.pos.y = height/6;
     truck.update();
     truck.display();
    // monkey.display();
     //monkey.update();

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
     
     truck.update();
     truck.display();
     fuel.display_level();
     fuel.line_for_fuel_level();
     tree.draw_tree();
     
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


public void create_banana()
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

public void create_fuel_power_up()
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
public void intialiseBG()
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
End_screen endscreen = new End_screen();
class End_screen
{
  public void display()
  {
     background(0);
     text("you lose, loser", 10, 30); 
  } 
}
Fuel fuel = new Fuel();
class Fuel extends Truck
{
   float fx, fy, fh, fw;
   float level_x = width / 1.06666666666667f ;
   float level_y = 50;
   float level_height = 30;
   float bar_speed;
   float temp;;
   
   Fuel(float fx, float fy, float fh, float fw)
   {
     this.fx = fx;
     this.fy = fy;
     this.fh = fh;
     this.fw = fw;
   }
   
   Fuel()
   {
   }
   
   public void fuel_display()
   {
      fill(0xffFF0015);
      //rect(fx, fy, fh, fw);
      fh ++;
      fw ++;
      
      if(fh >= 50)
      {
        fh = 50;
      }

      if(fw >= 50)
      {
        fw = 50;
      } 
   }
   
   public void display_level()
   {
     fill(0xff03FF1D);
     rect(750, 50, 10, 100);
   }
   
   public void line_for_fuel_level()
   {
      stroke(0xffFA7B77);
      strokeWeight(6);
      textSize(20);
      fill(0xffFF0303);
      text("FUEL", 660, 50 + bar_speed);
      
      line(720, level_y + bar_speed, 745, level_y + bar_speed);
      strokeWeight(1);
      
      if( main_screen == true)
      {
        if(keyPressed == true)
        {
          if ( (keyCode == RIGHT) || (keyCode == LEFT) )
          { 
            bar_speed += .1f; 
          } 
        }
      }
      
     temp = bar_speed + level_y;
     stroke(255);
     if( (temp >= 50) && (temp < 82) )
     {
       fill(0xff03FF1D);
       rect(750, 50, 10, 100);
     }
     if( (temp >= 82) && (temp < 114) )
     {
       fill(0xffFFCA58);
       rect(750, 50, 10, 100);
     }
     if( (temp >= 114) && (temp < 146) )
     {
       fill(0xffFF716C);
       rect(750, 50, 10, 100);
     }
     if((temp >= 146) )
     {
       fill(0xffFC150D);
       rect(750, 50, 10, 100);
       bar_speed = 146 - level_y;
       fuel_tank = 0;
       truck.speed = 0;
     }
     
   }
     
    
}
High_score Hscore = new High_score();
class High_score
{
  float back_x;
  float back_y;
  float back_x1;
  float back_y1;
  
  float x;
  float x2;
  float y ;
  float y2;
  
  public void display()
  {
    background(0xff30A521);
      
      back_x  = width / 20;
      back_y  = height / 1.1428571428f;
      back_x1 = width / 8;
      back_y1 = height / 16;
      x = width/3.2f;
      y = height/4.2666f;
      x2 = x + width/16;
      y2 = y + height/3.2f;
     
      
      fill(0xffFF0000);
      // Displays Score in the top left hand conrer
      if(devMode == true)
      {
         textSize(45); 
      }
      else if(devMode == false)
      {
        textSize(65);
      }
      textAlign(CENTER);
      text("LEADERBOARD", width / 3.1f, width / 12.8f);
      
      fill(255);
      stroke(255);
      rect( back_x,back_y,back_x1,back_y1 , width/160);
      
      println(mouseX, mouseY, width, height);
      
      
      // outline box
      stroke(0xffFFC139);
      fill(0xffFFDE89);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      
      if( (mouseX >= back_x ) && (mouseY >= back_y ) && (mouseX <= width/5.7142857142f) && (mouseY <= height/1.066666666f) )  // 140 & 600
      {
        fill(0);
        stroke(0);
        rect( back_x, back_y, back_x1, back_y1,  width/160);
      }
  }
}
InGame_Bg inGame = new InGame_Bg();
class InGame_Bg
{
  public void setGradient(int x, int y, float w, float h, int c1, int c2, int axis ) 
  {
  
    noFill();
  
    if (axis == Y_AXIS) 
    {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) 
      {
        float inter = map(i, y, y+h, 0, 1);
        int c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
  }



  public void display()
  {

    if(main_screen == true)
    {   
      setGradient(0, 0, width, height, light, dark, Y_AXIS);
    }
  }
}
Instruction_screen instruction = new Instruction_screen();
class Instruction_screen
{
  float back_x;
  float back_y;
  float back_x1;
  float back_y1;
  
  float x;
  float x2;
  float y ;
  float y2;
  

  public void display()
  {  
      background(0xff30A521);
      
      back_x  = width / 20;
      back_y  = height / 1.1428571428f;
      back_x1 = width / 8;
      back_y1 = height / 16;
      x = width/3.2f;
      y = height/4.2666f;
      x2 = x + width/16;
      y2 = y + height/3.2f;
     
      
      fill(0xffFF0000);
      // Displays Score in the top left hand conrer
      if(devMode == true)
      {
         textSize(45); 
      }
      else if(devMode == false)
      {
        textSize(65);
      }
      textAlign(CENTER);
      text("INSTRUCTIONS", width / 3.2f, width / 12.8f);
      
      fill(255);
      stroke(255);
      rect( back_x,back_y,back_x1,back_y1 , width/160);
      
      println(mouseX, mouseY, width, height);
      
      
      // outline box
      stroke(0xffFFC139);
      fill(0xffFFDE89);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      
      if( (mouseX >= back_x ) && (mouseY >= back_y ) && (mouseX <= width/5.7142857142f) && (mouseY <= height/1.066666666f) )  // 140 & 600
      {
        fill(0);
        stroke(0);
        rect( back_x, back_y, back_x1, back_y1,  width/160);
      }
      
 
      
    

  } 
}
Main_menu main = new Main_menu();
class Main_menu
{
  float x;
  float x2;
  float y ;
  float y2;
  

  public void display()
  {
    if(start_screen == true)
    {   
      // afgadgfvvbsb
      background(0xff30A521);
     
      x = width/3.2f;
      y = height/4.2666f;
      x2 = x + width/16;
      y2 = y + height/3.2f;
     
      // outline box
      stroke(0xffFFC139);
      fill(0xffFFC139);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      
      // inner transparent box
      fill(0xffFFDE95);
      rect( x + width/80, y + height/64, x2 - width/40, y2 - height/32, width/160);
      
      // main menu options
      fill(0xffFFCE64);
      // first option
      rect( x + width/20, y + height/16, x2 - width/10 , y - height/6.4f, width/160);
      
      fill(0xff9B9B9B);
      textSize(width/23);
      text("Start Game", x + width/13.3333f, y + height/8);
      
      // second option
      fill(0xffFFCE64);
      rect( x + width/20, y + height/4.26666f, x2 - width/10 , y - height/6.4f, width/160);
      
      fill(0xff9B9B9B);
      text("Instructions", x + width/16, y + height/3.3684210526f);
      
      // third option
      fill(0xffFFCE64);
      rect( x + width/20, y + height/2.4615384615f, x2 - width/10 , y - height/6.4f, width/160);
      
      fill(0xff9B9B9B);
      text("Leaderboard", x + width/17.77777777f, y + height/2.13333333333f);
      
      println("Mouse x is " + mouseX);
      println("Mouse y is " + mouseY);
      
      // if mouse is over a box in the menu, the box changes colour
      // first box
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height/3.3684210526f) && (mouseY <= height/2.6122448979f) )
      {
        stroke(0xffFF0000);
        fill(0xffFFCE64);
        rect( x + width/20, y + height/16, x2 - width/10 , y - height/6.4f, width/160);
        fill(0xff9B9B9B);
        text("Start Game", x + width/13.3333f, y + height/8);
      }
      
      // second box
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height / 2.1333333333f) && (mouseY <= height / 1.8285714285f) )
      {
        stroke(0xffFF0000);
        fill(0xffFFCE64);
        rect( x + width/20, y + height/4.26666f, x2 - width/10 , y - height/6.4f, width/160);
        fill(0xff9B9B9B);
        text("Instructions", x + width/16, y + height/3.3684210526f);
      }
      
      // third box
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height / 1.5496368039f ) && (mouseY <= height / 1.3617021277f) )
      {
        stroke(0xffFF0000);
        fill(0xffFFCE64);
        rect( x + width/20, y + height/2.4615384615f, x2 - width/10 , y - height/6.4f, width/160);
      
        fill(0xff9B9B9B);
        text("Leaderboard", x + width/17.77777777f, y + height/2.13333333333f);
      }
    }
    
    if(mousePressed)
    {
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height/3.3684210526f) && (mouseY <= height/2.6122448979f) )
      {
         main_screen = true;
         start_screen = false; 
      }
      
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height / 2.1333333333f) && (mouseY <= height / 1.8285714285f) )
      {
        instruction_screen = true;
        start_screen = false;
      }
      
      if( (mouseX >= width/2.7586206896f) && (mouseX <= width/1.5686274509f) && (mouseY >= height / 1.5496368039f ) && (mouseY <= height / 1.3617021277f) )
      {
        high_scrore_screen = true;
        main_screen = false;
      }
     
    }
  }
}
Monkey monkey = new Monkey();

class Monkey
{
  
  PVector pos;
  float ballSize;
  float speedX;
  float speedY;
  
  Monkey()
  {
    
    pos = new PVector(300, 100);
    ballSize = 60;
    speedY = 5;
    speedX = 0;
    
  }
  
  public void display()
  {
    //draw monkey (clarence is the monkey, respect him)
    imageMode(CENTER);//this means that clarence is being drawn from the centre, not the corner as is the default setting
    image(clarence, pos.x, pos.y, ballSize, ballSize);
    //stroke(255);
    //fill(255); 
    //ellipse(pos.x, pos.y, ballSize, ballSize);
    
  }
  
  public void update()
  {
    
    pos.x += speedX;
    pos.y += speedY;
    
      //Hit detection
      //alternate: if ( pos.y + (ballSize/2) >= (truck.pos.y - 40) &&  (pos.x + ballSize/2) >= truck.pos.x  && + pos.x <= (truck.pos.x + truck.tSize)  )
     if ( pos.y + (ballSize/2) >= (truck.pos.y - 40) && pos.y + (ballSize/2) <= (truck.pos.y - 35) && (pos.x + ballSize/2) >= truck.pos.x  && + pos.x <= (truck.pos.x + truck.tSize)  )
     {
       
       speedY *= -1;//reverse dirction of ball when it hits truck
        //angle the ball depending on loction it hits on truck
        float hit = pos.x - (truck.pos.x + truck.tSize); 
        speedX += (hit / (truck.tSize) ) * 2;
       
     }//end if
     
     
    //constrain ball/monkey to screen 
    if (pos.y <= 0 + (ballSize/2))
    {
      speedY *= -1;
    }
    else if ( pos.y >= height - (ballSize/2) )
    {
      end_screen = true;
    }
     
    if (pos.x >= width - (ballSize/2) || pos.x <= 0 + (ballSize/2))
    {
      speedX *= -1;
    }
    
     
   
  }//end update()
  
  
}//end class Monkey
class Power_ups
{
   float x, y, h, w;
   
   
   Power_ups(float x, float y, float h, float w)
   {
     this.x = x;
     this.y = y;
     this.h = h;
     this.w = w;
   }
   

   public void display()
   {
     fill(0xffFFE600);
//     rect(x, y, h, w);

    h = h+2;
    w = w+3;
    strokeWeight(1);
    beginShape();
    vertex(x-w, y+h);
    bezierVertex(x+40-w, y+h,  
                 x+20-w, y+40+h, 
                 x-w,    y+40+h);
    bezierVertex(x-w,    y+40+h, 
                 x+20-w, y+20+h, 
                 x-w,    y+h);
    endShape();
     
     if( y+h >= height)
     {
       h =0;
       x = random(width/5, 2*width - 50);
       y = random(-height/2 , 0); 
     }
     
     if( x-w <= -50)
     {
       w = 0;
       h = 0;
       x = random(width/5, 2*width - 50);
       y = random(-height/2 , 0); 
     }
   }
}
class RoadSide
{
  
  PVector pos  ;
  float   prog ;

  
  RoadSide()
  {
    pos = new PVector();
    
  }
  
  RoadSide(float prog)
  {
    this();
    
    this.prog = prog;

    setupSpawn();
  }
  
  
  public void update()
  {
    if(pos.x-prog<=-width)
    {
      pos.x = 0;
      pos.y = 475;
      prog = 0;
    }
      
  }
  
  public void display()
  {
    
    fill(0);
    stroke(255);

    // image(fg,pos.x-prog,pos.y,width*2,height/7);
    
    prog = prog + 3 ;
  }
  
  public void setupSpawn()
  {
    
    this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
Tree tree = new Tree();
class Tree
{
  public void draw_tree()
  {
    fill(0);
    stroke(0xffCB9321);
    noFill();
    strokeWeight(30);
    beginShape();
    vertex(150, 400);
    quadraticVertex(250, 50, 100, 50);
    endShape();
    
    fill(0);
    stroke(0xffCB9321);
    noFill();
    strokeWeight(30);
    beginShape();
    vertex(250, 400);
    quadraticVertex(150, 50, 300, 50);
    endShape();
 
    strokeWeight(1);
  }
}
class Trees
{
  PVector pos;
  float   prog ;

  
  Trees()
  {
    pos = new PVector();
    
  }
  
  Trees(float prog)
  {
    this();
    
    this.prog = prog;

    setupSpawn();
  }
  
  
  public void update()
  {
    if(pos.x-prog<=0)
    {
      pos.x = random(width,2*width/3);
      prog = 0;
    }
    
  }
  
  public void display()
  {
    
    fill(0);
    stroke(255);
   
    noFill();
    rect(pos.x-prog,pos.y,50,500);
    
    prog = prog + 5 ;
  }
  
  public void setupSpawn()
  {
    
    this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
Truck truck = new Truck();
class Truck
{
  PVector pos;
  float truckH;
  float truckW;
  float speed;
  float tSize; //width of trampoline/truck roof
  
  int fuel_tank = 1;
 
  
  boolean left_truck = false;
  boolean right_truck = true;


  
  Truck()
  {
    pos = new PVector(100, 580);
    truckH = 100;
    truckW = 150;
    speed = 5;
    tSize = 75;
    
  }  

  public void update()
  {
    keyPressed();
    
  }

  public void display()
  { 
    if(right_truck == true)
    {
      noFill();
      fill(0xff48B741);
      rect(pos.x     , pos.y -40    ,tSize ,40,5);
      fill(0xff48B741);
      rect(pos.x     , pos.y        ,tSize ,40,5);
      noFill();
      rect(pos.x+75  , pos.y -40    ,35 ,40,5);
      fill(0xff48B741);
      rect(pos.x+75  , pos.y        ,35 ,40,5);
      fill(0xff48B741);
      rect(pos.x+110 , pos.y        ,40 ,40,5);
      fill(0);
      ellipse(pos.x+25 ,pos.y+40, 30,30);
      ellipse(pos.x+120,pos.y+40, 30,30);
    }
    if(left_truck == true)
    {
      noFill();
      fill(0xff48B741);
      rect(pos.x     , pos.y - 40    ,75 ,40,5);
      fill(0xff48B741);
      rect(pos.x     , pos.y        ,75 ,40,5);
      noFill();
      rect(pos.x - 35  , pos.y -40    ,35 ,40,5);
      fill(0xff48B741);
      rect(pos.x - 35  , pos.y        ,35 ,40,5);
      fill(0xff48B741);
      rect(pos.x - 75 , pos.y        ,40 ,40,5);
      fill(0);
      ellipse(pos.x - 45 ,pos.y + 40, 30,30);
      ellipse(pos.x + 50,pos.y + 40, 30,30); 
    }
      
  }

  public void keyPressed()
  {
    
    if(keyPressed == true)
    {
      if ( (keyCode == RIGHT) )
      {
        if( pos.x > width)
        {
          pos.x = pos.x;
        }
        if(fuel_tank == 0)
        {
          pos.x = pos.x;
        }
        else
        {
          left_truck = false;
          right_truck = true;
          pos.x += speed;
        }
        

      }
      
      if ( (keyCode == LEFT) )
      {
        if( pos.x - 76 < 0)
        {
          pos.x = pos.x;
        }
        if(fuel_tank == 0)
        {
          pos.x = pos.x;
        }
        else
        {
          right_truck = false;
          left_truck = true;
          pos.x -= speed;
        }
      

      } 
    }
  }//end keypressed

  
  
}//end class
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#", "--stop-color=#cccccc", "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
