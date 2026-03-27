UI ui;
TurnSystem ts;
Card dcard;
Card pCard1;
Card[] defaultCard = new Card[5];
Card selectedCard;
Zone[] zones = new Zone[5];
//Zone zones;
//Card pCard = new Array();
Deck ddeck;
Player player;
Enemy enemy;
Timer gameTimer;

int defaultHP = 50;

int enemyCardValue = 0;

void setup() {
  pixelDensity(1);
  size(1500,1000);
  //fullScreen();
  
  gameTimer = new Timer();
  
  //x and y values for the objects

  dcard = new Card(100, 600);
  //ddeck = new Deck(1100, 600);
  ddeck = new Deck();
  
  dcard = new Card(2100, 2600);
  //pCard1 = new Card (width/2, height/2);
  ddeck = new Deck(width/2 + 500, height/2 + 100);
  
  for (int i = 0; i < defaultCard.length; i++) {
        defaultCard[i] = new Card(width/2 + 1000, height/2 + 400);
  }
  for (int i = 0; i < zones.length; i++){
      zones[i] = new Zone(width/2, height/2);
      zones[i].zonesDisplay();
  }

  ts = new TurnSystem();
  ui = new UI(new PVector (width/2 + 550, height/2));
  player = new Player();
  enemy = new Enemy();
}

void draw() {
  background(100);
  
  //dcard.BattlefieldDisplay();
  //dcard.display();
  //pCard1.display();
  //zones.zonesDisplay();
  for (int i = 0; i < zones.length; i++){
      zones[i] = new Zone(width/2, height/2);
      zones[i].zonesDisplay();
  }
  
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
    defaultCard[i].Hovering();
    defaultCard[i].GoToTombstone();
    //defaultCard[i].mousePressed();
  }
  
  ddeck.showDeck();
  ui.run();
  enemy.updateTurn();
  //println(ui.sw);
  //fill(0);
  
  gameTimer.calcTime();
  
}

void mousePressed() {

  ddeck.mousePressed();
  //pCard1.mousePressed();
  
  ui.mousePressed();
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
    defaultCard[i].Hovering();
    defaultCard[i].mousePressed();
  }
}

void mouseClicked() {
  ui.mouseClicked();
}

void mouseReleased(){
 for (int i = 0; i < defaultCard.length; i++){

    defaultCard[i].mouseReleased();
  } 
}
void mouseDragged() {
  

}

void keyPressed(){
  for (int i = 0; i < defaultCard.length; i++){

    defaultCard[i].keyPressed();
  }
}
