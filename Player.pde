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
      pos.x = 10;
      break;
    case 1:
      pos.x = 1860;
    
    }
    this.playerNo = playerNo;
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  public void show(){
    switch(playerNo){
      case 0: 
        fill(0, 200, 0);
        rect(pos.x, pos.y-30, 30, 30);
        break;
      
      case 1:
        fill(200, 0, 0);
        rect(pos.x, pos.y-30, 30, 30);
        break;
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
  
  public void setPx(float x){
    pos.x = x;
  }
  
  public void setPy(float y){
    pos.y = y;
  }
  
  
  

}
