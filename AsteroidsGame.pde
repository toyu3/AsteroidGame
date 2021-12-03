SpaceShip [] bob = new SpaceShip[3];
Star [] sue= new Star[200];
public void setup() { 
size(500,500);
background(0);
for (int i = 0; i < sue.length; i ++)
sue[i] = new Star();         
for (int i = 0; i < bob.length; i ++){
bob[i] = new SpaceShip();   
}
bob[0].setX(bob[0].getX());
bob[1].setX(bob[1].getX()+50);
bob[2].setX(bob[2].getX()+100);
}

public void draw() {
background(0);
for (int i = 0; i < sue.length; i ++){
sue[i].draw();
}
for (int i = 0; i < bob.length; i ++){
bob[i].move();
bob[i].show();
}
}

public void keyPressed() {
// ship enters hyperspace
if (key == 'q'||key=='Q') {
for (int i = 0; i < bob.length; i ++){
bob[i].setDirectionX(0);
bob[i].setDirectionY(0);
bob[i].setX((int)(Math.random()*500));
bob[i].setY((int)(Math.random()*500));
bob[i].setPointDirection((int) (Math.random()*360));
}
} 
// ship moves left
if (key == 'a'||key == 'A'){
for (int i = 0; i < bob.length; i ++){
bob[i].turn(-5);
}
}
//ship moves right
if (key == 'd'||key == 'D'){
for (int i = 0; i < bob.length; i ++){
bob[i].turn(5);
}
}
//ship moves forward
if (key == 'w'||key == 'W'){
for (int i = 0; i < bob.length; i ++){
bob[i].accelerate(.1);
}
}
//ship moves backward
if (key == 's'||key == 'S'){
for (int i = 0; i < bob.length; i ++){
bob[i].accelerate(- .1);
}
}
}
