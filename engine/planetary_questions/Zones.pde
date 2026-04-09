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
      
      zoneSpacing += 200;
      zones[i] = new Zone(playerZoneX + zoneSpacing, playerZoneY);
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
      zones[i] = new Zone(enemyZoneX + zoneSpacing, enemyZoneY);
    }
  }
}
