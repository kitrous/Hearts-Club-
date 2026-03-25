class Card {

  int cardValue = int(random(1, 10)); //random values
  Effect cardE;
  boolean isHovering;
  boolean isDraggingCard;
  boolean isDestroyed;
  boolean selectedCard;
  /* so we dont just have a bunch of random numbers and the card look stay's consistent
   edit these values to change how the card looks/position etc */
  int cardNumSize = 25;
  int dCWidth = 100;
  int dCHeight = 150;
  int xPos = 700;
  int yPos = 400;
  int startX, startY;
  
  int tombstoneXPos = 25;
  int tombstoneYPos = height/2 - 150;

  //variables for the zones
  //player
  int playerZoneX = 250;
  int playerZoneY = 400;
  //enemy
  int enemyZoneX = 250;
  int enemyZoneY = 150;
  int zoneSpacing = 100;
  int zoneSpots = 5;
  int exPos = 700;
  int eyPos = 200;

  // constructor
  Card(int x, int y) {
    xPos = x;
    yPos = y;
    startX = x;
    startY = y;
  }
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
    if (this.isDraggingCard)
    {
      this.xPos = mouseX;
      this.yPos = mouseY;
    }
    else
    {
      xPos = startX;
      yPos = startY;
    }
    //test card viewer
    stroke(0);
    fill(255, 255, 255);
    rect(xPos, yPos, dCWidth, dCHeight);
    fill(123, 200, 123);

    //text stuff for cards
    textSize(cardNumSize);
    text(cardValue, xPos+25, yPos+30);
    
    //Enemy Card
     fill(155,55,55);
     stroke(100,0,0);
    rect(exPos, eyPos, 100, 150);
    fill(0);
    stroke(0);
  }
  void Hovering() {

    if (mouseX > this.xPos && mouseX < this.xPos + dCWidth && mouseY > this.yPos && mouseY < this.yPos + dCHeight) {

      if (!this.isDraggingCard && !this.isDestroyed) {
        this.isHovering = true;
      }

      //println("hover");
    } else {
      this.isHovering = false;
    }

    //if (isDraggingCard){
    //  mouseDragged();
    //}
  }
  
  void GoToTombstone() {
    if (this.isDestroyed) {
      this.xPos = tombstoneXPos;
      this.yPos = tombstoneYPos;
    }
  }
  
  void keyPressed(){
    this.isDestroyed = true;
    
    GoToTombstone();
  }
  
  void mousePressed() {
    //println("hardy har har");

    if (this.isHovering) {
      this.isDraggingCard = true;
      println("anything");
    } else {
      //isDraggingCard = false;
      //println("anythingelse");
    }

    //    if (isDraggingCard){
    //  mouseDragged();
    //}
  }

  void mouseReleased() {
    if (this.isDraggingCard) {
      this.isDraggingCard=false;
    }
  }

  //void mouseDragged(){

  //  //mousePressed();

  //  xPos = mouseX - dCWidth/2;
  //  yPos = mouseY - dCHeight/2;

  //}
}
