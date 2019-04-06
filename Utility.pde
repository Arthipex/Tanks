    /* ROTATING correctly:
      a. push new transformation matrix
      b. translate the coordinate systems'origin to where you want the upper left corner to be
      c. rotate the grid (base transformation
      d. draw object
      e. pop transformation matrix    
    */
    
public void showRotPlayer(Player player, PImage pic, int dir){
   pushMatrix();
   translate(player.getPx(),player.getPy());
   rotate(0);
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
  translate(gun.getPx(), gun.getPy()-40);
  rotate(gun.getEle());
  image(pic, -5, -6);
  popMatrix();
}

public void showRotShell(Shell shell, PImage pic){
  pushMatrix();
  translate(shell.getPx()+pic.width/2, shell.getPy()+pic.height/2);
  rotate(PI);
  image(pic, 0, 0, gun_blue.width/2, gun_blue.height/2);
  popMatrix();
}
