class Pebble{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private PVector pos;
  private PVector vel;
  private float sX;
  private float sY;

/*************************************************************************************************************
  Constructor
  input: position
  return:
*************************************************************************************************************/
  public Pebble(float x, float y){
    pos = new PVector();
    vel = new PVector();
    pos.x = x;
    pos.y = y;
    vel.x = 0;
    vel.y = 0;
  }

/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  public void show(){
    fill(63, 33, 4);
    noStroke();
    rect(pos.x, pos.y, 1, sY-pos.y);
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
  
  public void setPx(float PX){
    pos.x = PX;
  }
  
  public void setPy(float PY){
    pos.y = PY;
  }
  
  public void setSX(float SX){
    sX = SX;
  }
  
  public void setSY(float SY){
    sY = SY;
  }
  
  
}
