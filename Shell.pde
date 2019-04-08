class Shell{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
  private PVector pos;
  private PVector vel;
  private float blast = width/40;
  private float g;
  private float speed = 20; 
  private float wind;

/*************************************************************************************************************
  Constructor
  input: position, angle, speed, gravity
  return:
*************************************************************************************************************/
  public Shell(float x, float y, float arg, float gravity){
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    
    vel = new PVector();
    vel.x = cos(arg) * speed;
    vel.y = -sin(arg) * speed;
    
    g = gravity;
    
  }
  
/*************************************************************************************************************
  move
  input: 
  return:
*************************************************************************************************************/
  public void move(){
    vel.y += g;
    vel.x += wind;
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
    image(shell, pos.x, pos.y, gun_blue.width/2, gun_blue.height/2);
    
  }
   
/*************************************************************************************************************
  Getters and Setters
  input: 
  return:
*************************************************************************************************************/  
  public float getBlast(){
    return blast;
  }
  
  public float getSpeed(){
    return speed;
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
  
  public void setWind(float wind){
    this.wind = wind; 
  }
}
