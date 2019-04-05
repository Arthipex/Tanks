/*************************************************************************************************************
  Variables
*************************************************************************************************************/
private static int w = 1920;
private static int h = 1080;
private static int fps = 60;
private static float scale = 1;
private static Terrain hills;
private static PImage tank_blue;
private static PImage tank_red;

private static int timer;

/*************************************************************************************************************
  Setup
  input: 
  return:
*************************************************************************************************************/
void setup(){
  frameRate(fps);
//  fullScreen();
  size(1920, 1080);
  hills = new Terrain(w,h);
  tank_blue = loadImage("tank_blue.png");
  tank_red = loadImage("tank_red.png");
  
}

/*************************************************************************************************************
  shellSpam
  input: int, after how many frames a new shell is spawned
  return:
*************************************************************************************************************/
void shellSpam(int frame){
  timer++;
  if(timer%frame == 0){
      hills.spawnShell(10, 10, random(-1,1)*PI, random(10,20));
      timer%=frame;
  }
}

/*************************************************************************************************************
  draw
  input: 
  return:
*************************************************************************************************************/
void draw(){
//  shellSpam(10);
  background(30,109,237);
  hills.update();
  
  
}

void keyPressed(){

}
