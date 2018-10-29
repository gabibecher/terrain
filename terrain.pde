//import processing.vr.*;
//import peasy.*; //figure this out
//PeasyCam cam;


//add music to change height of mountains depending on the beat 

//look at flying in proecssig book

//git commit git push
// git commit -a -m "initial commit"
//git push

int cols, rows;
int scale = 20;
int w = 4000;
int h = 3000;

ArrayList<Sphere> spheres;

PImage mountain;

float[][] landscape;

void setup()
{
  fullScreen(P3D);
  
  spheres = new ArrayList<Sphere>();
  spheres.add(new Sphere(color(251, 252, 212), color(255), 100));
    
 /* cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);*/
  
    
  mountain = loadImage("mountain.jpg");
  texture(mountain);
  
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

void draw() //give client give class file name for texture
{
  background(0);
  
  
  /*fill(0,0,255); //practice rectangle
  pushMatrix();
  translate(width/2, height/5);
  beginShape();
  texture(mountain);
  vertex(10, 20, 0, 0);
  vertex(80, 5, 100, 0);
  vertex(95, 90, 100, 100);
  vertex(40, 95, 0, 100);
  endShape();
  popMatrix();*/
  
  //lights();
  
  translate(width/2, height/2+50); //0,0 in center now //play w this translatin
  rotateX(PI/3); //move mesh flat by 60 deg along x axis
  
  translate(-width/2, -height/2); //send back bc started drawing at center
  for (int y = 0; y < rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP); //for every row set vertices to draw triangles
    texture(mountain);
    for (int x = 0; x < cols; x++)
    {
      stroke(255);
      //noStroke();
      fill(#BC9898);
      vertex(x*scale, y*scale, landscape[x][y], map(x,0,cols,0,mountain.width), map(y,0,rows,0,mountain.height)); //set vertices on top of row //add u and v depending on width and hiegh of image
      vertex(x*scale, (y+1)*scale, landscape[x][y+1], map(x,0,cols,0,mountain.width), map(y,0,rows,0,mountain.height)); // bottoms -- y below in 3d
    }
    endShape();
  }
  
  for(Sphere s: spheres)
  {
    s.display();
    
  /*  while(s.posY > height-s.r)
    {
      s.posY-=800; 
    }*/
  }
}
  
/*void keyPressed()
{
  if(keyCode == UP)
  {
    spheres.get(0).posY -=1;
  }
}*/