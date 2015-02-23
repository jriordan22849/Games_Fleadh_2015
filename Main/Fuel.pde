Fuel fuel = new Fuel();
class Fuel extends Truck
{
   float fx, fy, fh, fw;
   float level_x = width / 1.06666666666667 ;
   float level_y = 50;
   float level_height = 30;
   float bar_speed;
   float temp;;
   
   Fuel(float fx, float fy, float fh, float fw)
   {
     this.fx = fx;
     this.fy = fy;
     this.fh = fh;
     this.fw = fw;
   }
   
   Fuel()
   {
   }
   
   void fuel_display()
   {
      fill(#FF0015);
      //rect(fx, fy, fh, fw);
      fh ++;
      fw ++;
      
      if(fh >= 50)
      {
        fh = 50;
      }

      if(fw >= 50)
      {
        fw = 50;
      } 
   }
   
   void display_level()
   {
     fill(#03FF1D);
     rect(750, 50, 10, 100);
   }
   
   void line_for_fuel_level()
   {
      stroke(#FA7B77);
      strokeWeight(6);
      textSize(20);
      fill(#FF0303);
      text("FUEL", 660, 50 + bar_speed);
      
      line(720, level_y + bar_speed, 745, level_y + bar_speed);
      strokeWeight(1);
      
      if( main_screen == true)
      {
        if(keyPressed == true)
        {
          if ( (keyCode == RIGHT) || (keyCode == LEFT) )
          { 
            bar_speed += .1; 
          } 
        }
      }
      
     temp = bar_speed + level_y;
     stroke(255);
     if( (temp >= 50) && (temp < 82) )
     {
       fill(#03FF1D);
       rect(750, 50, 10, 100);
     }
     if( (temp >= 82) && (temp < 114) )
     {
       fill(#FFCA58);
       rect(750, 50, 10, 100);
     }
     if( (temp >= 114) && (temp < 146) )
     {
       fill(#FF716C);
       rect(750, 50, 10, 100);
     }
     if((temp >= 146) )
     {
       fill(#FC150D);
       rect(750, 50, 10, 100);
       bar_speed = 146 - level_y;
       fuel_tank = 0;
   //    truck.speed = 0;
     }
     
   }
     
    
}
