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
  //variables for the zones
  //player
  int playerZoneX = 250;
  int playerZoneY = 400;
  //enemy
  int enemyZoneX = 250;
  int enemyZoneY = 150;
  int zoneSpacing = 100;
  int zoneSpots = 5;

  // constructor
  Card(int x, int y) {
    xPos = x;
    yPos = y;
  }
//attempted to make a constructor for the zone as well but i dont think its possible to add two constructors, might need to make a different class for the zones or do this in the main file
  /*Zone(int x, int y) {
    playerZoneX = x;
    playerZoneY = y;
  }*/
  // here are the zones for the player
  void BattlefieldDisplay() {
    //player zone
    for (int i = 0; i < zoneSpots; i++) {
      rect(playerZoneX + i * (dCWidth + zoneSpacing), playerZoneY, dCWidth, dCHeight);
    }
    //enemy zone
    for (int i = 0; i < zoneSpots; i++) {
      rect(enemyZoneX + i * (dCWidth + zoneSpacing), enemyZoneY, dCWidth, dCHeight);
    }
  }



  void display() {
    if (isDraggingCard)
    {
      xPos = mouseX;
      yPos = mouseY;
      selectedCard = dcard;
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
      //println("anything");
    } else {
      //isDraggingCard = false;
      //println("anythingelse");
    }

    //    if (isDraggingCard){
    //  mouseDragged();
    //}
  }

  void mouseReleased() {
    if (isDraggingCard) {
      // if selected card is detecting zoneX, zoneY, zoneWidth, zoneHeight, make the selected card's x and y to the zone

      for (int i = 0; i > defaultCard.length; i++) {
        if (abs(playerZoneX - defaultCard[i].xPos) < dCWidth && abs(playerZoneY - defaultCard[i].yPos) < dCHeight) {
          defaultCard[i].xPos = playerZoneX;
          defaultCard[i].yPos = playerZoneY;
          println("detected");
        }
      }


      isDraggingCard = false;
    }
  }

  //void mouseDragged(){

  //  //mousePressed();

  //  xPos = mouseX - dCWidth/2;
  //  yPos = mouseY - dCHeight/2;

  //}
}
