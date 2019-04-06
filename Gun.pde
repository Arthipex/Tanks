class Gun{
  private PVector pos;
  private float ele;
  private float eleRate = 0.01;
  
  public Gun(float x, float y){
    pos = new PVector();
    pos.x = x;
    pos.y = y;
  }
  
  public void show(){
      
    
  }
  
  public void align(float x, float y){
    pos.x = x;
    pos.y = y;
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
  
  public void incEle(){
    ele += eleRate;
    ele %= 2*PI;
  }
  
  public void decEle(){
    ele -= eleRate;
    ele %= 2*PI;
  }
  



}
