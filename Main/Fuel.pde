class Fuel
{
   float fx, fy, fh, fw;
   
   Fuel(float fx, float fy, float fh, float fw)
   {
     this.fx = fx;
     this.fy = fy;
     this.fh = fh;
     this.fw = fw;
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
    
}
