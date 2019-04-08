class GUI{
  float lineThic = 1;
  float px = width/200;
  float py = width/200;
  float sx = width/5;
  float sy = height/100;
  public GUI(){
    
  }
  
  public void drawGui(Player player){
    // healthbars
    drawHb(player);
    
    // sidepanel
    drawPanel(player);
    
  }
  
 public void drawWindsock(float wind){
    if(wind > 0){
      image(windsock, width/2, height/10); 
    }
 }
  
 public void drawHb(Player player){
   switch(player.getPlayerNo()){
     case 0:
       fill(200,0,0);
       noStroke();
       rect(px, py, map(player.getHealth(), 0, 100, 0, sx), sy);
       noFill();
       stroke(0);
       strokeWeight(lineThic);
       rect(px, py, sx, sy);
       break;
     case 1:
       fill(200,0,0);
       noStroke();
       rect(width-px, py, -map(player.getHealth(), 0, 100, 0, sx), sy);
       noFill();
       stroke(0);
       strokeWeight(lineThic);
       rect(width-px, py, -sx, sy);
       break;
   }
  } 
  
  public void drawArg(Player player){
    
  }
  
  
  public void drawPanel(Player player){
    fill(150, 150, 150);
    stroke(0);
    strokeWeight(1);
    float angle = abs(degrees(player.gun.getEle())%180);
    String text = str(floor(angle));
    text += "°";
    
    switch(player.getPlayerNo()){
      case 0:
        // draw rect
        rect(0, height/5, width/30, height/30);
        
        //draw text
        fill(0,0,0);
        textSize(width/75);
        textAlign(CENTER, CENTER);
        text(text, 0, height/5, width/30, width/50);
        break;
      case 1:
        // draw rect
        rect(width-width/30-1, height/5, width/30, height/30);
        
        // draw text
        fill(0,0,0);
        textSize(width/75);
        textAlign(CENTER, CENTER);
        text(text, width-width/30-1, height/5, width/30, height/30);
        break;
    }   
  }
  
  
}
