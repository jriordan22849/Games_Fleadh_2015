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
  
  
  void update()
  {
    if(pos.x-prog<=0)
    {
      pos.x = random(width,2*width/3);
      prog = 0;
    }

    
  }
  
  void display()
  {
    
    fill(0);
    stroke(255);
   
    
    rect(pos.x-prog,pos.y,50,500);
    
    prog = prog + 1 ;
  }
  
  void setupSpawn()
  {
    
    this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
