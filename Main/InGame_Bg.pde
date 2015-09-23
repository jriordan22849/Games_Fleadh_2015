InGame_Bg inGame = new InGame_Bg();
class InGame_Bg
{
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) 
  {
  
    noFill();
  
    if (axis == Y_AXIS) 
    {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) 
      {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
  }



  void display()
  {

    if(main_screen == true)
    {   
      setGradient(0, 0, width, height, light, dark, Y_AXIS);
    }
  }
}
