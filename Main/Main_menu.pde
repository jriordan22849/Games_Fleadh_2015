Main_menu main = new Main_menu();
class Main_menu
{
  float x;
  float x2;
  float y ;
  float y2;
  

  void display()
  {

    if(start_screen == true)
    {   
      // test size(800, 640)
     // background(bg); 
      x = width/3.2;
      y = height/4.2666;
      x2 = x + width/16;
      y2 = y + height/3.2;
      
      // outline box
      stroke(#FFC139);
      fill(#FFC139);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      
      // inner transparent box
      fill(#FFDE95);
      rect( x + width/80, y + height/64, x2 - width/40, y2 - height/32, width/160);
      
      // main menu options
      fill(#FFCE64);
      // first option
      rect( x + width/20, y + height/16, x2 - width/10 , y - height/6.4, width/160);
      
      fill(#9B9B9B);
      textSize(width/23);
      text("Start Game", x + width/13.3333, y + height/8);
      
      // second option
      fill(#FFCE64);
      rect( x + width/20, y + height/4.26666, x2 - width/10 , y - height/6.4, width/160);
      
      fill(#9B9B9B);
      text("Instructions", x + width/16, y + height/3.3684210526);
      
      // third option
      fill(#FFCE64);
      rect( x + width/20, y + height/2.4615384615, x2 - width/10 , y - height/6.4, width/160);
      
      fill(#9B9B9B);
      text("Leaderboard", x + width/17.77777777, y + height/2.13333333333);
      
      println("Mouse x is " + mouseX);
      println("Mouse y is " + mouseY);
      if( (mouseX >= width/2.7586206896) && (mouseX <= width/1.5686274509) && (mouseY >= height/3.3684210526) && (mouseY <= height/2.6122448979) )
      {
        fill(#9ACFFA);
        rect( x + width/20, y + height/16, x2 - width/10 , y - height/6.4, width/160);
        fill(#9B9B9B);
        text("Start Game", x + width/13.3333, y + height/8);
      }


      
    }
  }
}
