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
  
  
  void update()
  {
    
    
  }
  
  void display()
  {
    
    fill(0);
    stroke(255);
   
    noFill();
    rect(pos.x-prog,pos.y,50,500);
    
    prog = prog + 5 ;
  }
  
  void setupSpawn()
  {
    
    this.pos = new PVector(random(0, width), random(0, 5*height/6));

  }
}
