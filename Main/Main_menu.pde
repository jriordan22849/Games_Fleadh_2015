Main_menu main = new Main_menu();
class Main_menu
{
  int x;
  int x2;
  int y = 250;
  int y2;
  

  void display()
  {

    if(start_screen == true)
    {   
      background(bg); 
      x = 250;
      y = 150;
      x2 = x + 50;
      y2 = y + 200;
      
      // outline box
      stroke(#FFC139);
      fill(#FFC139);
      strokeWeight(4);
      rect(x, y, x2, y2, 5);
      
      // inner transparent box
      fill(#FFDE95);
      rect( x + 10, y + 10, x2 - 20, y2 - 20, 5);
      
      // main menu options
      fill(#FFCE64);
      // first option
      rect( x + 40, y + 40, x2 - 80 , y - 100, 5);
      
      fill(#9B9B9B);
      textSize(35);
      text("Start Game", x + 60, y + 80);
      
      // second option
      fill(#FFCE64);
      rect( x + 40, y + 150, x2 - 80 , y - 100, 5);
      
      fill(#9B9B9B);
      text("Instructions", x + 50, y + 190);
      
      // third option
      fill(#FFCE64);
      rect( x + 40, y + 260, x2 - 80 , y - 100, 5);
      
      fill(#9B9B9B);
      text("Leaderboard", x + 45, y + 300);
      
      println("Mouse x is " + mouseX);
      println("Mouse y is " + mouseY);
      if( (mouseX >= 290) && (mouseX <= 510) && (mouseY >= 190) && (mouseY <= 245) )
      {
        fill(#9ACFFA);
        rect( x + 40, y + 40, x2 - 80 , y - 100, 5);
        fill(#9B9B9B);
        text("Start Game", x + 60, y + 80);
      }


      
    }
  }
}
