//For special/unqiue cards
//Mainly trying to make usable for anyone that wants to use it
class Effect {
  
  int cardChance = int(random(1,2));
  int specialCardValue = int(random(11,15));
  int specialCard;
  //find a way to make these the options for the card chance
  int heal = int(random(1,3));
  int damage = int(random(1,3));
  int normalCardValue = 1;
  boolean isNormal;
  
  String effectName;
  String effectDescription;
  int effectValue;
  
  Effect(String _effectName, String _effectDescription, int _effectValue) {
    
    effectName = _effectName;
    effectDescription = _effectDescription;
    effectValue = _effectValue;
    
    //if ()
  }
  
  
  void cardStatus() {
    
    if (cardChance == 1) {
      isNormal = true;
    }
    else if (cardChance == 2) {
      isNormal = false;
    }
    
    if (isNormal) {
      normalCard();
    }
    else {
      specialCard();
    }
  }
  
  void specialCard() {
    //I want this to choose at random if the special card damages or heals
    if  (specialCard == specialCardValue ) {
      if (specialCardValue >+ normalCardValue ) {
    
        
      }
    }
  
  }
  
  void normalCard() {
    //Have fucntionality where the card has attack damage values
  }
}
