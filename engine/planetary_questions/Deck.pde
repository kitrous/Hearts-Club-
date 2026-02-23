class Deck{
  int deckXPos = 1000; //The deck's X Position
  int deckYPos = 400; // The deck's Y Position
  
  int deckWidth = 150; //The deck's width size to be diplayed on the "play area"
  int deckHeight = 250; //The deck's height size to be diplayed on the "play area"
  
  void mousePressed(){
    if (dist(deckXPos, deckYPos, mouseX, mouseY) < deckWidth+deckHeight/2){
      //Deal Card, creating a new instance of a card object to be placed on the player's side of "play area"
    }
  }
  
  //A function to Visualize the Deck. Something similar to Display from the Card class
}
