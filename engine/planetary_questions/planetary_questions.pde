UI ui;
TurnSystem ts;
Card dcard;
Card pCard1;
Card[] enemyCard = new Card[5];
Card[] defaultCard = new Card[5];
//Card selectedCard;
Zone[] zones = new Zone[5];
//Zone zones;
//Card pCard = new Array();
Deck ddeck;
Deck enemyDeck;
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

  //dcard = new Card(100, 600);
  
  //pCard1 = new Card (width/2, height/2);
  enemyDeck = new Deck(width/2 + 500, height/2 - 300, 155, 55, 55);
  ddeck = new Deck(width/2 + 500, height/2 + 100, 123, 200, 123);
  
  for (int i = 0; i < enemyCard.length; i++) {
        enemyCard[i] = new Card(width/2 + 2500, height/2 - 2300);
        enemyCard[i].isEnemy = true;
  }
  
  for (int i = 0; i < defaultCard.length; i++) {
        defaultCard[i] = new Card(width/2 + 1000, height/2 + 400);
        defaultCard[i].isPlayer = true;
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
      zones[i] = new Zone(width/100 + 200, height/2 - 200);
      zones[i].zonesDisplay();
  }
  
  for (int i = 0; i < enemyCard.length; i++) {
        enemyCard[i].display();
        enemyCard[i].Hovering();
        enemyCard[i].GoToTombstone();
  }
  
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
    defaultCard[i].Hovering();
    defaultCard[i].GoToTombstone();
    //defaultCard[i].mousePressed();
  }

  enemyDeck.showDeck();
  ddeck.showDeck();
  ui.run();
  enemy.updateTurn();
  ts.gameOverDisplay();
  //println(ui.sw);
  //fill(0);
  
  //gameTimer.calcTime();
  
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
  
  for (int i = 0; i < enemyCard.length; i++) {
    enemyCard[i].mousePressed();
  }
}

void mouseClicked() {
  ui.mouseClicked();
}

void mouseReleased(){
 for (int i = 0; i < defaultCard.length; i++){

    defaultCard[i].mouseReleased();
  } 
  
  for (int i = 0; i < zones.length; i++) {
    if (zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing) > defaultCard[i].xPos && zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing) < defaultCard[i].xPos + defaultCard[i].dCWidth && zones[i].playerZoneY > defaultCard[i].yPos && zones[i].playerZoneY < defaultCard[i].yPos + defaultCard[i].dCHeight) {
      defaultCard[i].xPos = zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
      defaultCard[i].yPos = zones[i].playerZoneY;
      defaultCard[i].inZone = true;
    }
    //if (defaultCard[i].xPos > 0 && defaultCard[i].yPos > 0) {
    //  defaultCard[i].xPos = zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
    //  defaultCard[i].yPos = zones[i].playerZoneY;
    //  defaultCard[i].inZone = true;
    //}
  }
  
  //if (zones[0].playerZoneX > defaultCard[0].xPos && zones[0].playerZoneX < defaultCard[0].xPos + defaultCard[0].dCWidth && zones[0].playerZoneY > defaultCard[0].yPos && zones[0].playerZoneY < defaultCard[0].yPos + defaultCard[0].dCHeight) {
  //    defaultCard[0].xPos = zones[0].playerZoneX + 0 * (zones[0].zoneWidth + zones[0].zoneSpacing);
  //    defaultCard[0].yPos = zones[0].playerZoneY;
  //    defaultCard[0].inZone = true;
  //}
  
  //for (int i = 0; i < zones.length; i++){
  //    if (zones[i].enemyZoneX > )
  //}
}
void mouseDragged() {
  

}

void keyPressed(){
  for (int i = 0; i < defaultCard.length; i++){

    //defaultCard[i].keyPressed();
  }
}
