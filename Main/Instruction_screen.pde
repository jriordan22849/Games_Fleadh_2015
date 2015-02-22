Instruction_screen instruction = new Instruction_screen();
class Instruction_screen
{
  float back_x;
  float back_y;
  float back_x1;
  float back_y1;
  
  float x;
  float x2;
  float y ;
  float y2;
  

  void display()
  {  
      background(#30A521);
      
      back_x  = width / 20;
      back_y  = height / 1.1428571428;
      back_x1 = width / 8;
      back_y1 = height / 16;
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
      textAlign(CENTER);
      text("INSTRUCTIONS", width / 3.2, width / 12.8);
      
      fill(255);
      stroke(255);
      rect( back_x,back_y,back_x1,back_y1 , width/160);
      
      println(mouseX, mouseY, width, height);
      
      
      // outline box
      stroke(#FFC139);
      fill(#FFDE89);
      strokeWeight(width/200);
      rect(x, y, x2, y2, width/160);
      
      if( (mouseX >= back_x ) && (mouseY >= back_y ) && (mouseX <= width/5.7142857142) && (mouseY <= height/1.066666666) )  // 140 & 600
      {
        fill(0);
        stroke(0);
        rect( back_x, back_y, back_x1, back_y1,  width/160);
      }
      
 
      
    

  } 
}
