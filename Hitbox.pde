class Hitbox{
  private float sx;
  private float sy;
  private float angle;
  private PVector pos;
  
  public Hitbox(PImage pic, PVector pos){
    sx = pic.width/2;
    sy = pic.height/2;
    this.pos.x = pos.x;
    this.pos.y = pos.y;  
  }
  
  public void show(){
    
  }
  
  
  public float getSx(){
    return sx;
  }
  
  public float getSy(){
    return sy;
  }
  
  public float getPx(){
    return pos.x;
  }
  
  public float getPy(){
    return pos.y;
  }
  
  public void setP(PVector pos){
    this.pos = pos;
  }
  
  public void setAngle(float angle){
    this.angle = angle;
  }


}
