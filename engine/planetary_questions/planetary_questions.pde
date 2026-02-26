
UI ui;
TurnSystem ts;
Card dcard;
Deck ddeck;
Card playerCard;
Card enemyCard;
Player player;
Enemy enemy;

int turnsPlayed = 0;
int defaultHP = 50;

void setup(){
 fullScreen();
 //x and y values for the objects
  dcard = new Card(100,600);
  ddeck = new Deck(1100,600);
    
  ts = new TurnSystem();
  ui = new UI(new PVector (width*.75,height*.75));
  player = new Player();
  enemy = new Enemy();
}

void draw(){
 stroke(0);
 strokeWeight(3);
  dcard.display();
  ddeck.showDeck();
  ui.run();
  enemy.updateTurn();
  println(player.playerHP);
  println(enemy.enemyHP);
  //playerCard.display();
  //enemyCard.display();
}

void mousePressed() {
  
  ddeck.mousePressed();
  ui.mousePressed();
  
}

void mouseClicked(){
  ui.mouseClicked(); 
}
