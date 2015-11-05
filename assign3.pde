//You should implement your assign2 here.
PImage bg1;
PImage bg2;
PImage fighter;
PImage enemy;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
int FX,FY;
int TX,TY;
int EX,EY,EXX;
int hpX;
int bg1x,bg2x;

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

final int GAMESTART=0;
final int GAMERUN=1;
final int GAMEOVER=2;
int gamestate;

int speed=4;

void setup () {
  size(640, 480) ;
  size(640,480) ;  
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
//bg 
  bg1x=0;
  bg2x=-640;
//fighter
  FX=580;
  FY=230;
// treasure
  TX=floor(random(600)+20);
  TY=floor(random(400)+20);
//enemy
  EX=0;
  EY=floor(random(400)+20);
//HP
  hpX=200;
 gamestate=GAMESTART;
}

void draw() {
  
  if(upPressed){
    if(FY<20){
      FY=FY;
    }else{
      FY=FY-speed;
    }
  }
  if(downPressed){
    if(FY>400){
      FY=FY;
    }else{
    FY=FY+speed;
    }
  }
  if(leftPressed){
    if(FX<20){
      FX=FX;
    }else{
    FX=FX-speed;
    }
  }
  if(rightPressed){
    if(FX>580){
      FX=FX;
    }else{
    FX=FX+speed;
    }
  }
  
  switch(gamestate){
    case GAMESTART:
      hpX=200;
      image(start2,0,0);
      if(mouseX>200&&mouseX<440&&mouseY>375&&mouseY<415){
        if(mousePressed){
          gamestate=GAMERUN;
        }else{
          image(start1,0,0);
          }
      }
      break;
      
    case GAMERUN:
      //BG
      bg1x=bg1x+2;
      bg2x=bg2x+2;
      if(bg1x==640){
        bg1x=-640;
      }
      if(bg2x==640){
        bg2x=-640;
      }
      image(bg1,bg1x,0);
      image(bg2,bg2x,0);
      //fighter
      image(fighter,FX,FY);
      
      //treasure
      image(treasure,TX,TY);      
     
      //enemy
      EX=EX+3;
      /*
      if(EY>FY){
      EY=EY-2;
      }
      if(EY<FY){
      EY=EY+2;
      }
      */
      EXX=EX;
      
      for(int x=0;x<5;x=x+1){ 
      image(enemy,EXX,EY);
      EXX=EXX-80;
      }
      
      if(EX>=1000){
        EX=0;
        EY=floor(random(440))+20;
      }      
      //HP
      rect(25,23,hpX,20);
      fill(#ff0000);
      image(hp,20,20);
      /*
      //HIT enemy
      if(FX>=EX-50&&FX<=EX+50&&FY>=EY-50&&FY<=EY+50){
        hpX=hpX-40;
        EX=0;
        EY=floor(random(480));   
        image(enemy,EX,EY);
      }
      
      //HIT treasure  
      if(TX>=FX-50&&TX<=FX+50&&TY>=FY-50&&TY<=FY+50){
        if(hpX<200){
          hpX=hpX+20;
        }
       TX=floor(random(600)+20);
       TY=floor(random(400)+20);
       image(treasure,TX,TY);
      }
      */
      //DIE
      if(hpX<=0){
        gamestate=GAMEOVER;
      }
    break;
    
    case GAMEOVER:
      image(end2,0,0);
      if(mouseX>200&&mouseX<440&&mouseY>300&&mouseY<350){
          if(mousePressed){
            gamestate=GAMESTART;
          }else{
            image(end1,0,0);
            }
        }
    break;
  }
 
}
void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
       upPressed=true;
       break;      
      case DOWN:
       downPressed=true;
       break;            
      case LEFT:
       leftPressed=true;
       break;      
      case RIGHT:
       rightPressed=true;
       break;  
    }
  }
}
void keyReleased(){
  if(key==CODED){
      switch(keyCode){
        case UP:
         upPressed=false;
         break;      
        case DOWN:
         downPressed=false;
         break;            
        case LEFT:
         leftPressed=false;
         break;      
        case RIGHT:
         rightPressed=false;
         break;  
      }
    }
 }
