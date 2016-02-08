int x, y, w, h, speedX, speedY;
int paddleX, paddleY, paddleW, paddleH, paddleS;
boolean up, down;
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
  rectMode(CENTER); //makes rect draw in the centre
  paddleX = 50;
  paddleY = height/2;
  paddleW = 25;
  paddleH = 100;
  paddleS = 5;
  
}//end setup

void draw(){
  background(0);
  
  drawBall();
  
  ballMove();
  
  ballBounce();
  
  drawPaddle();
  
  paddleMove();
  
  paddleBoundary();
  
  paddleHit();
}//end draw


void drawPaddle(){
  fill(255,0,0);
  rect(paddleX, paddleY, paddleW, paddleH);
}//end drawPaddle

void paddleHit(){
  // x-w/2 shows left edge of circle
  // paddleX + paddleW/2 shows right edge of left paddle
  if(x - w/2 < paddleX + paddleW/2){
    speedX = -speedX;  //invert X speed direction
  }
}

void paddleBoundary(){
  if(paddleY - paddleH/2 - 1< 0){ // needs -1 or else it gets stuck
    paddleY += paddleS;
  }
  if(paddleY + paddleH/2 + 1> height){ //needs -1 or else it gets stuck
    paddleY -= paddleS;
  }
}//end paddleBoundary


void paddleMove(){ 
  if(paddleY < height-(paddleH/2) && paddleY > paddleH/2){
    
    if(up == true){
      paddleY -= paddleS; //inverted + and - due to where centre in processing
    }
    
    if(down == true){
      paddleY += paddleS; //inverted + and - due to where centre in processing
    }
  }//end while
  
}//end paddleMove


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

void keyPressed(){
  if(key == 'w' || key == 'W'){  //UP KEY PRESSED
    up = true;
  }
  
  if(key == 's' || key == 'S'){  //DOWN KEY PRESSED
    down = true;
  }
}//end keyPressed

void keyReleased(){
  if(key == 'w' || key == 'W'){  //UP KEY RELEASED
    up = false;
  }
  
  if(key == 's' || key == 'S'){  //DOWN KEY RELEASED
    down = false;
  }
}//end keyReleased
