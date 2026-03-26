class Collision {

  float pushStrength = 0.5; // How strongly cards will push apart

  void resolve(Card[] cards) {

    for (int i = 0; i < cards.length; i++) {
      Card c1 = cards[i];
      if (c1 == null) continue;

      for (int j = i + 1; j < cards.length; j++) {
        Card c2 = cards[j];
        if (c2 == null) continue;

        // Checks for overlap
        if (isOverlapping(c1, c2)) {
          separate(c1, c2);
        }
      }
    }
  }

  boolean isOverlapping(Card a, Card b) {
    return !(a.xPos + a.dCWidth < b.xPos ||
             a.xPos > b.xPos + b.dCWidth ||
             a.yPos + a.dCHeight < b.yPos ||
             a.yPos > b.yPos + b.dCHeight);
  }

  void separate(Card a, Card b) {

    // Finds center points
    float ax = a.xPos + a.dCWidth/2;
    float ay = a.yPos + a.dCHeight/2;
    float bx = b.xPos + b.dCWidth/2;
    float by = b.yPos + b.dCHeight/2;

    // Direction vector
    float dx = ax - bx;
    float dy = ay - by;

    // Avoiding all divide-by-zero
    if (dx == 0 && dy == 0) {
      dx = random(-1, 1);
      dy = random(-1, 1);
    }

    float dist = sqrt(dx*dx + dy*dy);

    // Keeps it Normalize
    dx /= dist;
    dy /= dist;

    // Will push cards away from each other
    a.xPos += dx * pushStrength;
    a.yPos += dy * pushStrength;

    b.xPos -= dx * pushStrength;
    b.yPos -= dy * pushStrength;
  }
}
