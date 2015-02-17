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
    if(pos.x-prog<=-width)
    {
      pos.x = 0;
      pos.y = 300;
      prog = 0;
    }

    
  }
  
  void display()
  {
    
    fill(0);
    stroke(255);
   
    
    image(fg,pos.x-prog,pos.y,1600,150);
    
    prog = prog + 1 ;
  }
  
  void setupSpawn()
  {
    
    this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
