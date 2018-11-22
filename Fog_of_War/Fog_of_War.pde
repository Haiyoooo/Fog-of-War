// Fog of War
// 22 November 2018
// by Eunice Lim

/*
 A black overlay is placed on the entire canvas, with a small revealing circle around the mouse.
 Click to increase the size of the revealed area.
 Size is the size of the circle
*/
// Formula for circle vertexes from David Shiffman @ https://www.youtube.com/watch?v=76fiD5DvzeQ
float size = 50;
  
void setup()
{
  size(400, 400);
  colorMode(HSB, 100);
}

void draw()
{
  background(100, 100, 100);
  
  // random shapes in the background for illustration
  fill(50);
  rect(100, 100, 50, 50);
  fill(10, 48, 29);
  ellipse(300, 200, 200, 100);
  
  // fog of war
  fogOfWar();
}

void fogOfWar()
{
  // Begin shape
  beginShape();
  
  // darkness
  fill(0);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  
  // circular area of vision
  beginContour();
  for(int i = 0; i < 360; i ++)
  {
   float a = radians(i);
   float x = size * sin(a) + mouseX;
   float y = size * cos(a) + mouseY;
   vertex(x, y);
  }
  endContour();
  
  // finish off the shape
  endShape(CLOSE);
}

void mousePressed()
{
  size+=5;
}
