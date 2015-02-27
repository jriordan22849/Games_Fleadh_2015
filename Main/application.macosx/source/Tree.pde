class Tree
{
  // bark
  float x;
  float y;
  float tree_height;
  float spacing = random(10, 40);
  int num_tree = (int)random(0, 3);
  
  // leaves
  float l_x;
  float l_y;
  float l_w;
  
  int speed = 5;
  /*
  Tree(float l_x, float l_y, float l_w)
  {
     this.l_x = l_x;
     this.l_y = l_y;
     this.l_w = l_w;
  }
  */
  
  
  Tree(float x, float y, float tree_height)
  {
    this.x = x;
    this.y = y;
    this.tree_height = tree_height;
  }
  
  void draw_tree()
  {
    fill(#AA6632);
    stroke(#8E5024);
    rect(x, y, spacing, -tree_height);
    
    fill(#39D337);
    stroke(#2FAD2D);
    ellipse(x + (spacing / 2), y - tree_height, 150,250);
  }
  
  void update()
  {
    keyPressed(); 
  }
  
  void check_tree()
  {
    for(int i = 0; i < tree.size(); i ++)
    {
      Tree t1 = tree.get(i);
      if(t1.x < -100)
      {
        tree.remove(i);
        float x = 799;
        float y = 550;
        float tree_height = height - 150;
        tree.add(new Tree(x, y,tree_height ));
      }
      if(t1.x > width)
      {
        tree.remove(i);
        float x = 1;
        float y = 550;
        float tree_height = height - 150;
        tree.add(new Tree(x, y,tree_height ));

      }
    }
       
  }
  
  void keyPressed()
  {
    
    if(keyPressed == true)
    {
      if ( (keyCode == RIGHT) )
      {
        if( x < width)
        {
          x -= speed;
        }
      }
      
      if ( (keyCode == LEFT) )
      {
        if( x > 0)
        {
          x += speed;
        }
      } 
    }
  }//end keypressed
}
