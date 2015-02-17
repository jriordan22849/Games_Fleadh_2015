
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
    truckH = 50;
    truckW = 150;
    speed = 10;
    
  }  

  void update()
  {
    keyPressed();
    
  }

  void display()
  {    
    
    image(karl, pos.x, pos.y);
    //fill(0);
    //rect(pos.x, pos.y, truckW, truckH);
    
  }  
  
  void keyPressed()
  {
    
    if(keyPressed == true)
    {
      if ( (keyCode == LEFT) )
      {
        pos.x -= speed;
      }
      
      if ( (keyCode == RIGHT) )
      {
        pos.x += speed;
      } 
    }
  }//end keypressed

  
  
}//end class

