//Base class for Player-Based entities
class Player {

  int playerHP = defaultHP;
  int currentCardValue = 0;
  //constructor
  Player() {
  }

  void updatePlayerCard(int cardValue) {
    currentCardValue = cardValue;
  }
}

//Base for Enemies
class Enemy {
  int enemyHP = defaultHP;
  int currentCardValue = 0;
  //constructor
  Enemy() {
  }
  void updateEnemyCard(int cardValue) {
    currentCardValue = cardValue;
  }

  void updateTurn() {
    if (!ts.playerTurn) {
      //Enemy Draws card
      //enemyDeck.enemyDraw();

      //for (int i = 0; i < zones.length; i++) {
      //  enemyCard[i].xPos = zones[i].enemyZoneX;
      //  enemyCard[i].yPos = zones[i].enemyZoneY;
      //  enemyCard[i].inZone = true;
      //}
      //for (Card eCards : enemyCards) {
      //  //if (currentCard.selectedCard) {
      //  //  ts.currentPlayerAttackingCard = currentCard;
      //  //}
      //  eCards.xPos = zones
      //}
      for (int i = 0; i < zones.length; i++) {
        Card eC = enemyCards.get(i);
        if (!eC.isDestroyed) {
          eC.run();
          eC.xPos = zones[i].enemyZoneX;
          eC.yPos = zones[i].enemyZoneY;
          eC.inZone = true;
        }
        else if (eC.isDestroyed){
          eC.run();
          eC.xPos = eC.tombstoneXPos;
          eC.yPos = eC.tombstoneYPos;
          //eC.inZone = false;
        }
      }
      ts.endTurn();
    }
  }
}
