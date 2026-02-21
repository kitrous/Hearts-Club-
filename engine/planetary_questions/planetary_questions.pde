int defaultHP = 3;
//gives a variable to the class
Card dCard;


void setup(){
// i dont want to deal with different window sizes tbh
  fullScreen();
  //this here creates a new instance of the constructor card using the variable dCard
  dCard = new Card(200,200);
  
}

void draw(){
  /*this is using that shiny (wow) dCard variable that holds the Card constructor, 
  then uses the function inside Card, that has all the drawing stuff*/
  dCard.display();

}
