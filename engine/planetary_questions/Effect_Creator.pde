ArrayList<Effect> cardEffects;
//to add different effects to our cards
void addEffects() {
  cardEffects = new ArrayList<Effect>();
  
  cardEffects.add(new Effect("", "", 1));
  cardEffects.add(new Effect("Crying \nOutrage", "This card cries...", 4));
  cardEffects.add(new Effect("Careless", "This card doesn't care...", 1));
}

//To create the logic of the effects you created in "addEffects"
void run() {
  
}
