int x, y, w,speedX, speedY;
int paddleLeftX, paddleLeftY, paddleW, paddleH, paddleS;
int paddleRightX, paddleRightY;

boolean upLeft, downLeft;
boolean upRight, downRight;

int scoreLeft=0;
int scoreRight=0;

int textsize=40;
int textY=50;

void setup(){
  size(500,500);
  
  //ball initialisation
  x=width/2;
  y=height/2;
  w=50;
  speedX=2;
  speedY=3;
  
  
  //paddle initialisation
  rectMode(CENTER); //makes rect draw in the centre
  paddleLeftX = 50;
  paddleLeftY = height/2;
  
  paddleRightX = width-50;
  paddleRightY = height/2;
  
  paddleW = 25;
  paddleH = 100;
  paddleS = 5;
  
}//end setupLeft

void draw(){
  background(0);
  
  drawBall();
  ballMove();
  ballBounce();
  
  drawPaddle();
  paddleMove();
  paddleBoundary();
  paddleHit();
  
  scores();
}//end draw


void drawPaddle(){
  //LEFT
  fill(255,0,0);
  rect(paddleLeftX, paddleLeftY, paddleW, paddleH);
  
  //RIGHT
  fill(0,0,255);
  rect(paddleRightX, paddleRightY, paddleW, paddleH);
}//end drawPaddle

void paddleHit(){
  // x -w/2 shows left edge of circle
  // paddleLeftX + paddleW/2 shows right edge of left paddle
  // y -w/2 shows top hit box for ball to hit paddle
  //paddleLeftY + paddleH/2 shows bottom hit box from centre for paddle
  // y +w/2 shows bottom hit box for ball to hit paddle
  //paddleLeftY - paddleH/2 shows bottom hitbox from centre for paddle
  if(x - w/2 < paddleLeftX + paddleW/2 && y - w/2 < paddleLeftY + paddleH/2 && y + w/2 > paddleLeftY - paddleH/2){
    if(speedX <0){  //prevents bug that ball hits corner and gets stuck inside paddle
      speedX = -speedX;  //invert X speed direction
    }//end inner if
  }//end outer if
  
  if(x + w/2 > paddleRightX - paddleW/2 && y + w/2 > paddleRightY - paddleH/2 && y - w/2 < paddleRightY + paddleH/2){
    if(speedX >0){  //prevents bug that ball hits corner and gets stuck inside paddle
      speedX = -speedX;  //invert X speed direction
    }//end inner if
  }//end outer if
}//end paddleHit()

void paddleBoundary(){
  //LEFT
  if(paddleLeftY - paddleH/2 - 1< 0){ // needs -1 or else it gets stuck
    paddleLeftY += paddleS;
  }
  if(paddleLeftY + paddleH/2 + 1> height){ //needs -1 or else it gets stuck
    paddleLeftY -= paddleS;
  }
  
  //RIGHT
  if(paddleRightY - paddleH/2 - 1< 0){ // needs -1 or else it gets stuck
    paddleRightY += paddleS;
  }
  if(paddleRightY + paddleH/2 + 1> height){ //needs -1 or else it gets stuck
    paddleRightY -= paddleS;
  }
}//end paddleBoundary


void paddleMove(){ 
  //LEFT
  if(paddleLeftY < height-(paddleH/2) && paddleLeftY > paddleH/2){
    
    if(upLeft == true){
      paddleLeftY -= paddleS; //inverted + and - due to where centre in processing
    }
    
    if(downLeft == true){
      paddleLeftY += paddleS; //inverted + and - due to where centre in processing
    }
  }//end if
  
  
  //RIGHT
  if(paddleRightY < height-(paddleH/2) && paddleRightY > paddleH/2){
    
    if(upRight == true){
      paddleRightY -= paddleS; //inverted + and - due to where centre in processing
    }
    
    if(downRight == true){
      paddleRightY += paddleS; //inverted + and - due to where centre in processing
    }
  }//end if
}//end paddleMove


void drawBall(){
  fill(0,255,0);
  ellipse(x,y, w, w);
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
  
  
  if(y > width - w/2){
    speedY = - speedY;
  }//end if
  
  else if(y < 0 + w/2){
    speedY = -speedY;
  }//end else if
}//end ballBounce

void keyPressed(){
  //LEFT
  if(key == 'w' || key == 'W'){  //LEFT UP KEY PRESSED
    upLeft = true;
  }
  if(key == 's' || key == 'S'){  //LEFT DOWN KEY PRESSED
    downLeft = true;
  }
  
  //RIGHT
  if(key == 'i' || key == 'I'){  //RIGHT UP KEY PRESSED
    upRight = true;
  }
  if(key == 'k' || key == 'K'){  //RIGHT DOWN KEY PRESSED
    downRight = true;
  }
}//end keyPressed

void keyReleased(){
  //RIGHT
  if(key == 'w' || key == 'W'){  //LEFT UP KEY RELEASED
    upLeft = false;
  }
  if(key == 's' || key == 'S'){  //LEFT DOWN KEY RELEASED
    downLeft = false;
  }
  
  //LEFT
  if(key == 'i' || key == 'I'){  //RIGHT UP KEY RELEASED
    upRight = false;
  }
  if(key == 'k' || key == 'K'){  //RIGHT DOWN KEY RELEASED
    downRight = false;
  }
}//end keyReleased

void scores(){
  textSize(textsize);
  fill(255);
  text(scoreLeft, width*.25 -textsize/2, textY); 
  text(scoreRight,width*.75, textY); 
}
