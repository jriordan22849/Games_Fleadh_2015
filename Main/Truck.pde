Truck truck = new Truck();
class Truck
{
  PVector pos;
  float truckH;
  float truckW;
  float speed;
  float tSize; //width of trampoline/truck roof

  
  Truck()
  {
    pos = new PVector(500, 500);
    truckH = 100;
    truckW = 150;
    speed = 10;
    tSize = 75;
    
  }  

  void update()
  {
    keyPressed();
    
  }

  void display()
  {    
//    if(keyPressed == true)
//    {
      
      noFill();
      fill(#48B741);
      rect(pos.x     , pos.y -40    ,tSize ,40,5);
      fill(#48B741);
      rect(pos.x     , pos.y        ,tSize ,40,5);
      noFill();
      rect(pos.x+75  , pos.y -40    ,35 ,40,5);
      fill(#48B741);
      rect(pos.x+75  , pos.y        ,35 ,40,5);
      fill(#48B741);
      rect(pos.x+110 , pos.y        ,40 ,40,5);
      fill(0);
      ellipse(pos.x+25 ,pos.y+40, 30,30);
      ellipse(pos.x+120,pos.y+40, 30,30);
      
      
      
      //image(karl, pos.x, pos.y, truckW,truckH);
// this makes the truck animation- turns the wheels- dont mind it, it just works -- okay great.....
      
//      if ( (keyCode == LEFT) )
//      {
//        currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
//        int offset = 0; // which frame
//      
//        for (int x = -100; x < width; x += Lkarl[1].width) 
//        { 
//          image(Lkarl[(currentFrame+offset) % numFrames], pos.x, pos.y, truckW,truckH);
//        }
//      }
//      
//      if ( (keyCode == RIGHT) )
//      {
//         currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
//        int offset = 0; // which frame
//      
//        for (int x = -100; x < width; x += Rkarl[1].width) 
//        { 
//          image(Rkarl[(currentFrame+offset) % numFrames], pos.x, pos.y, truckW,truckH);  
//        }
//      } 
//    } // end keyPressed()
    
  } // end display  
  
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
        else
        {
          
          pos.x += speed;
        }
        

      }
      
      if ( (keyCode == LEFT) )
      {
        if( pos.x < 0)
        {
          pos.x = pos.x;
        }
        else
        {
          pos.x -= speed;
        }
      

      } 
    }
  }//end keypressed

  
  
}//end class
