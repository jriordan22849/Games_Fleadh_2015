Main_menu main = new Main_menu();
class Main_menu
{
  int x;
  int x2;
  int y = 250;
  int y2;
  

  void display()
  {

    if(devMode == true)
    {   
      background(bg); 
      x = 250;
      y = 150;
      
      // outline box
      stroke(#FFC139);
      fill(#FFC139);
      strokeWeight(4);
      rect(x, y, x + 50, y + 200, 5);
      
      // inner transparent box
      
      fill(#FFDE95);
      rect( x + 10, y + 10, x + 30, y + 180);
      
      fill(#FCBB2B);
      rect( x + 20, y + 20, x + 10, y - 100);


      
    }
  }
}
