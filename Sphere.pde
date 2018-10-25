class Sphere
{
  int c;
  int strokeC;
  float r;
  boolean atTop;
 // int vy;
  
  Sphere(int c, int strokeC, float r)
  {
    this.c = c;
    this.strokeC = strokeC;
    this.r = r;
    boolean atTop = false;
  //  int vy = 0;
  }
  
  void display()
  {
    pushMatrix();
    translate(width/4, height/5);
    fill(c);
    stroke(strokeC);
    sphere(r);
    popMatrix();
  }
}

//make sun rise until top, when it hits top light will explode