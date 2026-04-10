class Collision {
//Credit to Manny for showing us his Collision class from his Platformer Demo game he made in Processing
//Link: https://madmanapoints.itch.io/platformer-demo
/*We repurposed Manny's collision class to be able to work to have cards 
interact with each other, and have the mouse interact with cards. */
  Collision(){}
  
  boolean mouseCollision(float mX, float mY, float objX, float objY, float objW, float objH) {
    if (mX > objX && 
    mX < objX + objW && 
    mY > objY && 
    mY < objY + objH) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean rectCollision(float obj1X, float obj1Y, float obj2X, float obj2Y, float obj1W, float obj1H, float obj2W, float obj2H)
  {
    if(obj1X + obj1W > obj2X &&
       obj1X < obj2X + obj2W &&
       obj1Y + obj1H > obj2Y &&
       obj1Y < obj2Y + obj2H)
     {
       return true;
     } 
     else
     {
       return false;
     }
  }
  
  //Might be something we can use later. 
  //Credit to Manny for showing this from his Collision class from his Platformer Demo game he made in Processing
  //Link: https://madmanapoints.itch.io/platformer-demo
  boolean circleCollision(PVector player, PVector obj, float playerR, float objR)
  {
    if(dist(player.x, player.y, obj.x, obj.y) < playerR + objR)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  

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
}
