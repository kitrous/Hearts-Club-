 class Card {
   int x;
   int y;
//random values
 int cardValue = int(random(1,10));
//so we dont just have a bunch of random numbers and the card look stay's clear
 int dCWidth = 150;
 int dCHeight = 250;
  
  // constructor
  Card(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  
  } 
   
void display(){
  //test card viewer
  fill(255,255,255);
  rect(200,300,dCWidth,dCHeight);
  fill(0,0,0);
  text(cardValue, 500,500);
  
}



}

 
