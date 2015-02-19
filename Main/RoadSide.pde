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
      pos.x = 0;
      pos.y = 475;
      prog = pos.y + prog; 
  }
  
  void display()
  {
    
    fill(0);
    stroke(255);
   
    
    image(fg,pos.x-prog,pos.y,width*2,75);
    
    prog = prog + 0.001 ;
  }
  
  void setupSpawn()
  {
    
    //this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
