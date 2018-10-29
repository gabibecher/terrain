class Sphere
{
  int c;
  int strokeC;
  float r;
  PVector velocity;
  PVector position;
  boolean atTop;
 // int vy;
  
  Sphere(int c, int strokeC, float r)
  {
    this.c = c;
    this.strokeC = strokeC;
    this.r = r;
    position = new PVector(width/4, height/5);
    velocity = new PVector();
    velocity.set(0,0,20.0);
    boolean atTop = false;
    //int posY = height/5;
  //  int vy = 0;
  }
  
  void display()
  {
    pushMatrix();
    translate(position.x, position.y, position.z);
    fill(c);
    stroke(strokeC);
    sphere(r);
    popMatrix();
    
    position.add(velocity);

        
    if(position.z<-height+r || position.z >-height-r)
         atTop = true;
    
 /*   if(atTop == true)
    {
      
    }*/
  }
}

//make sun rise until top, when it hits top light will explode