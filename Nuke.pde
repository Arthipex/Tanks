class Nuke extends Shell{
 
  public Nuke(float x, float y, float arg, float gravity){
    
    super(x,y,arg,gravity);
    
    super.pos.x = x;
    super.pos.y = y;
    super.g = gravity;
    super.blast = width/5;
    super.speed = 20;
    
    super.vel = new PVector();
    super.vel.x = cos(arg) * super.speed;
    super.vel.y = -sin(arg) * super.speed;
    
    super.g = gravity;
    
  }
  

}
