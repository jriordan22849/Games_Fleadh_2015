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

  void update()
  {
    keyPressed();
    
  }

  void display()
  { 
    if(right_truck == true)
    {
      noFill();
      fill(#48B741);
      rect(pos.x     , pos.y -40    ,tSize ,40,5);
      fill(#48B741);
      rect(pos.x     , pos.y        ,tSize ,40,5);
      fill(0);
      rect(pos.x+75  , pos.y -40    ,35 ,40,5);
      fill(#48B741);
      rect(pos.x+75  , pos.y        ,35 ,40,5);
      fill(#48B741);
      rect(pos.x+110 , pos.y        ,40 ,40,5);
      fill(0);
      ellipse(pos.x+25 ,pos.y+40, 30,30);
      ellipse(pos.x+120,pos.y+40, 30,30);
    }
    if(left_truck == true)
    {
      noFill();
      fill(#48B741);
      rect(pos.x     , pos.y - 40    ,75 ,40,5);
      fill(#48B741);
      rect(pos.x     , pos.y        ,75 ,40,5);
      fill(0);
      rect(pos.x - 35  , pos.y -40    ,35 ,40,5);
      fill(#48B741);
      rect(pos.x - 35  , pos.y        ,35 ,40,5);
      fill(#48B741);
      rect(pos.x - 75 , pos.y        ,40 ,40,5);
      fill(0);
      ellipse(pos.x - 45 ,pos.y + 40, 30,30);
      ellipse(pos.x + 50,pos.y + 40, 30,30); 
    }
      
  }

  void keyPressed()
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
