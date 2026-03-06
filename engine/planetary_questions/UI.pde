class UI {
  PVector endTurnButton;
  float buttonRadius = (width+height)*.03;
  boolean insideButton;
  color c = color(0, 0, 0);
  int sw = 5;
  //constructor
  UI(PVector pos)
  {
    endTurnButton = pos;
  }

  void run() {
    display();
    collision();
  }

  void display() {

    stroke(c);
    strokeWeight(sw);
    
    fill(200, 255, 200);
    ellipse(endTurnButton.x*1.2, endTurnButton.y*1.2, buttonRadius*2, buttonRadius*2);
    fill(0);
    textSize(25);
    
    strokeWeight(5);
    stroke(0);
    //once turn is ended the counter will go up by one
    text("End Turn: ", endTurnButton.x-50, endTurnButton.y);
    fill(200, 255, 200);
    text("Player HP:"+player.playerHP, width*.1, height*.9);
    text("Enemy HP:"+enemy.enemyHP, width*.10, height*.1);
    // Enemy Card Display
    fill(255);
    rect(width*.45, height*.2, 150, 250);
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
    if (insideButton == true)
    {
      ts.endTurn();
      c = color(0, 0, 0);
      //println("bob");just a test to see if it will come out repeated or a single time
      sw = 5;
    }
  }

  void mousePressed()
  {
    if (insideButton == true)
    {
      c = color(255, 0, 0);
      sw = 15;
    }
  }
}
