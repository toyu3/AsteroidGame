class SpaceShip extends Floater  {   
public SpaceShip() {
corners = 13;
int[] xS =  {-13,-16,-10,-10,-5,10,18,10,-5,-10,-10,-16,-13};
int [] yS = {3,8,8,13,13,3,0,-3,-13,-13,-8,-8,-3};
xCorners = xS;
yCorners = yS;
myColor = color(152,152,152);
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
public void show (){  
fill(myColor);   
stroke(myColor);   
//convert degrees to radians for sin and cos     
float dRadians = (float)(myPointDirection*(Math.PI/180));
translate((float)myCenterX, (float)myCenterY);
rotate((float)dRadians);
beginShape();
for (int nI = 0; nI < corners; nI++) {
vertex(xCorners[nI], yCorners[nI]);
}
endShape(CLOSE);
rotate(-1*(float)dRadians);
translate(-1*(float)myCenterX, -1*(float)myCenterY);
}
}
