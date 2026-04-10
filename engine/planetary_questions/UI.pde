class UI {
  PVector endTurnButton;
  float buttonRadius = 75;
  boolean insideButton;
  color c = color(0, 0, 0);
  int sw = 5;
  String turnTextStatus;
  //constructor
  UI(PVector pos)
  {
    endTurnButton = pos;
  }
  //runs all the methods inside for the UI
  void run() {
    display();
    collision();
  }

  void display() {

    stroke(c);
    strokeWeight(sw);
    
    //End Turn Button
    fill(200, 255, 200);
    ellipse(endTurnButton.x, endTurnButton.y, buttonRadius*2, buttonRadius*2);
    fill(0);
    textSize(25);
    
    strokeWeight(5);
    stroke(0);
    
    //once turn is ended the counter will go up by one
    text("End Turn", endTurnButton.x, endTurnButton.y);
    fill(200, 255, 200);
    text("Player HP:"+player.playerHP, width*.06, height*.7);
    text("Enemy HP:"+enemy.enemyHP, width*.06, height*.1);
    
    fill(0);

   
    //text(enemyCardValue+ts, width*.46,height*.225);
  }

  void collision() {
    if (dist(mouseX, mouseY, endTurnButton.x, endTurnButton.y) < buttonRadius) {
      insideButton = true;
    } else {
      insideButton = false;
      c = color(0, 0, 0);
      sw = 5;
    }
  }

  void mouseClicked() {
    //collision();
    //if (mouseClickedReleased == true){
    //  collision = false;
    //} else {
    //  mousClickedReleased = true;
    //}

    // for the end turn button
    if (insideButton == true 
    && defaultCard[0].inZone == true 
    && defaultCard[1].inZone == true 
    && defaultCard[2].inZone == true 
    && defaultCard[3].inZone == true 
    && defaultCard[4].inZone == true)
    {
      ts.endTurn();
      c = color(0, 0, 0);
      //println("bob");just a test to see if it will come out repeated or a single time
      sw = 5;
    }
  }

  void mousePressed()
  {
    if (insideButton == true 
    && defaultCard[0].inZone == true 
    && defaultCard[1].inZone == true 
    && defaultCard[2].inZone == true 
    && defaultCard[3].inZone == true 
    && defaultCard[4].inZone == true)
    {
      c = color(255, 0, 0);
      sw = 15;
    }
  }
}
