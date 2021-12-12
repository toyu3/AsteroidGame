SpaceShip [] bob = new SpaceShip[3];
Star [] sue= new Star[200];
ArrayList <Bullet> gun = new ArrayList <Bullet>();
ArrayList <Asteroid> joe = new ArrayList <Asteroid>();
private boolean wPressed, sPressed, aPressed, dPressed, qPressed, spPressed;
public void setup() {
  size(500, 500);
  background(0);
  for (int j = 0; j < 10; j++) {
    joe.add(new Asteroid());
  }
  for (int i = 0; i < sue.length; i ++) {
    sue[i] = new Star();
  }
  for (int i = 0; i < bob.length; i ++) {
    bob[i] = new SpaceShip();
  }
  bob[0].setX(bob[0].getX());
  bob[1].setX(bob[1].getX()+50);
  bob[2].setX(bob[2].getX()-50);
  wPressed = false;
  aPressed = false;
  sPressed = false;
  dPressed = false;
  qPressed = false;
  spPressed = false;
}

public void draw() {
  background(0);
  for (int i = 0; i < sue.length; i ++) {
    sue[i].draw();
  }
  for (int i =0; i<bob.length; i++) {
    bob[i].move();
    bob[i].show(false);
  }
  // ship enters hyperspace
  if (qPressed) {
    for (int i = 0; i < bob.length; i ++) {
      bob[i].setDirectionX(0);
      bob[i].setDirectionY(0);
      bob[i].setX((int)(Math.random()*500));
      bob[i].setY((int)(Math.random()*500));
      bob[i].setPointDirection((int) (Math.random()*360));
    }
  }
  // ship moves left
  if (aPressed)
    for (int i = 0; i < bob.length; i ++) {
      bob[i].turn(-5);
    }
  //ship moves right
  if (dPressed)
    for (int i = 0; i < bob.length; i ++) {
      bob[i].turn(5);
    }
  //ship moves forward
  if (wPressed) {
    for (int i = 0; i < bob.length; i ++) {
      bob[i].accelerate(.1);
      bob[i].show(true);
    }
  }
  //ship moves backward
  if (sPressed)
    for (int i = 0; i < bob.length; i ++) {
      bob[i].accelerate(- .1);
    }
  if (spPressed)
    for (int i = 0; i < bob.length; i ++) {
    gun.add(new Bullet(bob[i]));
    }

  for (int j = 0; j < joe.size(); j++) {
    joe.get(j).show();
    joe.get(j).move();
    for (int i = 0; i < bob.length; i ++) {
    if (dist(joe.get(j).getX(), joe.get(j).getY(), bob[i].getX(), bob[i].getY()) < 30 + 2 * joe.get(j).getMySize()) {
      joe.remove(j);
      joe.add(new Asteroid());
    }
    }
  }
  for (int i = 0; i< gun.size(); i ++)
  {
    gun.get(i).show();
    gun.get(i).move();
  }
  for (int k = 0; k < gun.size(); k++)
  {
    for (int i = 0; i< joe.size(); i ++)
      //if(dist(rock.getX(),rock.getY(), theList.get(i).getX(),theList.get(i).getY()) < 20)
      //{
      //theList.remove(i);
      //}
      if (dist(gun.get(k).getX(), gun.get(k).getY(), joe.get(i).getX(), joe.get(i).getY()) < 20)
      {
        joe.remove(i);
        joe.add(new Asteroid());
      }
  }
}

public void keyPressed() {
  if (key == 'w'||key=='W') {
    wPressed = true;
  }
  if (key == 'a'||key=='A') {
    aPressed = true;
  }
  if (key == 's'||key=='S') {
    sPressed = true;
  }
  if (key == 'd'||key=='D') {
    dPressed = true;
  }
  if (key == 'q'||key=='Q') {
    qPressed = true;
  }
  if (key == ' ')
  {
    spPressed =true;
  }
}
public void keyReleased() {
  if (key == 'w'||key=='W') {
    wPressed = false;
  }
  if (key == 'a'||key=='A') {
    aPressed = false;
  }
  if (key == 's'||key=='S') {
    sPressed = false;
  }
  if (key == 'd'||key=='D') {
    dPressed = false;
  }
  if (key == 'q'||key=='Q') {
    qPressed = false;
  }
  if (key == ' ')
  {
    spPressed =false;
  }
}
