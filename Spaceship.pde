  class SpaceShip extends Floater{   
  public SpaceShip() {
  corners = 13;
  int[] myX =  {-13,-16,-10,-10,-5,10,18,10,-5,-10,-10,-16,-13};
  int [] myY = {3,8,8,13,13,3,0,-3,-13,-13,-8,-8,-3};
  xCorners = myX;
  yCorners = myY;
  myColor = color(255,255,255);
  myCenterX = 250;
  myCenterY = 250;
  myDirectionX = 0;
  myDirectionY = 0;
  myPointDirection = 0;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y)  {myCenterY = y;}
  public int getY()   {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX()  {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY()  {return myDirectionY;}
  public void setPointDirection(int degrees)  {myPointDirection = degrees;}
  public double getPointDirection() {return (int)myPointDirection;}
  
  public void show () {  
  fill(myColor);   
  stroke(myColor); 
  float dRadians = (float)(myPointDirection*(Math.PI/180)); 
  translate((float)myCenterX, (float)myCenterY);  
  rotate((float)dRadians);
  beginShape();
  for (int i = 0; i < corners; i++) {
    vertex(xCorners[i], yCorners[i]);
  }
  endShape(CLOSE);
  rotate(-1*(float)dRadians);
  translate(-1*(float)myCenterX, -1*(float)myCenterY);
}
