class Power_ups
{
   float x, y, h, w;
   
   
   Power_ups(float x, float y, float h, float w)
   {
     this.x = x;
     this.y = y;
     this.h = h;
     this.w = w;
   }
   

   void display()
   {
     fill(#FFE600);
     rect(x, y, h, w);
     h ++;
     w ++;
     
     if( h >= 50)
     {
       h = 50;
     }
     
     if( w >= 50)
     {
       w = 50;
     }
   }
}
