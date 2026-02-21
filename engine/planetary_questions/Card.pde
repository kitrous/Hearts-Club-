class Card {
 int x;
 int y;
//random values
 int cardValue = int(random(1,10));
//so we dont just have a bunch of random numbers and the card look stay's consistent
  //edit these values to change how the card looks/position etc
   int cardNumSize = 25;
   int dCWidth = 150;
   int dCHeight = 250;
   int xPos = 200;
   int yPos = 600;
// constructor
 Card(int xPos, int yPos) {
  x = xPos;
  y = yPos;
  
  } 
   
void display(){
  //test card viewer
    fill(255,255,255);
    rect(xPos,yPos,dCWidth,dCHeight);
    fill(0,0,0);
  //text stuff for cards 
    textSize(cardNumSize);
    text(cardValue, xPos+25,yPos+30);
  
}



}

 
