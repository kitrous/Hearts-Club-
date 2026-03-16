class Card {

  int cardValue = int(random(1, 10)); //random values
  boolean isHovering;
  boolean isDraggingCard;
  /* so we dont just have a bunch of random numbers and the card look stay's consistent
   edit these values to change how the card looks/position etc */
  int cardNumSize = 25;
  int dCWidth = 100;
  int dCHeight = 150;
  int xPos = 700;
  int yPos = 400;
  int zoneSpots = 5;
  int zoneX = 100;
  int zoneY = 400;
  
  // constructor
  Card(int x, int y) {
    xPos = x;
    yPos = y;
  }

  void battlefieldDisplay() {
    for (int i = 0; i < zoneSpots; i++) {
      rect(zoneX, zoneY, dCWidth, dCHeight);
    }
  }

  void display() {
    if (isDraggingCard)
    {
      xPos = mouseX;
      yPos = mouseY;
    }
    //test card viewer
    fill(255, 255, 255);
    rect(xPos, yPos, dCWidth, dCHeight);
    fill(123, 200, 123);

    //text stuff for cards
    textSize(cardNumSize);
    text(cardValue, xPos+25, yPos+30);
  }
  void Hovering() {

    if (mouseX > xPos && mouseX < xPos + dCWidth && mouseY > yPos && mouseY < yPos + dCHeight) {

      if (!isDraggingCard) {
        isHovering = true;
      }

      //println("hover");
    } else {
      isHovering = false;
    }

    //if (isDraggingCard){
    //  mouseDragged();
    //}
  }

  void mousePressed() {
    //println("hardy har har");

    if (isHovering) {
      isDraggingCard = true;
      println("anything");
    } else {
      //isDraggingCard = false;
      println("anythingelse");
    }

    //    if (isDraggingCard){
    //  mouseDragged();
    //}
  }

  void mouseReleased() {
    if (isDraggingCard) {
      isDraggingCard=false;
    }
  }

  //void mouseDragged(){

  //  //mousePressed();

  //  xPos = mouseX - dCWidth/2;
  //  yPos = mouseY - dCHeight/2;

  //}
}
