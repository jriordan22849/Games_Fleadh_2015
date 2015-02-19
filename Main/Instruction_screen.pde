Instruction_screen instruction = new Instruction_screen();
class Instruction_screen
{
  float x;
  float x2;
  float y ;
  float y2;
  

  void display()
  {  
      background(#30A521);
     
      x = width/3.2;
      y = height/4.2666;
      x2 = x + width/16;
      y2 = y + height/3.2;
     
      
      fill(#FF0000);
      // Displays Score in the top left hand conrer
      if(devMode == true)
      {
         textSize(45); 
      }
      else if(devMode == false)
      {
        textSize(65);
      }
      text("INSTRUCTIONS", width / 3.2, width / 12.8);
    
      // outline box
      stroke(#FFC139);
      fill(#FFDE89);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      

  } 
}
