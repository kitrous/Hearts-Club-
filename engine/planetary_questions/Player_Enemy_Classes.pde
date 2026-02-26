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
      dcard = new Card(width/2 - 150, height/2 + 50); //Takes the dCard, which is from the Card class, to makes a new Card at a specific x and Y location

      //println(dcard.cardValue);
      enemy.updateEnemyCard(dcard.cardValue);
      ts.calcWinner();
    }
  }
  //Card.cardValue =
}
