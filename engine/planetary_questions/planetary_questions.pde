int defaultHP = 3;


class Player {
  int playerHP = defaultHP;
  
}

class Card extends Player {
  
  int cardValue = int(random(1000,5000));
  
  

}

class Enemy extends Card {
    int enemyHP = defaultHP;
  if (Player.cardValue > Enemy.cardValue) {
    enemyHP--;
  }
  
  
}
