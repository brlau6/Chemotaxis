//declare bee variables here   
void setup()   
{     
  size(500, 500);
  background(157, 227, 252);
  noStroke();
  //initialize bee variables here
  for (int i = 0; i < swarm.length; i++) {
    swarm[i] = new Bee();
  }
}   

void draw()   
{    
  background(122, 233, 255);//sky
  fill(2, 158, 30);
  rect(0, 400, 500, 100);//grass
  fill(255, 222, 5);
  ellipse(450,75,40,40);//sun
  
  
  //move and show the bee
  for (int i = 0; i < swarm.length; i++) {
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
    myColor = color(255, 222, 5);
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
    //walk

    int xMouse = 0;
    if (myX < mouseX)
      xMouse = 3;
    if (myX > mouseX)
      xMouse = -3;
    
    int yMouse = 0;
    if (myY < mouseY)
      yMouse = 3;
    if (myY > mouseY)
      yMouse = -3;
    myX = myX + (int)(Math.random()*9)-4+xMouse;
    myY = myY + (int)(Math.random()*9)-4+yMouse;
  }

  void show() {
    fill(myColor);
    ellipse(myX, myY, 20, 10);//body
    fill(0);
    rect(myX-5, myY-5, 3, 10);//left stripe
    rect(myX+1, myY-5, 3, 10);//right stripe
    fill(199, 253, 255);
    ellipse(myX-3, myY-10, 5, 10);//left wing
    ellipse(myX+3, myY-10, 5, 10);//right wing
  }
}

Bee [] swarm = new Bee[100];

boolean loop = true;
void mousePressed(){
  loop = !loop;
  if(loop == false){
    noLoop();
  } else {
    loop();
  }
}
