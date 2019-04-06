import java.io.File;
/*************************************************************************************************************
  Variables
*************************************************************************************************************/
private static int fps = 60;
private static float scale = 1;
private static Terrain hills;
private static PImage tank_blue;
private static PImage tank_red;
private static PImage gun_blue;
private static PImage gun_red;
private static PImage shell;

private static int timer;
private static int turn = 0;

/*************************************************************************************************************
  Setup
  input: 
  return:
*************************************************************************************************************/
void setup(){
  frameRate(fps);
//  fullScreen();
  size(1920, 1080);
  hills = new Terrain();
  tank_blue = loadImage("tank_blue.png");
  tank_red = loadImage("tank_red.png");
  gun_blue = loadImage("gun_blue.png");
  gun_red = loadImage("gun_red.png");
  shell = loadImage("shell.png");
  
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
    switch(key){
      case ' ':
        hills.spawnShell(hills.players.get(turn).gun.getPx(), hills.players.get(turn).gun.getPy()-40, hills.players.get(turn).gun.getEle()*-1);
        break;
      case 'd': 
        hills.players.get(turn).setVx(hills.players.get(turn).getSpeed());
        break;
      case 'a':
        hills.players.get(turn).setVx(-1*hills.players.get(turn).getSpeed());
        break;
      case 'w':
        hills.players.get(turn).gun.incEle();
        break;
      case 's': 
        hills.players.get(turn).gun.decEle();
      default:
        hills.players.get(turn).setVx(0);
    }
}

void keyReleased(){
  switch(key){
    default: 
      hills.players.get(turn).setVx(0);
  }
}
