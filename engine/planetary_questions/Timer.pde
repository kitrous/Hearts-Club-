class Timer {
  int currentTime = 0;
  int ellapsedMillis = 1000;
  int previousTime = 0;

int timeLimit = 50; //Max 50 Seconds
 
void calcTime(){
if (currentTime < timeLimit){  
if (millis() - previousTime >= ellapsedMillis) {
    previousTime = millis();
    currentTime += 1;
    println("Current Time: " + currentTime);
  }
 } else {
println("Turn End");
}
}
}
