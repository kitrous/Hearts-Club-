int defaultHP = 3;
//gives a variable to the class
UI ui;
TurnSystem ts;
Card dCard;
Deck dDeck;
Card playerCard;
Card enemyCard;

void setup(){
// i dont want to deal with different window sizes tbh
  fullScreen();
  //this here creates a new instance of the constructor card using the variable dCard
    dCard = new Card(100,600);
    dDeck = new Deck(1100,600);
    
    ts = new TurnSystem();
    ui = new UI(new PVector (width*.75,height*.75));
}

void draw(){
  /*this is using that shiny (wow) dCard variable that holds the Card constructor, 
  then uses the function inside Card, that has all the drawing stuff*/
  dCard.display();
  dDeck.showDeck();
  //playerCard.display();
  //enemyCard.display();
  
  ui.run();
}

void mousePressed() {
  
  dDeck.mousePressed();
  
  
}

void mouseClicked(){
  ui.mouseClicked(); 
}
