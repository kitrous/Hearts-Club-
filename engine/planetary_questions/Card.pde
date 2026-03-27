class Card {

  int cardValue = int(random(1, 10)); //random values
  Effect cardE;
  boolean isHovering;
  boolean isDraggingCard;
  boolean isDestroyed;
  boolean selectedCard;
  boolean isAttacking; //boolean to track whether a card is attacking
  boolean inZone; //boolean to track if a card is in a zone
  boolean canSelectTarget; //boolean to track if a card that "isAttacking" can select a card to attack
  Card opponentCard; /*A card object that would be the opponent card that this card is attacking.
  /* so we dont just have a bunch of random numbers and the card look stay's consistent
   edit these values to change how the card looks/position etc */
  int cardNumSize = 25;
  int dCWidth = 100;
  int dCHeight = 150;
  int xPos = 700;
  int yPos = 400;

  int startX, startY;
  int cardHealth; //int to track the card's health
  
  int tombstoneXPos = 25;
  int tombstoneYPos = height/2 - 150;

  int exPos = 700;
  int eyPos = 200;

  // constructor
  Card(int x, int y) {
    xPos = x;
    yPos = y;
    startX = x;
    startY = y;
  }

  void display() {
    if (this.isDraggingCard)
    {
      this.xPos = mouseX - dCWidth/2;
      this.yPos = mouseY - dCHeight/2;
    }
    else if (!inZone)
    {
      xPos = startX;
      yPos = startY;

      //selectedCard = this.;
    }
    //test card viewer
    stroke(0);
    fill(255, 255, 255);
    rect(xPos, yPos, dCWidth, dCHeight);
    fill(123, 200, 123);

    //text stuff for cards
    textSize(cardNumSize);
    text(cardValue, xPos+25, yPos+30);
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

    if (this.isHovering && !inZone) {
      this.isDraggingCard = true;
      println("anything");
    }
    
    if (this.isHovering && inZone && !isAttacking && !selectedCard) {
      println(this + " is Attacking");
      println(this + " is Selected");
      
      this.isAttacking = true;
      this.selectedCard = true;
    }
    
    if (isAttacking) {
      canSelectTarget = true;
    }
    //    if (isDraggingCard){
    //  mouseDragged();
    //}
  }
  

  void mouseReleased() {
    if (this.isDraggingCard) {
      this.isDraggingCard=false;
    }
    
    if (ts.playerTurn && isAttacking) {
    
    }
  }
}
