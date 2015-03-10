class Stones 
{
  float RrandomX;
  float RrandomY;
  float Rw;
  float Rh;
  float Rcolour1 = 255;
  float Rcolour2 = random(140,220);
  float Rcolour3 = random(0,10);

  Stones(float RrandomX, float RrandomY, float Rw, float Rh)
  {
    this.RrandomX = RrandomX;
    this.RrandomY = RrandomY;
    this.Rw = Rw;
    this.Rh = Rh;
  }
  
  void check_stone()
  {
    for(int i = 0; i < stones.size(); i ++)
    {
      Stones s1 = stones.get(i);
      if(s1.RrandomX < 0)
      {
        stones.remove(i);
        float RrandomX = 799;
        float RrandomY = random( 550 , 640);
        float Rw = random(2,7);
        float Rh =  random(2,7);
        stones.add(new Stones(RrandomX, RrandomY, Rw, Rh));
      }
      if(s1.RrandomX > width)
      {
        stones.remove(i);
        float RrandomX = 1;
        float RrandomY = random( 550 , 640);
        float Rw = random(2,7);
        float Rh =  random(2,7);
        stones.add(new Stones(RrandomX, RrandomY, Rw, Rh));
      }
    }
       
  }
  
  void update()
  {
    RrandomX -= speed;
  }
  
  void display()
  {
      stroke(#B96A02);
      fill(Rcolour1,Rcolour2,Rcolour3);
      ellipse( RrandomX + speed , RrandomY, Rw, Rh);
  }
  

}
 
