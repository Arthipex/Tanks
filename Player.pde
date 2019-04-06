class Player{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private Gun gun;
  private PVector pos = new PVector();
  private PVector vel = new PVector();
  private float health = 100;
  private int playerNo;
  private float speed = 5;
  private int dir;  //  right = 1, left = 0
  private int animState;
  
/*************************************************************************************************************
  Constructor
  input: player number
  return:
*************************************************************************************************************/
  public Player(int playerNo){
    switch(playerNo){
    case 0: 
      pos.x = 500;
      break;
    case 1:
      pos.x = 1849;
    
    }
    this.playerNo = playerNo;
    gun = new Gun(pos.x, pos.y);
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  public void show(){    
    if(vel.x != 0){
      animState++;
      animState %=2;
    }
    /* ROTATING correctly:
      a. push new transformation matrix
      b. translate the coordinate systems'origin to where you want the upper left corner to be
      c. rotate the grid (base transformation)
      d. draw object
      e. pop transformation matrix    
    */
   switch(playerNo){

     case 0:
       gun.align(pos.x, pos.y);
       showRotGun(gun, gun_blue);
       showRotPlayer(this, tank_blue, this.dir);
       
       break;
     case 1:
       gun.align(pos.x, pos.y);
       showRotGun(gun, gun_red);
       showRotPlayer(this, tank_red, this.dir);
       break;
   }
    
   //pushMatrix();
   //translate(pos.x,pos.y);
   //rotate(0);
   //image(tank_blue.get(0,0,tank_blue.width/2,tank_blue.height/2), -tank_blue.width/4, -tank_blue.height/2);
   //popMatrix();
  }
/*************************************************************************************************************
  move
  input: 
  return:
*************************************************************************************************************/
  public void move(){
    if(pos.x + vel.x - tank_blue.width/4 > 0 && pos.x + vel.x + tank_blue.width/4 < width){
        pos.x += vel.x;
    }

    if(vel.x > 0){
      dir = 1;
    } 
    else if(vel.x < 0){
      dir = 0;
    }
  }
  
/*************************************************************************************************************
  Getters and Setters
  input: 
  return:
*************************************************************************************************************/  
  public float getPx(){
    return pos.x;
  }
  
  public float getPy(){
    return pos.y;
  }
  
  public float getHealth(){
    return health;
  }
  
  public int getPlayerNo(){
    return playerNo;
  }
  
  public void setPx(float x){
    pos.x = x;
  }
  
  public void setPy(float y){
    pos.y = y;
  }
  
  public void setVx(float x){
    vel.x = x;
  } 
  
  public float getSpeed(){
    return speed;
  }
  
  public int getAnimState(){
    return animState;
  }

}
