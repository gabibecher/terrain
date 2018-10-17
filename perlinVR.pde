//pz cam library 
//import processing.vr.*;
//import peasy.*; //figure this out

//add music to change height of mountains depending on the beat 

int cols, rows;
int scale = 20;
int w = 4000;
int h = 3000;

float[][] landscape;

void setup()
{
  fullScreen(P3D);
  lights();
  
  
  cols = w/scale;
  rows = h/scale;
  landscape = new float[cols][rows];
  float yOffset = 0;
  for (int y = 0; y < rows; y++)
  {
    float xOffset = 0;
    for (int x = 0; x < cols; x++)
    {
      landscape[x][y] = map(noise(xOffset,yOffset), 0, 1, -100, 100);
      xOffset += .2; // speed going through it 
    }
    yOffset += .2;
  }
}

void draw()
{
  background(0);
  
  translate(width/2, height/2+50); //0,0 in center now //play w this translatin
  rotateX(PI/3); //move mesh flat by 60 deg along x axis
  
  translate(-width/2, -height/2); //send back bc started drawing at center
  for (int y = 0; y < rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP); //for every row set vertices to draw triangles
    for (int x = 0; x < cols; x++)
    {
      stroke(255);
      fill(#BC9898);
      vertex(x*scale, y*scale, landscape[x][y]); //set vertices on top of row
      vertex(x*scale, (y+1)*scale, landscape[x][y+1]); // bottoms -- y below in 3d
    }
    endShape();
  }
  
  fill(#F5E9AB);
  stroke(#F2ECCB);
  pushMatrix();
  translate(width/4, height/5);
  sphere(100);
  popMatrix();
}