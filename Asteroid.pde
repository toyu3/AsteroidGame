class Asteroid extends Floater {
  private int rotSpeed, mySize;

  public Asteroid() {
    rotSpeed = (int)(Math.random()*9)-4;
    mySize = (int)(Math.random()*5)+3;
    corners = 5;
    int[] xS =  {0*mySize, 3*mySize, 1*mySize, -3*mySize, -3*mySize};
    int [] yS = {-3*mySize, -2*mySize, 3*mySize, 2*mySize, -1*mySize};
    xCorners = xS;
    yCorners = yS;
    myColor = color(120, 120, 120);
    myCenterX = (float) (Math.random()*601);
    myCenterY = (float) (Math.random()*601);
    myDirectionX = (float) (Math.random()*5)-2;
    myDirectionY = (float) (Math.random()*5)-2;
    myPointDirection = (int) (Math.random()*361);
  }

  public int getX() {
    return (int) myCenterX;
  }
  public int getY() {
    return (int) myCenterY;
  }
  public int getMySize() {
    return mySize;
  }
  public void move() {
    turn(rotSpeed);
    super.move();
  }
}
