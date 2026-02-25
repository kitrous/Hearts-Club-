class UI {
  PVector endTurnButton;
  float buttonRadius = 125;

  //constructor
  UI(PVector pos)
  {
    endTurnButton = pos;
  }

  void run() {
    display();
  }

  void display() {
    fill(200, 255, 200);
    ellipse(endTurnButton.x, endTurnButton.y, buttonRadius*2, buttonRadius*2);
  }

  void collision() {
    if (dist(mouseX, mouseY, endTurnButton.x, endTurnButton.y) < buttonRadius) {
      ts.endTurn();

    }
  }

  void mouseClicked() {
    collision();
  }
}
