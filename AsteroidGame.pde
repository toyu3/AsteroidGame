SpaceShip bob = new SpaceShip();
Star [] sue= new Star[200];
public void setup() 
{ 
  size(500,500);
  background(0);

  for (int i = 0; i < sue.length; i ++)
      sue[i] = new Star();
          
}

public void draw() {
background(0);
for (int i = 0; i < sue.length; i ++){
sue[i].draw();
}
bob.move();
bob.show();
}

public void keyPressed() {
// ship enters hyperspace
if (key == '  ') {
bob.setDirectionX(0);
bob.setDirectionY(0);
bob.setX((int)(Math.random()*500));
bob.setY((int)(Math.random()*500));
bob.setPointDirection((int) (Math.random()*360));
} 
// ship moves left
if (key == 'a'||key == 'A')
bob.turn(-5);
//ship moves right
if (key == 'd'||key == 'D')
bob.turn(5);
//ship moves forward
if (key == 'w'||key == 'W')
bob.accelerate(.1);
//ship moves backward
if (key == 's'||key == 'S')
bob.accelerate(- .1);
}

class Star {
private int myX, myY;
private int myColor;
public Star() {
myX = (int)(Math.random() * 500);
myY = (int)(Math.random() * 500);
myColor = color(255);
}
public void draw(){
noStroke();
fill(myColor);
ellipse(myX, myY, 3,3);
}
}

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

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    


  abstract public void setX(int x); 
  abstract public int getX(); 
  abstract public void setY(int y);  
  abstract public int getY();   
  abstract public void setDirectionX(double x); 
  abstract public double getDirectionX();  
  abstract public void setDirectionY(double y); 
  abstract public double getDirectionY();  
  abstract public void setPointDirection(int degrees);  
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)     
      myCenterX = 0;        
    else if (myCenterX<0)    
      myCenterX = width;        
    if(myCenterY >height)  
      myCenterY = 0;      
    else if (myCenterY < 0)    
      myCenterY = height;      
  } 


   public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
