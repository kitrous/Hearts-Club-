int defaultHP = 3;
// the baseline for our cards for size
// dC is short for default card
int dCWidth = 150;
int dCHeight = 250;

void setup(){
// i dont want to deal with different window sizes tbh
fullScreen();

}

void draw(){
rect(100,600,dCWidth,dCHeight);
}

//The base class for Player-based entities
class Player {
  int playerHP = defaultHP;
  
}



class Enemy  {
    int enemyHP = defaultHP;
    
  
  
}
