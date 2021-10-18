//declare bee variables here   
void setup()   
{     
  size(500,500);
  background(157, 227, 252);
  noStroke();
  //initialize bee variables here
  for (int i = 0; i < swarm.length; i++) {
    swarm[i] = new Bee();
  }
}   

void draw()   
{    
  background(157, 227, 252);
  //move and show the bee
  for(int i = 0; i < swarm.length; i++){
    swarm[i].show();
    swarm[i].move();
  }
}  

class Bee    
{     
  int myX, myY, myColor;
  Bee() {
    myX = 250;
    myY = 250;
    myColor = color(255,255,0);
  }
  
  void move() {
    //keep bees on screen
    if(myX > 490)
      myX = 490;
    if(myX < 10)
      myX = 10;
    if(myY > 490)
      myY = 490;
    if(myY < 10)
      myY = 10;
    //walk
    myX = myX + (int)(Math.random()*9)-4;
    myY = myY + (int)(Math.random()*9)-4;
  }
  
  void show(){
    fill(myColor);
    ellipse(myX, myY, 20, 10);
    fill(0);
    rect(myX-5, myY-5, 3, 10);
  }    
}

Bee [] swarm = new Bee[100];
