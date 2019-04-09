class GUI{
  float lineThic = 1;
  float px = width/200;
  float py = width/200;
  float sx = width/5;
  float sy = height/100;
  public GUI(){
    
  }
  
  public void drawGui(Player player, float wind){
    // healthbars
    drawHb(player);
    
    // sidepanel
    drawPanel(player);
    
    // windsock
    drawWindsock(wind);
    
  }
  
 public void drawWindsock(float wind){
    if(wind > 0){
      image(windsock_right, width/2 - windsock_right.width/6, height/20, windsock_right.width/3, windsock_right.height/3); 
    } else if(wind < 0){
      image(windsock_left, width/2 - windsock_left.width/6, height/20, windsock_left.width/3, windsock_left.height/3); 
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
  
  public void drawFb(Player player){
    // switch-case struktur verwenden (analog zu drawHb). Bedingung des Switch-Statement sind eine Art "else if", und die Bedingung ist die PlayerNo (ist entweder 0 oder 1). Case 0/1 reagieren entsprechend darauf.
    
    //1. mit fill() Farbe auswählen. noStroke() sorgt dafür, dass kein Rahmen gezeichnet wird.
    
    //2. die Fuelbar mit rect(x,y,rx,ry) zeichnen. x,y sind Koordinaten, rx,ry die Grösse des Rechtecks. für die Grösse in x-Richtung map() verwenden. map() nimmt fünf Werte auf: Der Wert welcher skaliert werden soll, Unter- und Obergrenze der Skala, aus welcher er entstammt, sowie Unter- und Obergrenze der Skala, welche neu verwendet werden soll.
    
    //3. den Rahmen zeichnen. noFill() führt dazu, dass keine Farbe verwendet wird, das Rechteck wird transparent. stroke(0) setzt die Rahmenfarbe auf schwarz, strokeWeight() setzt die Rahmendicke.
    //   der Rahmen ist ebenfalls ein Rechteck. 
    
    
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
