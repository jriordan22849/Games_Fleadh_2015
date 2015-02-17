
Truck Truck1 = new Truck();
class Truck
{
  PVector pos;
  float CenterX;
  float CenterY;
  
  Truck()
  {
    pos = new PVector();
    setupSpawn();
  }
  
  
  

  void update()
  {
    keyPressed();
  }

  void display()
  {    
    truck();
  }  
  
  void truck()
  {
    
    fill(0);
    rect(pos.x,pos.y,50,50);
    
  }
  
  void setupSpawn()
  {
    this.CenterX= StartPosX;
    this.CenterY= StartPosY;
    this.pos = new PVector(CenterX,CenterY);
  }
  
  void keyPressed()
  {
    if(key==CODED)
    {
      if(keyCode == RIGHT)
      {
        pos.x = pos.x + 1;
      }
    
      if(keyCode == LEFT)
      {
        pos.x = pos.x - 1;
      }
    }
  }
  
}
