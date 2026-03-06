UI ui;
TurnSystem ts;
Card dcard;
Card pCard1;
Card[] defaultCard = new Card[5];
//Card pCard = new Array();
Deck ddeck;
Player player;
Enemy enemy;


int defaultHP = 50;

int enemyCardValue = 0;

void setup() {
  //size(1000,1000);
  fullScreen();
  
  //x and y values for the objects
<<<<<<< HEAD
  dcard = new Card(100, 600);
  //ddeck = new Deck(1100, 600);
  ddeck = new Deck();
=======
  dcard = new Card(2100, 2600);
  pCard1 = new Card (2100, 2600);
  ddeck = new Deck(1100, 600);
  
  for (int i = 0; i < defaultCard.length; i++){
        defaultCard[i] = new Card(width/2 + 1000, height/2 + 400);
      }
>>>>>>> 37d3e25461de9aeae7a2e15f931456c5869b7953

  ts = new TurnSystem();
  ui = new UI(new PVector (width*.75, height*.75));
  player = new Player();
  enemy = new Enemy();
}

void draw() {
  background(100);

  dcard.display();
  pCard1.display();
  
  for (int i = 0; i < defaultCard.length; i++){
    defaultCard[i].display();
  }
  
  ddeck.showDeck();
  ui.run();
  enemy.updateTurn();
 println(ui.sw);
  //fill(0);
  
  Timer();
}

void mousePressed() {

  ddeck.mousePressed();
  ui.mousePressed();
}

void mouseClicked() {
  ui.mouseClicked();
}

void Timer(){
  int currentTime = 0;
  int ellapsedMillis = 1000;
  
  
  
  
  
  println("Current Time: " + currentTime);
  //println("Timer: " + timer);
  
  
}
