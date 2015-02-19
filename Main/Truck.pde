Truck truck = new Truck();
class Truck
{
  PVector pos;
  float truckH;
  float truckW;
  float speed;

  
  Truck()
  {
    pos = new PVector(500, 500);
    truckH = 100;
    truckW = 150;
    speed = 10;
    
  }  

  void update()
  {
    keyPressed();
    
  }

  void display()
  {    
    if(keyPressed == true)
    {
      // this makes the truck animation- turns the wheels- dont mind it, it just works
      if ( (keyCode == LEFT) )
      {
        currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
        int offset = 0; // which frame
      
        for (int x = -100; x < width; x += Lkarl[1].width) 
        { 
          image(Lkarl[(currentFrame+offset) % numFrames], pos.x, pos.y, truckW,truckH);
        }
      }
      
      if ( (keyCode == RIGHT) )
      {
         currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
        int offset = 0; // which frame
      
        for (int x = -100; x < width; x += Rkarl[1].width) 
        { 
          image(Rkarl[(currentFrame+offset) % numFrames], pos.x, pos.y, truckW,truckH);  
        }
      } 
    } // end keyPressed()
    
  } // end display  
  
  void keyPressed()
  {
    
    if(keyPressed == true)
    {
      if ( (keyCode == RIGHT) )
      {
        if( pos.x > width)
        {
          pos.x -= 50;
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
          pos.x += 50;
        }
        else
        {
          pos.x -= speed;
        }
      

      } 
    }
  }//end keypressed

  
  
}//end class
