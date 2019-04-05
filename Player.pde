class Player{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private PVector pos = new PVector();
  private PVector vel = new PVector();
  private float health = 100;
  private int playerNo;
  
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
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  public void show(){
    /* ROTATING correctly:
      a. push new transformation matrix
      b. translate the coordinate systems'origin to where you want the upper left corner to be
      c. rotate the grid (base transformation)
      d. draw object
      e. pop transformation matrix    
    */
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(-PI/8);
   image(tank_blue.get(0,0,tank_blue.width/2,tank_blue.height/2), -tank_blue.width/4, -tank_blue.height/2);
   popMatrix();
   
   fill(255,0,0);
   rect(pos.x, pos.y, 5, 5);
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
  
  public void setPx(float x){
    pos.x = x;
  }
  
  public void setPy(float y){
    pos.y = y;
  }
  
  
  

}
