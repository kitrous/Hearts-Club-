class Card {
  float x, y;        // This is For Position
  float w, h;        //This is For Size
  int value;         // This is the Value
  float corner = 20; // Making the corner rounder

  Card(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.value = int(random(1, 10)); //it is a random value
  }

  void display() {
    stroke(0);
    strokeWeight(3);
    fill(255);
    rect(x, y, w, h, corner);

    fill(0);
    textSize(24);
    text(value, x + 20, y + 30);
  }
}
