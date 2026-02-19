int defaultHP = 3;






class Player {
  int playerHP = defaultHP;
  
}

class Card  {
  
  int cardValue = int(random(1000,5000));
  
  

}

class Enemy  {
    int enemyHP = defaultHP;
    
  
  
}

class Turn extends Card {
    
    if (Enemy.cardValue > Player.cardValue) {
       playerHP--;
    }

}
