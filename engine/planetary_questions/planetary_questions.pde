int defaultHP = 3;

UI ui;
TurnSystem ts;
Card dCard;
Deck dDeck;
Card playerCard;
Card enemyCard;

void setup(){
  fullScreen();
  //x and y values for the objects
    dCard = new Card(100,600);
    dDeck = new Deck(1100,600);
    
    ts = new TurnSystem();
    ui = new UI(new PVector (width*.75,height*.75));
}

void draw(){
 stroke(0);
 strokeWeight(3);
  dCard.display();
  dDeck.showDeck();
  ui.run();
  //playerCard.display();
  //enemyCard.display();
}

void mousePressed() {
  
  dDeck.mousePressed();
  ui.mousePressed();
  
}

void mouseClicked(){
  ui.mouseClicked(); 
}
