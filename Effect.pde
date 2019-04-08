class Effect{
  PVector pos = new PVector();
  int timer = 30;
  int effect;
  float size;
  
  public Effect(float x, float y, int eff){
    pos.x = x;
    pos.y = y;
    effect = eff;
  }
  
  public void show(){
    switch(effect){
    case 0: 
 //   imageMode(CENTER);
      image(expl, pos.x-size, pos.y-size, 2*size, 2*size);
      timer--;
    }
  }
  
  int getTimer(){
    return timer;
  }
  
  public void setSize(float sz){
    size = sz;
  }

}
