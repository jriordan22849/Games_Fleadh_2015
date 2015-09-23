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
//     rect(x, y, h, w);

    h = h+2;
    w = w+3;
    strokeWeight(1);
    beginShape();
    vertex(x-w, y+h);
    bezierVertex(x+40-w, y+h,  
                 x+20-w, y+40+h, 
                 x-w,    y+40+h);
    bezierVertex(x-w,    y+40+h, 
                 x+20-w, y+20+h, 
                 x-w,    y+h);
    endShape();
     
     if( y+h >= height)
     {
       h =0;
       x = random(width/5, 2*width - 50);
       y = random(-height/2 , 0); 
     }
     
     if( x-w <= -50)
     {
       w = 0;
       h = 0;
       x = random(width/5, 2*width - 50);
       y = random(-height/2 , 0); 
     }
   }
}
