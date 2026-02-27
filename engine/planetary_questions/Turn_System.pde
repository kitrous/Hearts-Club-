  //possibly use enum

class TurnSystem {

  boolean playerTurn = true;

  TurnSystem() {
  }


  void endTurn() {

    //playerTurn = !playerTurn;

    if (playerTurn == true) {
      playerTurn = false;
    } else {
      playerTurn = true;
    }
  }
  void calcWinner() {
    if (player.currentCardValue == enemy.currentCardValue) {
      ts.endTurn();
      return;
    } else if (player.currentCardValue < enemy.currentCardValue) {
      player.playerHP -= enemy.currentCardValue;
    } else {
      enemy.enemyHP -= player.currentCardValue;
    }
    if (player.playerHP <= 0) {
      //game over
    }
    if (enemy.enemyHP <= 0) {
      //game over, make sure it doesnt run the end turn function
    }

    ts.endTurn();
  }
}
