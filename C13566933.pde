int x, y, w, h, speed;

void setup(){
  size(500,500);
  
  x=width/2;
  y=height/2;
  w=50;
  h=50;
  speed=1;
}

void draw(){
  background(0);
  fill(0,255,0);
  ellipse(x,y, w, h);
  
  x = x + speed;
}
