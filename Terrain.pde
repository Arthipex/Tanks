class Terrain{
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
   private int sX;
   private int sY;
   private float[] topRow;
   private float mid;
   private float g = 0.2;
   
   private ArrayList<Pebble> pebs = new ArrayList<Pebble>();
   private ArrayList<Shell> shells = new ArrayList<Shell>();
   private ArrayList<Player> players = new ArrayList<Player>();
   
   private float sin1;
   private float sin2;
   private float sin3;
   private float sinScl = 80;
   
/*************************************************************************************************************
  Constructor
  input: width and height
  return:
*************************************************************************************************************/
  public Terrain(int w, int h){
    sin1 = random(0.2,0.8);
    sin2 = random(0.2,2);
    sin3 = random(0.1,3);
       
    sX = w;
    sY = h;
    mid = sY/2;
    topRow = new float[sX];
    
    for(int i = 0; i < sX; i++){
      topRow[i] = 120*sin(sin1*i/sinScl) + 20*sin(sin2*i/sinScl) + 10*sin(sin3*i/sinScl) + mid;
      
      // topRow[i] = map(noise(i), 0, 1, 0, 20) + mid;  
      pebs.add(new Pebble(i, topRow[i]));
      pebs.get(i).setSX(sX);
      pebs.get(i).setSY(sY);    
    }
    
    for(int i = 0; i < 2; i++){
      players.add(new Player(i));
    }
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
  }
  
/*************************************************************************************************************
  show
  input: 
  return:
*************************************************************************************************************/
  void show(){
    //players
    for(int i = 0; i < players.size(); i++){
      players.get(i).show();
    }
    
    //shells
    for(int i = 0; i < shells.size(); i++){
      shells.get(i).show();
    }
    
    
    for(int i = 0; i < sX; i++){
      pebs.get(i).show();
    }
    
    // draw bedrock
    fill(84,84,84);
    rect(0,sY-10,sX,10);
  }
  
 
/*************************************************************************************************************
  spawnShell
  input: coordinates, argument, speed
  return:
*************************************************************************************************************/
  void spawnShell(float x, float y, float arg, float abs){
    shells.add(new Shell(x, y, arg, abs, g));
  }
  
/*************************************************************************************************************
  detShell
  input: shell
  return:
*************************************************************************************************************/
  void detShell(Shell shell){
    float blast = shell.getBlast();
    float px;
    float py;
    float sx = shell.getPx();
     
      
      for(int i = int(sx - blast); i < sx + blast; i++){
        if(i >= 0 && i < sX){
          px = pebs.get(i).getPx();
          py = pebs.get(i).getPy();                
          
            if((blast)*(blast) - (px - sx)*(px - sx) < 0){
            } else {
            pebs.get(i).setPy(py + /*2 **/ sqrt((1+blast)*(blast) - (px - sx)*(px - sx)));
            }
            // bedrock, can't be destroyed
            if(pebs.get(i).getPy() > sY - 10){
              pebs.get(i).setPy(sY - 10);
            }
          }
        }
    
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
      players.get(i).setPy(peby-1);   
    }
    
    //shells
    for(int i = 0; i < shells.size(); i++){
      float ms = shells.get(i).getVy()/shells.get(i).getVx();
      float bs = shells.get(i).getPy() - ms*shells.get(i).getPx();
      float cx = 0;
      float cy = 0;
      for(int k = 0; k < pebs.size()-1; k++){
        if(shells.get(i).getVy()+shells.get(i).getPy() > pebs.get(k+1).getPy()){
          float mp = (pebs.get(k+1).getPy()-pebs.get(k).getPy()) / (pebs.get(k+1).getPx() - pebs.get(k).getPx());
          float bp = pebs.get(k).getPy() - mp*pebs.get(k).getPx();
          cx = (bp - bs)/(ms - mp);
          
          if(cx <= pebs.get(k+1).getPx() && cx >= pebs.get(k).getPx()){
            cy = cx * ms + bs;
            shells.get(i).setPx(cx);
            shells.get(i).setPy(cy);
            detShell(shells.get(i));
            shells.remove(i);
            return;
          }
        }       
      }
    }
    // old style, less accurate
    /*for(int i = 0; i < shells.size(); i++){
      int impx = int(shells.get(i).getPx() + shells.get(i).getVx());
      float impy = shells.get(i).getPy() + shells.get(i).getVy();
      
      
      if(impx > 0 && impx < sX && impy > pebs.get(impx).getPy()){
        detShell(shells.get(i));
        shells.remove(i);
      }
    }*/
  }

}
