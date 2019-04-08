    /* ROTATING correctly:
      a. push new transformation matrix
      b. translate the coordinate systems'origin to where you want the upper left corner to be
      c. rotate the grid (base transformation
      d. draw object
      e. pop transformation matrix    
    */
    
public void showRotPlayer(Player player, ArrayList<Pebble> pebs, PImage pic, int dir){
   pushMatrix();
   translate(player.getPx(),player.getPy());
   player.setAngle(slopeAngle(player, pebs));
   rotate(slopeAngle(player, pebs));
   switch(dir){
      case 0:
        image(pic.get(player.getAnimState()*pic.width/2,0,pic.width/2, pic.height/2), -pic.width/4, -pic.height/2);   
        popMatrix();
        break;
      case 1:
        image(pic.get(player.getAnimState()*pic.width/2,pic.height/2,pic.width/2, pic.height/2), -pic.width/4, -pic.height/2);
        popMatrix();
        break;
   }
}   

public void showRotGun(Gun gun, PImage pic){
  pushMatrix();
  translate(gun.getPx()+40*sin(gun.tankAngle), gun.getPy()-40*cos(gun.tankAngle));
  rotate(gun.getEle());
  image(pic, -5, -6);
  popMatrix();
}

public void showRotShell(Shell shell, PImage pic){
  pushMatrix();
  translate(shell.getPx()+pic.width/2, shell.getPy()+pic.height/2);
  rotate(trajAngle(shell.vel));
  image(pic, 0, 0, gun_blue.width/2, gun_blue.height/2);
  popMatrix();
}

public float slopeAngle(Player player, ArrayList<Pebble> pebs){
  int x = int(player.getPx());
  float y1 = pebs.get(x).getPy();
  float y2 = pebs.get(x+1).getPy();
  
  return atan(y2-y1);
  
}
public float trajAngle(PVector vel){
  float angle = atan(vel.y/vel.x);
  if(vel.x > 0){
    angle += PI;
  }
  
  return angle;
  
}



boolean rectBall(float rx, float ry, float rw, float rh, float bx, float by, float d) {
  
  

  // first test the edges (this is necessary if the rectangle is larger
  // than the ball) - do this with the Pythagorean theorem

  // if ball entire width position is between rect L/R sides
  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  // if not, check if ball's entire height is between top/bottom of the rect
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // if that doesn't return a hit, find closest corner
  // this is really just a point, so we can test if we've hit it 
  // upper-left
  float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  // if this new distance is shorter...
    shortestDist = distanceUR;      // ... update
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  // test for collision
  if (shortestDist < d/2) {  // if less than radius
    return true;             // return true
  }
  else {                     // otherwise, return false
    return false;
  }
}

boolean pointRect(float px, float py, float  rx, float ry, float rw, float rh) {
  
  // test for collision
  if (px >= rx-rw/2 && px <= rx+rw/2 && py >= ry-rh/2 && py <= ry+rh/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}
