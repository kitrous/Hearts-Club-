class Card {
  //variables for our cards
  int cardValue = int(random(1, 10)), damage = cardValue; //random values
  boolean isHovering, isDraggingCard;
  boolean isDestroyed;
  boolean selectedCard;
  boolean isAttacking; //boolean to track whether a card is attacking
  boolean inZone; //boolean to track if a card is in a zone
  boolean isEnemy, isPlayer;
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
  
  void run() {
    mCollision();
    cCollision();
    display();
    goToTombstone();
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
  }
  
  //sends the card to the tombstone and if the card is not a player card and not destroyed
  void goToTombstone() {
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
      
      //this.inZone = false;
    }
  }
  
  void mousePressed() {
    //println("hardy har har");
    //checks if the card is hovering and if its in not in a zone already then it starts dragging
    if (this.isHovering && !inZone) {
      this.isDraggingCard = true;
    }
    
    //If selecting a player card when trying to attack
    if (this.isHovering && inZone && !ts.playerIsAttacking && ts.playerTurn && !isEnemy) {
      
      cardStroke = color (255, 0, 0);
      
      //this.isAttacking = true;
      this.selectedCard = true;
      ts.playerIsAttacking = true;
      for (Card currentCard : defaultCard) {
        if (currentCard.selectedCard) {
          ts.currentPlayerAttackingCard = currentCard;
        }
      }
      //ts.currentPlayerAttackingCard = get();
    }
    //Deselect a card to stop attacking
    else if (this.isHovering && inZone && ts.playerIsAttacking && ts.playerTurn && !isEnemy) {
    
      cardStroke = color (0, 0, 0);
      
      //this.isAttacking = false;
      this.selectedCard = false;
      ts.playerIsAttacking = false;
    }
    
    //If selecting a enemy card that you are trying to target
    if (this.isHovering && inZone && ts.playerIsAttacking && ts.playerTurn && this.isEnemy) {
      this.selectedCard = true;
      for (Card targetCard : enemyCards) {
        if (targetCard.selectedCard) {
          ts.currentEnemyTarget = targetCard;
        }
      }
    }
  }
  
  //releases the card by making isdraggingcard false
  void mouseReleased() {
    if (this.isDraggingCard) {
      this.isDraggingCard = false;
    }
  }
  
  void mCollision() {
    boolean mPlayerCol = collision.mouseCollision(mouseX, mouseY, this.xPos, this.yPos, this.cardWidth, this.cardHeight);
    
    if (mPlayerCol == true && !isDraggingCard /*&& !holdingACard*/) {
    if (mPlayerCol == true && !isDraggingCard && !isDestroyed) {
      this.isHovering = true;
      
      if ((xPos == startX && yPos == startY) || inZone) {
        
        if (cardEffect.effectDescription == "") {
          return;
        }
        else {
          fill(cardColor);
          rect(xPos - cardWidth/2 * 4, yPos - cardHeight/2 * 2, 300, 200, 15);
          rect(width * 0.17, height * 0.6, 300, 200, 15);
          fill(255);
          textSize(20);
          text(cardEffect.effectDescription, xPos - cardWidth/2, yPos - cardHeight/2, 40);
          //fill(cardColor);
          //rect(200, 700, 300, 200, 15);
          //fill(255);
          //textSize(20);
          //text(cardEffect.effectDescription, 325, 750, 40);
          text(cardEffect.effectDescription, width * 0.17 + 150, height * 0.6 + 100, 40);
        }
      }
    }
    else {
      this.isHovering = false;
    }
    
  //  if (this.isHovering && isClicking && !inZone) {
  //    isDragging = true;
  //    holdingACard = true;
  //  }
  //  else if (!isClicking) {
  //    this.isDragging = false;
  //    holdingACard = false;
  //  }
    
  //  if (this.isDragging) {
  //    this.xPos = mouseX - cardWidth/2;
  //    this.yPos = mouseY - cardHeight/2;
  //  }
  //  else if (!this.inZone && !this.onZone) {
  //    xPos = startX;
  //    yPos = startY;
      
  //    //if(xPos >= startX) {
  //    //  xPos -= speed;
  //    //}   
  //    //if(xPos <= startX) {
  //    //  xPos += speed;
  //    //}
  //    //if(yPos >= startY) {
  //    //  yPos -= speed;
  //    //}
  //    //if(yPos <= startY) {
  //    //  yPos += speed;
  //    //}
  //    //if (xPos != startX && yPos != startY) {
  //    //  xPos = startX;
  //    //  yPos = startY;
  //    //}
  //  }
  }
  
  //Collision between cards
  void cCollision() {
    
    //Card Collision for other Cards like enemy card (WIP)
    //for (int i = 0; i < enemyCards.length; i++) {
    //  boolean enemyCol = collision.rectCol(xPos, yPos, enemyCards[i].xPos, enemyCards[i].yPos, cardWidth, cardHeight, enemyCards[i].cardWidth, enemyCards[i].cardHeight);
      
    //  if (enemyCol) {
        
    //  }
    //}
    
    //Card Collision for zones
    for (int i = 0; i < zones.length; i++) {
      boolean pZoneCol = collision.rectCollision(this.xPos, this.yPos, zones[i].playerZoneX, zones[i].playerZoneY, cardWidth, cardHeight, zones[i].zoneWidth + 10, zones[i].zoneHeight + 10);
      
      if (pZoneCol) {
        if (!this.isDraggingCard && !this.inZone && zones[i].occupied == false) {
          this.xPos = zones[i].playerZoneX;
          this.yPos = zones[i].playerZoneY;
          this.inZone = true;
          zones[i].occupied = true;
        }
        else if (zones[i].playerZoneX != this.xPos && zones[i].playerZoneY != this.yPos && zones[i].occupied) {
          zones[i].occupied = false;
        }
      }
      
      //if (pZoneCol) {
      //  println("In zone.");
      //  this.onZone = true;
        
      //  //if (isClicking && !this.inZone) {
      //  //  this.inZone = false;
      //  //}
        
      //  if (!isClicking && this.onZone && zones[i].isOccupied == false) {
      //    this.xPos = zones[i].playerZoneX;
      //    this.yPos = zones[i].playerZoneY;
      //    this.inZone = true;
      //    zones[i].isOccupied = true;
      //  }
      //  //else {
      //  //  println("Not in zone.");
      //  //  this.onZone = false;
      //  //  this.inZone = false;
      //  //}
      //}
    }
  }
}
