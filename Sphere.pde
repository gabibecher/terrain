class Sphere
{
  int c;
  int strokeC;
  float r;
  PVector velocity;
  int posY;
  boolean atTop;
 // int vy;
  
  Sphere(int c, int strokeC, float r)
  {
    this.c = c;
    this.strokeC = strokeC;
    this.r = r;
    velocity = new PVector(0, 40);
    boolean atTop = false;
    posY = width/5;
  //  int vy = 0;
  }
  
  void display()
  {
    pushMatrix();
    translate(width/4, posY);
    fill(c);
    stroke(strokeC);
    sphere(r);
    popMatrix();
    
    while(posY > height-r)
    {
      posY+=20;
    }
  }
}

//make sun rise until top, when it hits top light will explode