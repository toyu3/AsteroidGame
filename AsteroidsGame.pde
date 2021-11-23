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
for (int i = 0; i < stars.length; i ++){
stars[i].draw();
}
bob.move();
bob.show();    
}

public void keyPressed() {
if (key == ' ')
{
bob.setDirectionX(0);
bob.setDirectionY(0);
bob.setX((int)(Math.random()*500));
bob.setY((int)(Math.random()*500));
bob.setPointDirection((int) (Math.random()*360));
} 
if (key == 'a'||key == 'A'){
bob.turn(-5);
}
if (key == 'd'||key == 'D'){
bob.turn(5);
}
if (key == 'w'||key == 'W'){
bob.accelerate(.1);
}
if (key == 's'||key == 'S'){
bob.accelerate(- .1);
}
