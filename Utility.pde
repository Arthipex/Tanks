    /* ROTATING correctly:
      a. push new transformation matrix
      b. translate the coordinate systems'origin to where you want the upper left corner to be
      c. rotate the grid (base transformation
      d. draw object
      e. pop transformation matrix    
    */
    
public void rotImg(float px, float py, float arg, PImage img, int ix, int iy, int iStepSizex, int iStepSizey, float offsetX, float offsetY){
  pushMatrix();
  translate(px-offsetX,py-offsetY);  
  rotate(arg);
  float d = dist(offsetX/2, offsetY, 0 ,0);
  float beta = atan(offsetX/offsetY);
  image(img.get(ix, iy, iStepSizex, iStepSizey), -sin(arg-beta)*d, -cos(arg+beta)*d);
  fill(255,0,0);
  rect(0,0,5,5);
  popMatrix();
}
