class Gun{
  private PVector pos;
  private float ele;
  private float tankAngle;
  private float eleRate = 0.03;
  private PVector muzzle;
  
  public Gun(float x, float y){
    pos = new PVector();
    muzzle = new PVector();
    pos.x = x;
    pos.y = y;
  }
  
  public void show(){
      
    
  }
  
  public void align(float x, float y){
    pos.x = x;
    pos.y = y;
    muzzle.x = pos.x + 40*sin(tankAngle) + cos(ele)*gun_blue.width;
    muzzle.y = pos.y - 40*cos(tankAngle) + sin(ele)*gun_blue.width;
   
  }
  
  public float getMx(){
    return muzzle.x;
  }
  
  public float getMy(){
    return muzzle.y;
  }
  
  public float getPx(){
    return pos.x;
  }
  
  public float getPy(){
    return pos.y;
  }
  
  public float getEle(){
    return ele;
  }
  
  public void setPx(float x){
    pos.x = x;
  }
  
  public void setPy(float y){
    pos.y = y;
  }
  
  public void setEle(float ele){
    this.ele = ele;
  }
  
  public void setTankAngle(float angle){
    tankAngle = angle;
  }
  
  public void incEle(){
    ele += eleRate;
    ele %= 2*PI;
  }
  
  public void decEle(){
    ele -= eleRate;
    ele %= 2*PI;
  }
  



}
