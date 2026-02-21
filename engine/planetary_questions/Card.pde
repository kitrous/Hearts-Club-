class Card {
  int cardValue = int(random(1,10));

void draw(){
  //test card viewer
  fill(255,255,255);
  rect(100,600,dCWidth,dCHeight);
  fill(0,0,0);
  text(cardValue, 500,500);
  
}
//appearance
int dCWidth = 150;
int dCHeight = 250;

}
