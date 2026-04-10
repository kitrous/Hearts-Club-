  //possibly use enum
int turnsPlayed;
class TurnSystem {

  boolean playerTurn = true;
  boolean playerIsAttacking;
  String gameOverText = "";
  color gameOverColor = color (0, 0, 0);

  TurnSystem() {
  }
  
  void gameOverDisplay() {
    textSize(200);
    stroke(0);
    fill(gameOverColor);
    text(gameOverText, width/2, height/2, 100);
  }

  void endTurn() {

    //playerTurn = !playerTurn;

    if (playerTurn == true) {
      playerTurn = false;
    } else {
      playerTurn = true;
    }
  }
  
  //if any player or enemy reaches zero it will tell you if you won or not
  void isGameOver() {
    if (player.playerHP <= 0) {
      //game over
      gameOverColor = color (155, 55, 55);
      gameOverText = "You Lose...";
    }
    if (enemy.enemyHP <= 0) {
      //game over, make sure it doesnt run the end turn function
      gameOverColor = color (13, 12, 200);
      gameOverText = "You Win";
    }
  }
  //Calculates which card wins when they are attacking each other
  void calcWinner() {
    //if (player.currentCardValue == enemy.currentCardValue) {
    //  turnsPlayed += 1;
    //  ts.endTurn();
    //  return;
    //} else if (player.currentCardValue < enemy.currentCardValue) {
    //  player.playerHP -= enemy.currentCardValue;
    //} else {
    //  enemy.enemyHP -= player.currentCardValue;
    //}
    
    
    player.currentCardValue -= enemy.currentCardValue;
    enemy.currentCardValue -= player.currentCardValue;
    
    for (int i = 0; i < enemyCard.length; i++) {
      enemy.currentCardValue = 0;
    }
      
    for (int i = 0; i < defaultCard.length; i++) {
      defaultCard[i].cardStroke = color (0, 0, 0);
      
      defaultCard[i].isAttacking = false;
      defaultCard[i].selectedCard = false;
      playerIsAttacking = false;
      player.currentCardValue = 0;
    }
    
    turnsPlayed += 1;
    //ts.endTurn();
  }
}
