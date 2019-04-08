class Terrain{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
   private float[] topRow;
   private float mid;
   private float g = 0.2;
   
   private ArrayList<Pebble> pebs = new ArrayList<Pebble>();
   private ArrayList<Shell> shells = new ArrayList<Shell>();
   private ArrayList<Player> players = new ArrayList<Player>();
   private ArrayList<Effect> effects = new ArrayList<Effect>();
   private GUI gui;
   
   private float sin1;
   private float sin2;
   private float sin3;
   private float sinScl = 80;
   
/*************************************************************************************************************
  Constructor
  input: width and height
  return:
*************************************************************************************************************/
  public Terrain(){
    sin1 = random(0.2,0.8);
    sin2 = random(0.2,2);
    sin3 = random(0.1,3);
       

    mid = height/2;
    topRow = new float[width];
    
    for(int i = 0; i < width; i++){
      topRow[i] = 120*sin(sin1*i/sinScl) + 20*sin(sin2*i/sinScl) + 10*sin(sin3*i/sinScl) + mid;
      
      // topRow[i] = map(noise(i), 0, 1, 0, 20) + mid;  
      pebs.add(new Pebble(i, topRow[i]));   
    }
    
    for(int i = 0; i < 2; i++){
      players.add(new Player(i));
    }
    
    gui = new GUI();
  }
  
/*************************************************************************************************************
  update
  input: 
  return:
*************************************************************************************************************/
  void update(){

    colDet();
    move();
    show();
    
  }
  
/*************************************************************************************************************
  move
  input: 
  return:
*************************************************************************************************************/
  void move(){  
     //shells
    for(int i = 0; i < shells.size(); i++){
      shells.get(i).move();
    }
    
    //players
    for(int i = 0; i < players.size(); i++){
      players.get(i).move();
    }
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  void show(){
    //players

    
    //shells
    for(int i = 0; i < shells.size(); i++){
      showRotShell(shells.get(i), shell);
    }
    
    //soil
    for(int i = 0; i < width; i++){
      pebs.get(i).show();
    }
    
    // draw bedrock
    fill(84,84,84);
    rect(0,height-10,width,10);
    
    
    for(int i = 0; i < players.size(); i++){
    players.get(i).show(pebs);
    }
    
    // GUI
    for(int i = 0; i < players.size(); i++){
      gui.drawGui(players.get(i));    
    }
    
    // effecs
    for(int i = 0; i < effects.size(); i++){
      effects.get(i).show();
      if(effects.get(i).getTimer() == 0){
        effects.remove(i);
      }
    }
    
    
  }


 
/*************************************************************************************************************
  spawnShell
  input: coordinates, argument, speed
  return:
*************************************************************************************************************/
  void spawnShell(float x, float y, float arg){
    shells.add(new Shell(x, y, arg, g));
    //shells.add(new Nuke(x,y,arg,g));
  }
  
/*************************************************************************************************************
  detShell
  input: shell
  return:
*************************************************************************************************************/
  void detShell(Shell shell){
    float blast = shell.getBlast();
    float px = 0;
    float py = 0;
    float sx = shell.getPx();
    float sy = shell.getPy();
     
      
      for(int i = int(sx - blast); i < sx + blast; i++){
        if(i >= 0 && i < width){
          px = pebs.get(i).getPx();
          py = pebs.get(i).getPy();                
          
            if((blast)*(blast) - (px - sx)*(px - sx) < 0){
            } else {
            pebs.get(i).setPy(py + /*2 **/ sqrt((1+blast)*(blast) - (px - sx)*(px - sx)));
            }
            // bedrock, can't be destroyed
            if(pebs.get(i).getPy() > height - 10){
              pebs.get(i).setPy(height - 10);
            } 
          }
        }
        
        // check if players are within blast radius
        for(int i = 0; i < players.size(); i++){
//          if(rectBall(players.get(i).getPx()-tank_blue.width/4, players.get(i).getPy()-tank_blue.height/2, tank_blue.width/2, tank_blue.height/2, sx, sy, shell.getBlast()*2)){
          if(dist(players.get(i).getPx(), players.get(i).getPy(),sx, sy) < blast + tank_blue.width/2){
             float dist =  dist(players.get(i).getPx(), players.get(i).getPy(),sx, sy);
             players.get(i).redHealth(abs(blast - dist));
           }
        }
        
        
        effects.add(new Effect(sx, sy, 0));
        effects.get(effects.size()-1).setSize(blast);
          
  }
  
/*************************************************************************************************************
  colDet
  input: 
  return:
*************************************************************************************************************/
  void colDet(){
    //players
    for(int i = 0; i < players.size(); i++){
      int pebx = int(players.get(i).getPx());
      float peby = pebs.get(pebx).getPy(); 
      players.get(i).setPy(peby+2);   
    }
    
    //shells
    //step 1: remove off-range shells
    //step 2: check for collision and detonate if so
    for(int i = 0; i < shells.size(); i++){
      float pred = shells.get(i).getPx() + shells.get(i).getVx();
      if(pred > width || pred < 0){
        shells.remove(i);
      }
      
      if(shells.size() > 0){
        float sx = shells.get(i).getPx();
        float sy = shells.get(i).getPy();
        
        if(shells.get(i).getPy() + shells.get(i).getSpeed() > pebs.get(int(sx)).getPy()){
        
        }
        
        if(sy > pebs.get(int(sx)).getPy()){
            detShell(shells.get(i));
            shells.remove(i);
        }
      } 
      
      if(shells.size() > 0){
        float sx = shells.get(i).getPx();
        float sy = shells.get(i).getPy();
        for(int k = 0; k < players.size(); k++){
            if(pointRect(sx, sy, players.get(k).getPx()-tank_blue.width/4, players.get(k).getPy()-tank_blue.height/2, tank_blue.width/2, tank_blue.height/2)){
            detShell(shells.get(i));
            shells.remove(i);
          }
        }
      }
      
    }
  }
}
