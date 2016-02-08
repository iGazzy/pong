int x, y, w, h, speedX, speedY;
int paddleX, paddleY, paddleW, paddleH, paddleS;

void setup(){
  size(500,500);
  
  //ball initialisation
  x=width/2;
  y=height/2;
  w=50;
  h=50;
  speedX=2;
  speedY=3;
  
  
  //paddle initialisation
  paddleX = 50;
  paddlyY = height/2;
  paddleW = 25;
  paddleH = 100;
  paddleS = 5;
  
}//end setup

void draw(){
  background(0);
  
  drawBall();
  
  ballMove();
  
  ballBounce();
}//end draw


void drawBall(){
  fill(0,255,0);
  ellipse(x,y, w, h);
}//end drawBall

void ballMove(){
  x += speedX; //moves circle along X-Axis
  y += speedY; //moves circle along Y-Axis
}//end ballMove

void ballBounce(){
  if(x > width - w/2){
    speedX = - speedX;
  }//end if
  
  else if( x < 0 + w/2){
    speedX = -speedX;
  }//end else if
  
  
  if(y > width - h/2){
    speedY = - speedY;
  }//end if
  
  else if(y < 0 + h/2){
    speedY = -speedY;
  }//end else if
}//end ballBounce
