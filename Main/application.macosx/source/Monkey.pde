Monkey monkey = new Monkey();

class Monkey
{
  
  PVector pos;
  float ballSize;
  float speedX;
  float speedY;
  
  Monkey()
  {
    
    pos = new PVector(300, 100);
    ballSize = 60;
    speedY = 5;
    speedX = 0;
    
  }
  
  void display()
  {
    //draw monkey (clarence is the monkey, respect him)
    imageMode(CENTER);//this means that clarence is being drawn from the centre, not the corner as is the default setting
    image(clarence, pos.x, pos.y, ballSize, ballSize);
    //stroke(255);
    //fill(255); 
    //ellipse(pos.x, pos.y, ballSize, ballSize);
    
  }
  
  void update()
  {
    
    pos.x += speedX;
    pos.y += speedY;
    
      //Hit detection
      //alternate: if ( pos.y + (ballSize/2) >= (truck.pos.y - 40) &&  (pos.x + ballSize/2) >= truck.pos.x  && + pos.x <= (truck.pos.x + truck.tSize)  )
     if ( pos.y + (ballSize/2) >= (truck.pos.y - 40) && pos.y + (ballSize/2) <= (truck.pos.y - 35) && (pos.x + ballSize/2) >= truck.pos.x  && + pos.x <= (truck.pos.x + truck.tSize)  )
     {
       
       speedY *= -1;//reverse dirction of ball when it hits truck
        //angle the ball depending on loction it hits on truck
        float hit = pos.x - (truck.pos.x + truck.tSize); 
        speedX += (hit / (truck.tSize) ) * 2;
       
     }//end if
     
     
    //constrain ball/monkey to screen 
    if (pos.y <= 0 + (ballSize/2))
    {
      speedY *= -1;
    }
    else if ( pos.y >= height - (ballSize/2) )
    {
      end_screen = true;
    }
     
    if (pos.x >= width - (ballSize/2) || pos.x <= 0 + (ballSize/2))
    {
      speedX *= -1;
    }
    
     
   
  }//end update()
  
  
}//end class Monkey
