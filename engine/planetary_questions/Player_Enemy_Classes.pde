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
      enemyDeck.enemyDraw();
      
      for (int i = 0; i < zones.length; i++) {
        
        enemyCard[i].xPos = zones[i].enemyZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
        enemyCard[i].yPos = zones[i].enemyZoneY;
        enemyCard[i].inZone = true;
      }
      //enemy.updateEnemyCard(dcard.cardValue);
      //ts.calcWinner();
    }
  }
  

  //Card.cardValue =
}
