class UI {
  PVector endTurnButton;
  boolean mouseClickedReleased = true;
  float buttonRadius = 125;
  boolean insideButton;
  color c = color(0, 0, 0);

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
    strokeWeight(5);
    fill(200, 255, 200);
    ellipse(endTurnButton.x, endTurnButton.y, buttonRadius*2, buttonRadius*2);
  }

  void collision() {
    if (dist(mouseX, mouseY, endTurnButton.x, endTurnButton.y) < buttonRadius) {
      insideButton = true;
    } else {
      insideButton = false;
      c = color(0, 0, 0);
    }
  }

  void mouseClicked() {
    //collision();
    //if (mouseClickedReleased == true){
    //  collision = false;
    //} else {
    //  mousClickedReleased = true;
    //}
    if(insideButton == true)
    {
      ts.endTurn();
      c = color(0, 0, 0);
      println("bob");
      strokeWeight(10);
    }
  }
  
  void mousePressed()
  {
    if(insideButton == true)
    {
      c = color(255, 0, 0);
    }
  }
}
