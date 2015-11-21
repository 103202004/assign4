final int GAME_START1 = 0, GAME_START2 = 1, GAME_RUN = 2, GAME_OVER = 3;
int gameState;
PImage bg1Img, bg2Img, enemyImg, fighterImg, hpImg, treasureImg, GAME_START1Img, GAME_START2Img, GAME_OVER1Img, GAME_OVER2Img;
int hpW;
int treasureX, treasureY;
int [] eX = new int [5];
int [] eY = new int [5];
int [] eP2X = new int [5];
int [] eP2Y = new int [5];
int [] eP3X = new int [3];
int [] eP3Y = new int [3];
int enemyX, enemyY;
int enemyP2X, enemyP2Y;
int enemyP3X, enemyP3Y;

int bg1X, bg2X;
int fighterX, fighterY;

int speed = 5;   //fighter speed
int enemySpeedY = 2;  // enemySpeedY

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  size(640,480) ;  // must use this size.
  gameState = GAME_START1;  //gameState
  
  GAME_START1Img = loadImage("img/start2.png"); 
  GAME_START2Img = loadImage("img/start1.png");
  GAME_OVER1Img = loadImage("img/end2.png"); 
  GAME_OVER2Img = loadImage("img/end1.png");
  bg1Img = loadImage("img/bg1.png");
  bg2Img = loadImage("img/bg2.png");
  enemyImg = loadImage("img/enemy.png");
  fighterImg = loadImage("img/fighter.png");
  hpImg = loadImage("img/hp.png");
  treasureImg = loadImage("img/treasure.png");   //img
  
  hpW = 40;  //hp
  
  treasureX = floor(random(0,600));
  treasureY = floor(random(0,450));   //treasure
  
  enemyX = 0;   
  enemyY = floor(random(0,400));   //enemy
  eX[0] = enemyX;
  eY[0] = enemyY;
  enemyP2X = -840;
  enemyP2Y = floor(random(0,225));
  eP2X[0] = enemyP2X;
  eP2Y[0] = enemyP2Y;
  enemyP3X = -1680;
  enemyP3Y = floor(random(160,320));
  eP3X[0] = enemyP2X;
  eP3Y[0] = enemyP2Y;
  
  bg1X = 0;
  bg2X = 0;   //background
  
  fighterX = 590;
  fighterY = 240;   //fighter
    
  }  
  // your code

void draw() {
 
  switch(gameState){
    
   //game over 
   case GAME_OVER:
   if(mouseX > 206 && mouseX < 424){
   if(mouseY > 312 && mouseY < 345){
   }   
   if(mousePressed){
   // click
   gameState = GAME_RUN;
   }else{
   image(GAME_OVER2Img,0,0); 
   }      
   }
   image(GAME_OVER1Img,0,0);
   if(mouseX > 206 && mouseX < 424){
   if(mouseY > 312 && mouseY < 345){
   image(GAME_OVER2Img,0,0);
   }
   }   
   break;
   
   //game run
   case GAME_RUN:
   //fighter move
   if(upPressed){
    fighterY -= speed;
   }
   if(downPressed){
    fighterY += speed;
   }
   if(leftPressed){
    fighterX -= speed;
  }
  if(rightPressed){
    fighterX += speed;
  }                         
  
  //Boundary detection
  if (fighterX < 0 ){
    fighterX = 0;
  }
  if (fighterX > 590 ){
    fighterX = 590;
  }
  if (fighterY < 0 ){
    fighterY = 0;
  }
  if (fighterY > 430 ){
    fighterY = 430;
  }
  
 /* // enemy move
  if(enemyY > fighterY){
  enemyY = enemyY - enemySpeedY;
  }
  if(enemyY == enemyY - enemySpeedY){
    enemyY = fighterY;
  }
  if(enemyY < fighterY){
  enemyY = enemyY + enemySpeedY;
  }
  if(enemyY == enemyY + enemySpeedY){
  enemyY = fighterY;
  } */


/*
  //hit enemy
  for(int i = 0 ; i < 5 ; i++){
  if(fighterX < eX[i]+60 && fighterX > eX[i]-50 ){
  if(fighterY < eY[i]+50 && fighterY > eY[i]-50 ){
  eX[i] = 0;   
  eY[i] = 0;
  image(enemyImg,enemyX,enemyY);
  image(enemyImg,treasureX,treasureY);
  //hpW -= 40;
  if(hpW <= 0){
  gameState = GAME_OVER;
  }
  }
  }
  } */
  
  //hit treasure
  if(fighterX <= treasureX+25 && fighterX >= treasureX-25 ){
  if(fighterY <= treasureY+25 && fighterY >= treasureY-25 ){
  treasureX = floor(random(0,600));
  treasureY = floor(random(0,450));
  image(treasureImg,treasureX,treasureY);
  hpW += 20;
  if(hpW >= 200){
  hpW = 200;
  }
  }
  }
  
  enemyX+=5;
  enemyX%=2550;   //enemy
  enemyP2X+=5;
  enemyP2X%=2550;
  enemyP3X+=5;
  enemyP3X%=2550;  
  
  if(enemyX >= 2540){
  enemyY = floor(random(0,400));
  }
  
  if(enemyP2X >= 1690){
  enemyP2Y = floor(random(0,225));
  }
  
  if(enemyP3X >= 850){
  enemyP3Y = floor(random(160,320));
  } 
  
  bg1X++;
  bg1X%=1280;
  bg2X++;
  bg2X%=1280;   //background
  
  image(bg1Img,bg1X,0);
  image(bg2Img,-640+bg2X,0);
  image(bg1Img,-1280+bg1X,0);
    
  image(enemyImg,enemyX,enemyY);
  image(fighterImg,fighterX,fighterY);
  fill(255,0,0);
  rect(5,3,hpW,27);   //hp
  image(hpImg,0,0);
  image(treasureImg,treasureX,treasureY);   //img  

  //play again
  if(gameState == GAME_OVER){
    hpW = 40;
    treasureX = floor(random(0,600));
    treasureY = floor(random(0,450));
    fighterX = 590;
    fighterY = 240;
  }  
  
  for(int i = 0 ; i < 5 ; i++){
     eX[i] = enemyX-60*i;
     eY[i] = enemyY;
    image(enemyImg,eX[i],eY[i]);
  }
  
  
  for(int i = 0 ; i < 5 ; i++){
     eP2X[i] = enemyP2X-50*i;
     eP2Y[i] = enemyP2Y+50*i;
    image(enemyImg,eP2X[i],eP2Y[i]);
  }
  
  for(int i = 0 ; i < 3 ; i++){
    eP3X[i] = enemyP3X-50*i;
    eP3Y[i] = enemyP3Y-50*i;
    image(enemyImg,eP3X[i],eP3Y[i]);
    eP3Y[i] = enemyP3Y+50*i;
    image(enemyImg,eP3X[i],eP3Y[i]);
    eP3X[0] = enemyP3X-200;
    eP3X[i] = eP3X[0]+50*i;
    eP3Y[i] = enemyP3Y-50*i;
    image(enemyImg,eP3X[i],eP3Y[i]);
    eP3Y[i] = enemyP3Y+50*i;
    image(enemyImg,eP3X[i],eP3Y[i]);
  }
    
  break;
  
  // game start
  case GAME_START1:
    image(GAME_START1Img,0,0);   //show message
    if(mouseX > 206 && mouseX < 446){
    if(mouseY > 379 && mouseY < 413){
    if(mousePressed){
    // click
    gameState = GAME_RUN;
    }else{
    image(GAME_START2Img,0,0);
    break;
    }
    }
    }    
  }
}
  
// fighter keyPressed  
void keyPressed(){
  if(key == CODED){
     switch(keyCode){
       case UP:
       upPressed = true;
       break;
       case DOWN:
       downPressed = true;
       break;
       case LEFT:
       leftPressed = true;
       break;
       case RIGHT:
       rightPressed = true;
       break;
  }
  }
}
  
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
       upPressed = false;
       break;
       case DOWN:
       downPressed = false;
       break;
       case LEFT:
       leftPressed = false;
       break;
       case RIGHT:
       rightPressed = false;
       break;
  }
  }
}
