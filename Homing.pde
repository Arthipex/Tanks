class Homing extends Shell{
  
  boolean attack = false;  
  float speed = 10;
  
  
  int ceiling = height/20;
      
  public Homing(float x, float y, float arg, float gravity){
    super(x,y,arg,gravity);
    super.blast = width / 20;
    

    
    super.pos.x = x;
    super.pos.y = y;
    super.vel.x = cos(arg) * speed;
    super.vel.y = -sin(arg) * speed;
    
    
    
    
  }
  
  public void move(){
    for(int i = 0; i < super.players.size(); i++){
      if(abs(super.pos.x - super.players.get(i).getPx()) < 20 && super.pos.x - abs(super.players.get(super.owner).getPx()) > 20){
        super.vel.x = 0;
        super.vel.y = speed;
        super.pos.x += super.vel.x;
        super.pos.y += super.vel.y;
        attack = true;
      }
      
         
      else if(super.pos.y > ceiling && !attack){
        super.pos.x += super.vel.x;
        super.pos.y += super.vel.y;
      } 
      else if(super.pos.y <= ceiling && !attack){
        super.vel.x = super.vel.x/abs(super.vel.x) *speed/2;
        super.pos.x += super.vel.x;
        super.vel.y = 0;
     }
}
    }
    

     
  
  
  
  public void setOwner(int owner){
    super.owner = owner;
  }
    
 


}
