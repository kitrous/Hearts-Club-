//class collisions() {

//Card[] enemyCard = new Card[5];
//Card[] defaultCard = new Card[5];
//Zone[] zones = new Zone[5];



//void display(){
//  for (int i = 0; i < zones.length; i++){
//      zones[i] = new Zone(width/100 + 200, height/2 - 200);
//      zones[i].zonesDisplay();
//  } 
//}

//  void mouseReleased() {
//    for (int i = 0; i < defaultCard.length; i++) {

//      defaultCard[i].mouseReleased();
//    }

//    for (int i = 0; i < zones.length; i++) {

//      if (zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing) + 25 > defaultCard[i].xPos -25
//        && zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing ) < defaultCard[i].xPos + defaultCard[i].dCWidth
//        && zones[i].playerZoneY + 50 > defaultCard[i].yPos - 25
//        && zones[i].playerZoneY < defaultCard[i].yPos + defaultCard[i].dCHeight  )
//      {
//        defaultCard[i].xPos = zones[i].playerZoneX + i * (zones[i].zoneWidth + zones[i].zoneSpacing);
//        defaultCard[i].yPos = zones[i].playerZoneY;
//        defaultCard[i].inZone = true;
//      }
//    }
//  }
//}
