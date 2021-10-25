//declare bee variables here   
void setup(){     
  size(500, 500);
  background(157, 227, 252);
  noStroke();
  //initialize bee variables here
  for (int i = 0; i < swarm.length; i++) {
    swarm[i] = new Bee();
  }
}   

Hive home = new Hive();

void draw(){    
  background(122, 233, 255);//sky
  fill(2, 158, 30);
  rect(0, 350, 500, 150);//grass
  fill(255, 222, 5);
  ellipse(450,75,40,40);//sun 
  fill(255);
  ellipse(200,75,200,60);//cloud bottom left
  ellipse(220,50,100,60);//cloud middle
  home.show();//hive

  //move and show the bee
  for (int i = 0; i < swarm.length; i++) {
    //only shows bees outside of hive
    if((swarm[i].myX < home.myX-25 || swarm[i].myX > home.myX+25) || (swarm[i].myY < home.myY-25 || swarm[i].myY > home.myY+25))
      swarm[i].show();
    swarm[i].move();
  }
  
  fill(0);
  text("♩#",mouseX, mouseY);//the jazz
}  

class Hive {
  int myX, myY;
  Hive() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  
  void show(){
    fill(242, 194, 36);
    ellipse(myX, myY, 60, 80);//main yellow part
    fill(64, 45, 26);
    ellipse(myX-5, myY, 20, 20);//opening
  }
}
  
class Bee {     
  int myX, myY, mySize, myColor, mouseAttractionLevel;
  Bee() {
    myX = 250;
    myY = 250;
    mySize = 10;
    myColor = color(242, 194, 36);
    mouseAttractionLevel = 1;
  }

  void move() {
    //keep bees on screen
    if (myX > 490)
      myX = 490;
    if (myX < 10)
      myX = 10;
    if (myY > 490)
      myY = 490;
    if (myY < 10)
      myY = 10;   
    
    int xMouse = 0;
    if (myX < mouseX)
      xMouse = mouseAttractionLevel;
    if (myX > mouseX)
      xMouse = -mouseAttractionLevel;
    int yMouse = 0;
    if (myY < mouseY)
      yMouse = mouseAttractionLevel;
    if (myY > mouseY)
      yMouse = -mouseAttractionLevel;
    
    myX = myX + (int)(Math.random()*9)-4+xMouse;
    myY = myY + (int)(Math.random()*9)-4+yMouse;
  }

  void show() {
    //fill((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256));
    fill(myColor);
    ellipse(myX, myY, 20, mySize);//body
    fill(0);
    rect(myX-5, myY-5, 3, mySize);//left stripe
    rect(myX+1, myY-5, 3, mySize);//right stripe
    fill(199, 253, 255);
    ellipse(myX-3, myY-10, 5, mySize);//left wing
    ellipse(myX+3, myY-10, 5, mySize);//right wing
  }
}

Bee [] swarm = new Bee[100];

void mousePressed(){
  home.myX = (int)(Math.random()*450)+10;
  home.myY = (int)(Math.random()*450)+10;
}
