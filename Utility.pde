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
