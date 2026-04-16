#  The Heart Engine

*: an engine made in [**processing**](https://processing.org/) for card-games like Hearthstone*

## Main Features

- Access to all cards

- Ability to customize the appearance of said cards

- Turn system, Decks, Collisions, Effects, Players, Enemy, UI and Zone classes

## Global Fields

- “*defaultHP*” is the regular health points for both the player and the enemy.



# Contents

[**Card Class**](#card-class)

[**Collision Class**](#collision-class)

[**Deck Class**](#deck-class)

[**Player/Enemy Class**](#player--enemy-class)

[**Turn System Class**](#turn-system-class)

[**UI Class**](#ui-class)

[**Zone Class**](#zone-class)


# Card Class

## Methods

- *display()* is the method that displays the card's graphical appearance.

- *Hovering()* is the method that checks if whether the mouse is hovering over the card.

- *GoToTombstone()* sends the card anywhere you would want in the xPos and yPos for it.

- *mousePressed()* is for holding any cards, handles the selection for attacking, attacking and deselecting a card.

- *mouseReleased()* lets go of the card whenever you release the mouse.

- *mCollision* uses the [**Collision Class**](#collision-class) to detect collisions on the card with the mouse or any other methods you use, can be used with this method.

## Fields

- *cardValue* is a variable that holds the value of the cards, as per the name. This value randomly changes every time it is called with “new Card()”.

- *xPos, yPos* change the card’s x and y Position respectively. 

- *dCWidth, dCHeight* change the card’s width and height respectively. 

- *cardNumSize* changes the size of the number on the card, which is tracking the *cardValue*.

- *isHovering* is a boolean that is used for checking if a mouse is over a card.

- *isDraggingCard* is a boolean that checks if the mouse is holding the card and moving it around.

- *isDestroyed* is a boolean that destroys a card when plugging it into some other logic that can get rid of the card.

- *selectedCard* is a boolean that used for attacking other cards and specifying that this is the selected card.

- *isAttacking* is a boolean that tracks whether a card is attacking or not.

- *inZone* is a boolean that tracks if a card is in a zone or not.

- *canSelectTarget* is a boolean that tracks if a card that "isAttacking" can select a card to attack

- *isEnemy* and *isPlayer* are booleans that track if the card is an enemy or a player.


## Constructor


### Card(float _xPos, float _yPos, float _cardWidth, float _cardHeight, color _cardColor, int _cardHealth, Effect _cardEffect)

- These are the parameters for the card constructor, (ignore card effect those do not work)

# Collision Class

## Methods

- mouseCollision(float mX, float mY, float objX, float objY, float objW, float objH), takes in these parameters to determine if whether your mouse x and y is colliding with whatever object you are hovering over. If its true, the boolean will return true. If it is false, the boolean will return false.

- rectCollision(float obj1X, float obj1Y, float obj2X, float obj2Y, float obj1W, float obj1H, float obj2W, float obj2H) does about the same thing mouseCollision does except for rectangles. Works well with zones.

- circleCollision(PVector player, PVector obj, float playerR, float objR), same thing, will check the distance of the player x and y to the obj x and y to see if it is less than the player radius plus object radius for circle collisions.

# Deck Class

## Methods

- *mousePressed()* in the deck class is used to check for mouse presses on the deck to deal a new card, which in turn updates the player’s card value and ends the turn.

- *showDeck()* visualizes the deck, similar to *display()* in the Card class

- *enemyDraw()* draws the enemy card.

## Fields    

- *deckXPos* and *deckYPos* change the deck’s x and y position.

- *deckWidth* and *deckHeight* change the deck’s width and height.

- *deckColorR*, *deckColorG* and *deckColorB* all take integers for color.

## Constructor

### Deck(int mx, int my, int dColorR, int dColorG, int dColorB)

- Parameters take a x position, y position, and RGB colors.

# Effect Class and Effect Creator Array List

## Fields

- *effectName* is the name of the effect you want to use

- *effectDescription* is the description you want to give the card in its summary when hovering over the card.

- *effectValue* is (to be edited)

# Player / Enemy Class

## Methods

- *updatePlayerCard()* updates the *cardValue* for whichever version of the method you use. This is especially useful for damage dealing and holding the values of who gets damaged.

- Only in the Enemy class, *updateTurn()*, if it isn't the player’s turn then a new card is made for the enemy.

## Fields

- *playerEnemyHP* holds the *defaultHP* value, this is to differentiate the two values for damage purposes.

- *currentCardValue* holds whatever cardValue the player or enemy is given.

# Turn System Class

## Methods

- *gameOverDisplay()* holds all the information for the game over screen.

- *endTurn()* makes sure that if the player's turn is happening to make it false so that the enemy can play a card. This is all triggered when you press the deck.

- *calcWinner()* calculates what value is higher or equal than each other. It is also able to end turns so that the game can loop.

## Fields

- *playerTurn* is a boolean that just tells us it is true, up until we press the deck where it becomes false and makes the enemy “pull” a card then back to being the player’s turn again.

- *playerIsAttacking* is a boolean that tells us if the player is attacking or not.

- *gameOverText* is a string that holds the text that shows when you win or lose.

- *gameOverColor* holds a color value for the text that shows when you win or lose.


# UI Class

## Methods

- *display()* shows the button and text for the player and enemy HP

- *collision()* checks for the distance between the *mouseX* and *mouseY* to the end turn button and if its less than the radius of the button and makes *insideButton* true

- *mouseClicked()* checks if *insideButton* is true which it will be if you’re in the circle and end the turn and change the color.

- *mousePressed()* checks if *insideButton* is true again and changes the color to red. This only checks if you pressed it more than once and not just once like *mouseClicked()*

- *run()* grabs *display()* and *collision()* to one method to simplify it in the main file planetary questions.

## Fields

- *endTurnButton* is just for the ellipse to not make two separate x and y variables.

- *buttonRadius* is for the *endTurnButton’s* size in the ellipse.

- The boolean *insideButton* is used to check if the mouse is inside the button.

- *c* is just for color values.


# Zone Class

## Methods

- *playerZoneDisplay()* is the method that display's the player zone using whatever amount of *zoneSpots* that you want to use.

- *enemyZoneDisplay()* does about the same thing the player's zone does but for the enemies side.

- *zonesDisplay()* runs both of the zone methods together for easier use in the main file, planetary_questions.

## Fields

- *playerZoneX* holds the x value for the player.

- *playerZoneY* holds the y value for the player.

- *enemyZoneX* holds the x value for the enemy.

- *enemyZoneY* holds the y value for the enemy.

- *zoneWidth* for the width of the zones.

- *zoneHeight* for the height of the zones.

- *zoneSpacing* for the amount of x between each zone box (rects).

- *zoneSpots* is how many spots that can place cards in.

## Constructor

### Zone(int x, int y)

- This places a zone wherever you call it as long as you input an x and y integer.
