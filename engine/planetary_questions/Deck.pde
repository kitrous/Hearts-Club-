
class Deck {

  float deckXPos = width*.7;
  float deckYPos = height*.3;
  float deckWidth = (width+height)*.05;
  float deckHeight = (width+height)*.075;
  //  int deckXPos = 1000; //The deck's X Position
  //  int deckYPos = 400; // The deck's Y Position
  //int deckWidth = 150; //The deck's width size to be displayed on the "play area"
  //int deckHeight = 250; //The deck's height size to be displayed on the "play area"

  Deck(int mx, int my) {
    deckXPos = mx;
    deckYPos = my;
  }

  void mousePressed() {
    //credit: following if-statement was taken from user Juno Morrow
    //url: https://openprocessing.org/sketch/758431
    //orig contrib: Needed to use this to detect the distance between the rect of the deck card and the mouse
    if (mouseX > deckXPos && mouseX < deckXPos + deckWidth && mouseY > deckYPos && mouseY < deckYPos + deckHeight) {
      //end credit for Juno Morrow

      //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
      dcard = new Card(width/2, height/2 + 50); //Takes the dCard, which is from the Card class, to makes a new Card at a specific x and Y location

      
      player.updatePlayerCard(dcard.cardValue);
      ts.endTurn();
    }
  }

  //A function to Visualize the Deck. Something similar to Display from the Card class
  void showDeck() {
    fill(123, 200, 123);
    rect(deckXPos, deckYPos, deckWidth, deckHeight);
    fill(0);
    text("Deck", deckXPos, deckYPos+25);
  }
}
