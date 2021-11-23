SpaceShip bob = new SpaceShip();
Star [] sue = new Star[200];
public void setup() { 
size(500,500);
background(0);
for (int i = 0; i < sue.length; i ++)
  sue[i] = new Star();
}

public void draw() {
background(0);
bob.move();
bob.show();    
}
