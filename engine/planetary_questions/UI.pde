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
    // for the end turn button
    if (insideButton == true)
    {
      ts.endTurn();
      c = color(0, 0, 0);
      sw = 5;
    }
  }

  void mousePressed()
  {
    if (insideButton == true)
    {
      c = color(255, 0, 0);
      sw = 15;
      ts.endTurn();
    }
  }
}
