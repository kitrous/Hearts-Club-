class Zone {
  //player zone variables
  int playerZoneX;
  int playerZoneY;
  //enemy zone variables
  int enemyZoneX;
  int enemyZoneY;
  //shared zone variables
  int zoneWidth;
  int zoneHeight;
  int zoneSpacing;
  int originalZSpacing = zoneSpacing;
  int zoneSpots;
  
  Zone(int x, int y, int zW, int zH, int zSpacing, int zSpots){
    playerZoneX = x;
    playerZoneY = y;
    
    enemyZoneX = x;
    enemyZoneY = y - 250;
    
    zoneWidth = zW;
    zoneHeight = zH;
    zoneSpacing = zSpacing;
    zoneSpots = zSpots;
  }
  
//Method to be used in void setup(). 
//Call both createPlayerZones() and createEnemyZones() to consolidate referencing in the main file
  void createZones() {
    createPlayerZones();
    createEnemyZones();
  }
  void zonesDisplay() {
    //displayed both zones in one method to reduce the number of referencing in the main file
    playerZoneDisplay();
    enemyZoneDisplay();
  }
//displays zone for the player
  void playerZoneDisplay() {
    stroke(0);
    fill(0);
    rect(playerZoneX, playerZoneY, zoneWidth, zoneHeight);
  }

//Method to create player zones to be called in void createZones()
  void createPlayerZones() {
    for (int i = 0; i < zoneSpots; i++) {
      if (i == 0) {
        zoneSpacing = 0;
      }
      else {
        zoneSpacing = originalZSpacing;
      }
      
      zoneSpacing += zoneSpacing;
      zones[i] = new Zone(playerZoneX + zoneSpacing, playerZoneY, zoneWidth, zoneHeight, zoneSpacing, zoneSpots);
    }
  }
  
//displays zone for the enemy
  void enemyZoneDisplay() {
    stroke(0);
    fill(0);
    rect(enemyZoneX, enemyZoneY, zoneWidth, zoneHeight);
  }
  
//Method to create enemy zones to be called in void createZones()  
  void createEnemyZones() {
    for (int i = 0; i < zoneSpots; i++) {
      if (i == 0) {
        zoneSpacing = 0;
      }
      
      zoneSpacing += 200;
      zones[i] = new Zone(enemyZoneX + zoneSpacing, enemyZoneY, zoneWidth, zoneHeight, zoneSpacing, zoneSpots);
    }
  }
}
