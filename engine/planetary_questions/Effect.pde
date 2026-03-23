//For special/unqiue cards
//Mainly trying to make usable for anyone that wants to use it
class Effect {
  
  int cardChance = int(random(1,2));
  int specialCardValue = int(random(11,15));
  int specialCard;
  //find a way to make these the options for the card chance
  int heal = 2;
  int damage = 2;
  int normalCardValue = 1;
  
  void specialCard() {
    //I want this to choose at random if the special card damages or heals
    if  (specialCard == specialCardValue ) {
      if (specialCardValue >+ normalCardValue ) {
    
        
      }
    }
  
  }
  
  void normalCard() {
    
    //I want this to be able to tell the difference between normal and special card
    if (normalCardValue >= 1) {
    
    }
    
  }
}
