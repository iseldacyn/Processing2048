//Blocks displayed to screen
class Block{
  int x, y, num;
  boolean isEmpty, notCombined;
  
  //Constructors
  Block(int X, int Y){x=X;y=Y;num=0;isEmpty=true;notCombined=true;}
  Block(Block a, int NUM, boolean bool){x=a.x;y=a.y;num=NUM;isEmpty=false;notCombined=bool;}
  Block(Block a, int NUM){x=a.x;y=a.y;num=NUM;isEmpty=false;notCombined=a.notCombined;}
  Block(Block a){
    x=a.x; y=a.y;
    if(int(random(500)) > 450)
      num = 4;
    else num = 2;
    isEmpty = false;
    notCombined = true;
  }
  
  //Display the block to the screen
  void display(){
    if(num==0) return;
    fill(num*623%255,num*875%255,num*567%255);
    rect(x,y,125,125,5);
    if(num<8) fill(#776E65);
    else fill(255);
    textAlign(CENTER, CENTER);
    textSize(62);
    text(num,x+62,y+50);
  }
  
  //For removing blocks from screen
  void removeNum(){
    num=0;
    isEmpty=true;
  }
  
};


//Grid of grid.sqr on screen
//0->3 top row
class Grid{
  ArrayList<Block> sqr = new ArrayList<Block>();
  int b=160;
  Grid(){
    for(int i=0;i<4;i++){
      int a=60;
      for(int j=0;j<4;j++){
        sqr.add(new Block(a,b));
        a+=135;
      }
      b+=135;
    }
  }
};
