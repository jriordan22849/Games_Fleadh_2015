  


void setup()
{
  size(800, 640);
  background(#64FF36);
  smooth();
  
  for( int i = 0; i< 10000; i++)
  {
  float RrandomX =random(0, 800);
  float RrandomY = random( 550 , 640);
  float Rw = random(2,7);
  float Rh =  random(2,7);
  
  
  float Rcolour1 = 255;
  float Rcolour2 = random(140,220);
  float Rcolour3 = random(0,10);


  
  
    stroke(#B96A02);
    fill(Rcolour1,Rcolour2,Rcolour3);
    ellipse( RrandomX, RrandomY, Rw, Rh);
  }
 
}

