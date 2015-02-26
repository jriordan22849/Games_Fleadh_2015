Tree tree = new Tree();
class Tree
{
  void draw_tree()
  {
    fill(0);
    stroke(#CB9321);
    noFill();
    strokeWeight(30);
    beginShape();
    vertex(150, 400);
    quadraticVertex(250, 50, 100, 50);
    endShape();
    
    fill(0);
    stroke(#CB9321);
    noFill();
    strokeWeight(30);
    beginShape();
    vertex(250, 400);
    quadraticVertex(150, 50, 300, 50);
    endShape();
 
    strokeWeight(1);
  }
}
