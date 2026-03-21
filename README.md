#  The Heart Engine

*: an engine made by **processing** for card-games like Hearthstone*

## Main Features

- Access to all cards

- Ability to customize the appearance of said cards

- Turn system, Decks, Players, Enemy and UI classes

## Global Variables

- “*defaultHP*” is the regular health points for both the player and the enemy.

# 

# Contents

**Card Class**

**Deck Class**

**Player/ Enemy Class**

**Turn System Class**

**UI Class**

# Card Class

## Methods

- *display() *is the method that displays the card's graphical appearance. 

## Variables

- *cardValue* is a variable that holds the value of the cards, as per the name. This value randomly changes every time it is called with “new Card()”.

- *xPos, yPos* change the card’s x and y Position respectively. 

- *dCWidth, dCHeight* change the card’s width and height respectively. 

- *cardNumSize *changes the size of the number on the card, which is tracking the *cardValue*.

# Deck Class

## Methods

- *mousePressed()* in the deck class is used to check for mouse presses on the deck to deal a new card, which in turn updates the player’s card value and ends the turn.

- *showDeck()* visualizes the deck, similar to *display()* in the Card class

## Variables    

- *deckXPos* and *deckYPos* change the deck’s x and y position.

- *deckWidth* and *deckHeight* change the deck’s width and height.

# Player / Enemy Class

## Methods

- *updatePlayer(Enemy)Card* updates the *cardValue* for whichever version of the method you use. This is especially useful for damage dealing and holding the values of who gets damaged.

- Only in the Enemy class, *updateTurn()*, if it isn't the player’s turn then a new card is made for the enemy and updates the *cardValue* for the enemies card into the *currentCardValue* to loop back again.

## Variables

- *player(enemy)HP* holds the *defaultHP* value, this is to differentiate the two values for damage purposes.

- *currentCardValue* holds whatever cardValue the player or enemy is given.

# Turn System Class

## Methods

- *endTurn()* makes sure that if the player's turn is happening to make it false so that the enemy can play a card. This is all triggered when you press the deck.

- *calcWinner()* calculates what value is higher or equal than each other. It is also able to end turns so that the game can loop.

## Variables

- *playerTurn* is a boolean that just tells us it is true, up until we press the deck where it becomes false and makes the enemy “pull” a card then back to being the player’s turn again.

# UI Class

## Methods

- *display()* shows the button and text for the player and enemy HP

- *collision()* checks for the distance between the *mouseX* and *mouseY* to the end turn button and if its less than the radius of the button and makes *insideButton* true

- *mouseClicked()* checks if *insideButton* is true which it will be if you’re in the circle and end the turn and change the color.

- *mousePressed()* checks if *insideButton* is true again and changes the color to red. This only checks if you pressed it more than once and not just once like *mouseClicked()*

- *run()* grabs *display()* and *collision()* to one method to simplify it in the main file planetary questions.

## Variables

- *endTurnButton* is just for the ellipse to not make two separate x and y variables.

- *buttonRadius* is for the *endTurnButton’s* size in the ellipse.

- The boolean *insideButton* is used to check if the mouse is inside the button.

- *c* is just for color values.
