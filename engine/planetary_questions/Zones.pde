class Zone {
  //player zone variables
  int playerZoneX = 250;
  int playerZoneY = 400;
  //enemy zone variables
  int enemyZoneX = 250;
  int enemyZoneY = 150;
  //shared zone variables
  int zoneWidth = 100;
  int zoneHeight = 150;
  int zoneSpacing = 100;
  int zoneSpots = 5;
  
  Zone(int x, int y){
    playerZoneX = x;
    playerZoneY = y;
    
    enemyZoneX = x;
    enemyZoneY = y - 250;
  }
  void zonesDisplay() {
  // displayed both zones in one method to reduce the number of referencing in the main file
  playerZoneDisplay();
  enemyZoneDisplay();
  }

  void playerZoneDisplay() {
    for (int i = 0; i < zoneSpots; i++) {
      stroke(0);
      fill(0);
      rect(playerZoneX + i * (zoneWidth + zoneSpacing), playerZoneY, zoneWidth , zoneHeight);
    }
  }
  void enemyZoneDisplay() {
    for (int i = 0; i < zoneSpots; i++) {
      stroke(0);
      fill(0);
      rect(enemyZoneX + i * (zoneWidth + zoneSpacing), enemyZoneY, zoneWidth, zoneHeight);
    }
  }
}
