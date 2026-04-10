//Calling objects
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

//Collisions collisions;

int defaultHP = 50;

int enemyCardValue = 0;

void setup() {
  pixelDensity(1);
  size(1500,1000);
  //fullScreen();
  //rectMode(CENTER);
  textAlign(CENTER);
  
  addEffects();
  
  gameTimer = new Timer();

  //dcard = new Card(100, 600);
  
  //pCard1 = new Card (width/2, height/2);
  //Calls decks onto the main file
  enemyDeck = new Deck(width/2 + 500, height/2 - 300, 155, 55, 55);
  ddeck = new Deck(width/2 + 500, height/2 + 100, 123, 200, 123);
  
  //Calls the cards but for an array
  for (int i = 0; i < enemyCard.length; i++) {
    Effect e = cardEffects.get(int(random(0, 3)));
    enemyCard[i] = new Card(width/2 + 2500, height/2 - 2300, 100, 150, color (123, 200, 123), 2, e);
    enemyCard[i].isEnemy = true;
  }
  
  for (int i = 0; i < defaultCard.length; i++) {
    Effect e = cardEffects.get(int(random(0, 3)));
    defaultCard[i] = new Card(width/2 + 1000, height/2 + 400, 100, 150, color (123, 200, 123), 2, e);
    defaultCard[i].isPlayer = true;
  }
  
  for (int i = 0; i < zones.length; i++) {
    zones[i] = new Zone(width/2 - 750, height/2 + 150, 100, 150, 200, 5);
    zones[i].createZones();
  }
  
  ts = new TurnSystem();
  ui = new UI(new PVector (width/2 + 550, height/2));
  player = new Player();
  enemy = new Enemy();
  
  //collisions = new Collisions();
}

void draw() {
  background(100);
  
  //dcard.BattlefieldDisplay();
  //dcard.display();
  //pCard1.display();
  //zones.zonesDisplay();
  
  //Draws the zones to the screen using the method in the Zone class
  for (int i = 0; i < zones.length; i++){
      zones[i].zonesDisplay();
  }
  //Displays enemy cards and sends cards to the tombstone when eliminated
  for (int i = 0; i < enemyCard.length; i++) {
        enemyCard[i].display();
        enemyCard[i].Hovering();
        enemyCard[i].GoToTombstone();
  }
  //Displays player cards and sends to the tombstone when eliminated
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
    defaultCard[i].Hovering();
    defaultCard[i].GoToTombstone();
    //defaultCard[i].mousePressed();
  }
  // Shows both decks, runs the ui methods and ends the turn for the player when done
  enemyDeck.showDeck();
  ddeck.showDeck();
  ui.run();
  enemy.updateTurn();
  ts.gameOverDisplay();
  //println(ui.sw);
  //fill(0);
  
  //gameTimer.calcTime();
  
//collisons.display();
  
}

void mousePressed() {
  //allows the deck to be pressed
  ddeck.mousePressed();
  //pCard1.mousePressed();
  
  //allows the cards to be pressed and hovered on the mousex and mousey
  ui.mousePressed();
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
    defaultCard[i].Hovering();
    defaultCard[i].mousePressed();
  }
  //im not sure what this does exactly - kobe (to be edited)
  for (int i = 0; i < enemyCard.length; i++) {
    enemyCard[i].mousePressed();
  }
}
//allows the end turn button to be clicked
void mouseClicked() {
  ui.mouseClicked();
}
// turns the card you are holding to not be dragged anymore
void mouseReleased(){
  
  //collisions.mouseReleased();
  
 for (int i = 0; i < defaultCard.length; i++){

    defaultCard[i].mouseReleased();
  } 
  //zone detection (doesn't work right now lol)
  for (int i = 0; i < zones.length; i++) {
    if (zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing) + 25 > defaultCard[i].xPos -25
    && zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing ) < defaultCard[i].xPos + defaultCard[i].dCWidth 
    && zones[i].playerZoneY + 50 > defaultCard[i].yPos - 25
    && zones[i].playerZoneY < defaultCard[i].yPos + defaultCard[i].dCHeight  ) 
    {
      defaultCard[i].xPos = zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
      defaultCard[i].yPos = zones[i].playerZoneY;
      defaultCard[i].inZone = true;
    }
  }
}
//if (defaultCard[i].xPos > 0 && defaultCard[i].yPos > 0) {
    //  defaultCard[i].xPos = zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
    //  defaultCard[i].yPos = zones[i].playerZoneY;
    //  defaultCard[i].inZone = true;
    //}
  
  //if (zones[0].playerZoneX > defaultCard[0].xPos && zones[0].playerZoneX < defaultCard[0].xPos + defaultCard[0].dCWidth && zones[0].playerZoneY > defaultCard[0].yPos && zones[0].playerZoneY < defaultCard[0].yPos + defaultCard[0].dCHeight) {
  //    defaultCard[0].xPos = zones[0].playerZoneX + 0 * (zones[0].zoneWidth + zones[0].zoneSpacing);
  //    defaultCard[0].yPos = zones[0].playerZoneY;
  //    defaultCard[0].inZone = true;
  //}
  
  //for (int i = 0; i < zones.length; i++){
  //    if (zones[i].enemyZoneX > )
  //}

void mouseDragged() {
  

}

void keyPressed(){
  for (int i = 0; i < defaultCard.length; i++){

    //defaultCard[i].keyPressed();
  }
}
