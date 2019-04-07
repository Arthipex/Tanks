class Effect{
  PVector pos = new PVector();
  int timer = 30;
  int effect;
  float scale;
  
  public Effect(float x, float y, int eff){
    pos.x = x;
    pos.y = y;
    effect = eff;
  }
  
  public void show(){
    switch(effect){
    case 0: 
 //   imageMode(CENTER);
      image(expl, pos.x-scale/2, pos.y-scale/2, 2*scale, 2*scale);
      timer--;
    }
  }
  
  int getTimer(){
    return timer;
  }
  
  public void setScale(float scl){
    scale = scl;
  }

}
