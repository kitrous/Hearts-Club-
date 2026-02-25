//possibly use enum 

class TurnSystem{
  
boolean playerTurn = true;

TurnSystem(){
  


}


void endTurn(){
  
  //playerTurn = !playerTurn;
  
  if(playerTurn == true){
   playerTurn = false;
  }
  else{
    playerTurn = true;
  }
}
}
