SpaceShip a = new SpaceShip();
Bullet b = new Bullet(a);
Star[] s = new Star[150];
ArrayList <Asteroid> chunk = new ArrayList <Asteroid> ();
boolean isPressedw = false;
boolean isPressedq = false;
boolean isPressede = false;
public void setup() 
{
  size(1000,750);
  background(0);
  for(int i = 0; i < s.length; i++)
  {
    s[i] = new Star((int)(Math.random()*1001),(int)(Math.random()*751));
  }
  for(int i = 0; i < 6; i++)
  {
    int side = (int)(Math.random()*4);
    chunk.add(new Asteroid(side));
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i < s.length; i++)
  {
    s[i].show();
  }
  for(int i = 0; i < chunk.size(); i++)
  {
    chunk.get(i).show();
    int d = (int)dist(chunk.get(i).getX(),chunk.get(i).getY(), a.getX(), a.getY());
    if(d < 70)
    {
      chunk.remove(i);
    }
    else
    {
      chunk.get(i).move();
    }
  }
  a.show();
  a.move();
  b.show();
  b.move();
  if(isPressedw == true)
  {
    a.accelerate(0.05);
  }
  if(isPressedq == true)
  {
    a.rotate(-5);
  }
  if(isPressede == true)
  {
    a.rotate(5);
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 4;
      xCorners = new int[4];
      xCorners[0] = (int)myDirectionX + 15;
      xCorners[1] = (int)myDirectionX - 15;
      xCorners[2] = (int)myDirectionX - 10;
      xCorners[3] = (int)myDirectionX - 15;
      yCorners = new int[4];
      yCorners[0] = (int)myDirectionY;
      yCorners[1] = (int)myDirectionY - 10;
      yCorners[2] = (int)myDirectionY;
      yCorners[3] = (int)myDirectionY + 10;
      myCenterX = 250;
      myCenterY = 250;
      myColor = color(255);
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 270;
    }
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)(myCenterX);}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)(myCenterY);}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
}
class Star
{
  int myX, myY;
  public Star(int x, int y)
  {
    myX = x;
    myY = y;
  }
  public void show()
  {
    fill(255);
    ellipse(myX,myY,5,5);
  }
}
class Asteroid extends Floater
{
  private int rSpeed;
  Asteroid(int side)
  {
    corners = 6;
    xCorners = new int[6];
    xCorners[0] = (int)myCenterX - 25;
    xCorners[1] = (int)myCenterX - 50;
    xCorners[2] = (int)myCenterX - 25;
    xCorners[3] = (int)myCenterX + 25;
    xCorners[4] = (int)myCenterX + 50;
    xCorners[5] = (int)myCenterX + 25;
    yCorners = new int[6];
    yCorners[0] = (int)myCenterY - (int)(50*Math.sin(Math.PI/3));
    yCorners[1] = (int)myCenterY;
    yCorners[2] = (int)myCenterY + (int)(50*Math.sin(Math.PI/3));
    yCorners[3] = (int)myCenterY + (int)(50*Math.sin(Math.PI/3));
    yCorners[4] = (int)myCenterY;
    yCorners[5] = (int)myCenterY - (int)(50*Math.sin(Math.PI/3));
    if(side == 0) //top
    {
      myCenterX = ((int)(Math.random()*999)+1);
      myCenterY = -100;
      myDirectionX = (Math.random()*7-3);
      myDirectionY = (Math.random()*4);
    }
    if(side == 1) //left
    {
      myCenterX = -100;
      myCenterY = ((int)(Math.random()*749)+1);
      myDirectionX = (Math.random()*4);
      myDirectionY = (Math.random()*7-3);
    }
    if(side == 2) //bottom
    {
      myCenterX = ((int)(Math.random()*999)+1);
      myCenterY = 850;
      myDirectionX = (Math.random()*7-3);
      myDirectionY = (Math.random()*-4);
    }
    if(side == 3) //right
    {
      myCenterX = 1100;
      myCenterY = ((int)(Math.random()*749)+1);
      myDirectionX = (Math.random()*-4);
      myDirectionY = (Math.random()*7-3);
    }
    myColor = color(102,51,0);
    myPointDirection = 0;
    rSpeed = (int)(Math.random()*7-3);
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)(myCenterX);}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void move()
  {
    rotate(rSpeed);
    super.move();
  }
  public void show()
  {
    super.show();
  }
}
class Bullet extends Floater
{
  Bullet(SpaceShip theShip)
  {
    myCenterX = a.getX();
    myCenterY = a.getY();
    myPointDirection = a.getPointDirection();
    double dRadians = myPointDirection*Math.PI/180;
    myDirectionX = 5*Math.cos(dRadians) + a.getDirectionX();
    myDirectionY = 5*Math.sin(dRadians) + a.getDirectionY();
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)(myCenterX);}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  public void show()
  {
    fill(0,255,0);
    ellipse(a.getX(),a.getY(),5,5);
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
  public void rotate (int nDegreesOfRotation)   
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
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}
public void keyPressed()
{
 if(keyPressed == true && key == 's')
 {
    a.setDirectionX(0);
    a.setDirectionY(0);
    a.setX((int)(Math.random()*999)+1);
    a.setY((int)(Math.random()*999)+1);
    a.setPointDirection((int)(Math.random()*361));
  }
 if(key == 'w')
 {
    isPressedw = true;
 }
 else if(key == 'q')
 {
    isPressedq = true;
 }
 else if(key == 'e')
 {
    isPressede = true;
 }
}
public void keyReleased()
{
  if(key == 'w')
  {
    isPressedw = false;
  }
  else if(key == 'q')
  {
    isPressedq = false;
  }
  else if(key == 'e')
  {
    isPressede = false;
  }
}
