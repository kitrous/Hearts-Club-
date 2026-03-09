class Timer {
  int currentTime = 0;
  int ellapsedMillis = 1000;
  int previousTime = 0;
 
void calcTime(){
  if (millis() - previousTime >= ellapsedMillis){
    previousTime = millis();
    currentTime += 1;
    println("Current Time: " + currentTime);
  }
 }
}
