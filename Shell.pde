class Shell{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private PVector pos;
  private PVector vel;
  private float blast = 40;
  private float g;

/*************************************************************************************************************
  Constructor
  input: position, angle, speed, gravity
  return:
*************************************************************************************************************/
  public Shell(float x, float y, float arg, float abs, float gravity){
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    
    vel = new PVector();
    vel.x = cos(arg) * abs;
    vel.y = -sin(arg) * abs;
    
    g = gravity;
    
  }
  
/*************************************************************************************************************
  move
  input: 
  return:
*************************************************************************************************************/
  public void move(){
    vel.y += g;
    pos.x += vel.x;
    pos.y += vel.y;
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/  
  public void show(){
    fill(255,0,0);
    ellipse(pos.x, pos.y, 10, 10);
    
  }
   
/*************************************************************************************************************
  Getters and Setters
  input: 
  return:
*************************************************************************************************************/  
  public float getBlast(){
    return blast;
  }
  
  public float getPx(){
    return pos.x;
  }
  
  public float getPy(){
    return pos.y;
  }
  
  public float getVx(){
    return vel.x;
  }
  
  public float getVy(){
    return vel.y;
  }
  
  public void setPx(float px){
    pos.x = px;
  }
  
  public void setPy(float py){
    pos.y = py;
  }
}
