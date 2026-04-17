
class Deck {

  float deckXPos = 1050;
  float deckYPos = 300;
  float deckWidth = 100;
  float deckHeight = 150;
  int deckColorR;
  int deckColorG;
  int deckColorB;
  boolean isEnemy;
  //  int deckXPos = 1000; //The deck's X Position
  //  int deckYPos = 400; // The deck's Y Position
  //int deckWidth = 150; //The deck's width size to be displayed on the "play area"
  //int deckHeight = 250; //The deck's height size to be displayed on the "play area"

  //Deck(int mx, int my)
  Deck() {
  }
  //deckXPos = mx;
  //deckYPos = my;
  int cardXOffset = 0;

  Deck(int mx, int my, int dColorR, int dColorG, int dColorB) {
    deckXPos = mx;
    deckYPos = my;

    deckColorR = dColorR;
    deckColorG = dColorG;
    deckColorB = dColorB;
  }
  //if the deck is pressed based on the amount in the main file, you will get x amount of cards and each will have a different effect
  void mousePressed() {

    if (mouseX > deckXPos && mouseX < deckXPos + deckWidth && mouseY > deckYPos && mouseY < deckYPos + deckHeight) {
      if (ts.canRedraw) {
        for (int i = defaultCard.size() - 1; i >= 0; i--) {
          defaultCard.remove(i);
        }

        //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
        for (int i = 0; i < baseCardTotal; i++) {
          if (i == 0) {
            cardXOffset = 0;
          }
          Effect e = cardEffects.get(int(random(0, cardEffects.size())));
          //Card deCard = defaultCard.get(i);

          cardXOffset += 100;
          defaultCard.add(new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e));
          //defaultCard[i] = new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e);
          //defaultCard[i].originalX

          ts.canRedraw = false;
        }
      } /*else {
        //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
        for (int i = 0; i < baseCardTotal; i++) {
          if (i == 0) {
            cardXOffset = 0;
          }
          println("Trying...");
          Effect e = cardEffects.get(int(random(0, cardEffects.size())));
          //Card deCard = defaultCard.get(i);

          cardXOffset += 100;
          defaultCard.add(new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e));
          //defaultCard[i] = new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e);
          //defaultCard[i].originalX

          ts.canRedraw = false;
        }
      }*/

      //player.updatePlayerCard(dcard.cardValue);
    }
  }

  //Draws player cards; in the beginning of game 5 cards are automatically put
  //in the player's 'hand'. The player can click the deck once in the beginning
  //of the game to 'redraw' cards
  void playerDraw() {
    //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
    for (int i = 0; i < baseCardTotal; i++) {
      if (i == 0) {
        cardXOffset = 0;
      }
      Effect e = cardEffects.get(int(random(0, cardEffects.size())));
      //Card deCard = defaultCard.get(i);

      cardXOffset += 100;
      defaultCard.add(new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e));
      //defaultCard[i] = new Card(width/2 - 200 + cardXOffset, height/2 + 75, 100, 150, color (123, 200, 123), 2, e);
      //defaultCard[i].originalX
    }
  }
  //draws enemy cards, typically happens after you press end turn when you have placed your cards down on the zone
  void enemyDraw() {
    //for (int i = 0; i < enemyCard.length; i++) {
    //  if (i == 0) {
    //    cardXOffset = 0;
    //  }
    //  Effect e = cardEffects.get(int(random(0, cardEffects.size())));

    //  cardXOffset += 100;
    //  enemyCard[i] = new Card(width/2 - 200 + cardXOffset, height/2 - 500, 100, 150, color (123, 200, 123), 2, e);
    //  enemyCard[i].isEnemy = true;
    //  //defaultCard[i].originalX
    //}
    //ts.endTurn();

    //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
    for (int i = 0; i < baseCardTotal; i++) {
      if (i == 0) {
        cardXOffset = 0;
      }
      Effect e = cardEffects.get(int(random(0, cardEffects.size())));

      cardXOffset += 100;
      enemyCards.add(new Card(width/2 - 200 + cardXOffset, height/2 - 500, 100, 150, color (123, 200, 123), 2, e));
    }
    //ts.endTurn();
  }

  //A function to Visualize the Deck. Something similar to Display from the Card class
  void showDeck() {
    if (ts.canRedraw && !isEnemy) {
      stroke(0);
      fill(deckColorR, deckColorG, deckColorB);
      rect(deckXPos, deckYPos, deckWidth, deckHeight);
      fill(0);
      textSize(20);
      text("Deck", deckXPos + 50, deckYPos+25);

      fill(0);
      textSize(20);
      text("Redraw\n Cards?", deckXPos + 50, deckYPos + 75);
    } else {
      stroke(0);
      fill(deckColorR, deckColorG, deckColorB);
      rect(deckXPos, deckYPos, deckWidth, deckHeight);
      fill(0);
      textSize(20);
      text("Deck", deckXPos + 50, deckYPos+25);
    }
  }
}
