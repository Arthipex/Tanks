class Player{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private Gun gun;
  private PVector pos = new PVector();
  private PVector vel = new PVector();
  private float health = 100;
  private int playerNo;
  private float speed = 2;
  private int dir;  //  right = 1, left = 0
  private int animState;
  private float angle;
  private final int fuel = 200;
  private int mov = fuel;
  
//  private Hitbox hb;
  
/*************************************************************************************************************
  Constructor
  input: player number
  return:
*************************************************************************************************************/
  public Player(int playerNo){
    switch(playerNo){
    case 0: 
      pos.x = width/10*2;
      break;
    case 1:
      pos.x = width/10*8;
    
    }
    this.playerNo = playerNo;
    //hb = new Hitbox(tank_blue, pos);
    gun = new Gun(pos.x, pos.y);
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  public void show(ArrayList<Pebble> pebs){    
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
       if(this.health > 0){
         showRotGun(gun, gun_blue);
         showRotPlayer(this, pebs, tank_blue, this.dir);
       } 
       break;
     case 1:
       gun.align(pos.x, pos.y);
       if(this.health > 0){
         showRotGun(gun, gun_red);
         showRotPlayer(this, pebs, tank_red, this.dir);
       }
       break;
   }
  }
/*************************************************************************************************************
  move
  input: 
  return:
*************************************************************************************************************/
  public void move(){
    if(mov > 0){
      mov -= abs(vel.x);
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
      //hb.setP(pos);
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
  
  public void setAngle(float angle){
    this.angle = angle; 
    gun.setTankAngle(angle);
  }
  
  public float getAngle(){
    return angle;
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
  
  public void redHealth(float dmg){
    health -= dmg;
    if(health < 0){
      health = 0;
    }
  }
  
  public void refuel(){
    mov = fuel;
  }

}
