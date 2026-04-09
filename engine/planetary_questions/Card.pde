class Card {
  //variables for our cards
  int cardValue = int(random(1, 10)); //random values
  Effect cardE;
  boolean isHovering;
  boolean isDraggingCard;
  boolean isDestroyed;
  boolean selectedCard;
  boolean isAttacking; //boolean to track whether a card is attacking
  boolean inZone; //boolean to track if a card is in a zone
  boolean canSelectTarget; //boolean to track if a card that "isAttacking" can select a card to attack
  Card opponentCard; //A card object that would be the opponent card that this card is attacking.
  boolean isEnemy;
  boolean isPlayer;
  /* so we dont just have a bunch of random numbers and the card look stay's consistent
   edit these values to change how the card looks/position etc */
  int cardNumSize = 25;
  float cardWidth, cardHeight;
  float xPos, yPos;

  float startX, startY;
  int cardHealth; //int to track the card's health
  
  int tombstoneXPos = 25;
  int tombstoneYPos = height/2 - 150;

  int exPos = 700;
  int eyPos = 200;
  
  color cardColor;
  color cardStroke = color (0, 0, 0);
  Effect cardEffect;

  // constructor
  Card(float _xPos, float _yPos, float _cardWidth, float _cardHeight, color _cardColor, int _cardHealth, Effect _cardEffect) {
    xPos = _xPos;
    yPos = _yPos;
    
    startX = _xPos;
    startY = _yPos;
    
    cardWidth = _cardWidth;
    cardHeight = _cardHeight;
    cardColor = _cardColor;
    cardHealth = _cardHealth;
    cardEffect = _cardEffect;
  }
  // when dragging the card you selected it will use your mousex and mousey to update to that location
  void display() {
    if (this.isDraggingCard)
    {
      this.xPos = mouseX - cardWidth/2;
      this.yPos = mouseY - cardHeight/2;
    }
    else if (!inZone)
    {
      xPos = startX;
      yPos = startY;

      //selectedCard = this.;
    }
    //test card viewer
    stroke(cardStroke);
    fill(255, 255, 255);
    rect(xPos, yPos, cardWidth, cardHeight, 15);
    fill(123, 200, 123);
    
    //text stuff for cards
    textSize(cardNumSize);
    text(cardValue, xPos+25, yPos+30);
    textSize(15);
    text(cardEffect.effectName, xPos + cardWidth/2, yPos + cardHeight/2);
    
    
    //fill(cardColor);
    //rect(xPos, yPos, cardWidth, cardHeight, 15);
    
    //fill(255);
    //textSize(cardNumSize);
    //strokeWeight(5);
    //stroke(cardStroke);
    //text(cardEffect.effectName, xPos + cardWidth/2, yPos + cardHeight/2);
  }
  
  void Hovering() {
    //confirms if the mouse is hovering over card
    if (mouseX > this.xPos && mouseX < this.xPos + cardWidth && mouseY > this.yPos && mouseY < this.yPos + cardHeight) {

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
  //sends the card to the tombstone and if the card is not a player card and not destroyed
  void GoToTombstone() {
    if (cardValue <= 0 && !isEnemy && !this.isDestroyed) {
      player.playerHP -= 5;
      this.isDestroyed = true;
    }
    else if (cardValue <= 0 && isEnemy && !this.isDestroyed) {
      enemy.enemyHP -= 5;
      this.isDestroyed = true;
    }
    
    if (this.isDestroyed) {
      this.xPos = tombstoneXPos;
      this.yPos = tombstoneYPos;
    }
  }
  
  //void keyPressed(){
  //  this.isDestroyed = true;
    
  //  GoToTombstone();
  //}
  
  void mousePressed() {
    //println("hardy har har");
    //checks if the card is hovering and if its in not in a zone already then it starts dragging
    if (this.isHovering && !inZone) {
      this.isDraggingCard = true;
      println("anything");
    }
    
    //Select a card for attacking
    if (this.isHovering && inZone && !isAttacking && !this.selectedCard && !ts.playerIsAttacking && !isEnemy) {
      println("Card " + this.cardValue + " is Attacking");
      println("Card " + this.cardValue + " is Selected");
      
      cardStroke = color (255, 0, 0);
      
      this.isAttacking = true;
      this.selectedCard = true;
      ts.playerIsAttacking = true;
      player.currentCardValue = this.cardValue;
      this.cardValue = player.currentCardValue;
    }
    //Deselect a card to stop attacking
    else if (this.isHovering && inZone && isAttacking && this.selectedCard && ts.playerIsAttacking && !this.isEnemy) {
      println("Card " + this.cardValue + " is not Attacking");
      println("Card " + this.cardValue + " is Deselected");
      
      cardStroke = color (0, 0, 0);
      
      this.isAttacking = false;
      this.selectedCard = false;
      ts.playerIsAttacking = false;
      player.currentCardValue = 0;
    }
    //Attacks the player card
    if (this.isHovering && this.inZone && ts.playerIsAttacking && this.isEnemy) {
      println("Attack");
      
      println("Enemy " + this.cardValue);
       
      this.cardValue -= player.currentCardValue;
      player.currentCardValue -= this.cardValue;
       
      //for (int i = 0; i < enemyCard.length; i++) {
      //  enemyCard[i].cardValue -= player.currentCardValue;
      //}
      
      for (int i = 0; i < defaultCard.length; i++) {
        defaultCard[i].cardValue -= enemy.currentCardValue;
      }
      enemy.currentCardValue = this.cardValue;
      ts.calcWinner();
    }
    //Attacks enemy card
    if (ts.playerIsAttacking && this.isPlayer) {
      println("Player Attack");
      
      println("Player " + this.cardValue);
       
      this.cardValue -= enemy.currentCardValue;
       
      //for (int i = 0; i < enemyCard.length; i++) {
      //  enemyCard[i].cardValue -= player.currentCardValue;
      //}
      
      for (int i = 0; i < defaultCard.length; i++) {
        defaultCard[i].cardValue -= enemy.currentCardValue;
      }
      enemy.currentCardValue = this.cardValue;
      ts.calcWinner();
    }
    
    
    //if its in attacking mode, it can select a card to target and attack
    if (isAttacking) {
      canSelectTarget = true;
    }
    //    if (isDraggingCard){
    //  mouseDragged();
    //}
  }
  
  //releases the card by making isdraggingcard false
  void mouseReleased() {
    if (this.isDraggingCard) {
      this.isDraggingCard = false;
    }
    
    if (ts.playerTurn && isAttacking) {
      
    }
  }
}
