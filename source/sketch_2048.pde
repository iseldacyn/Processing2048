PFont font;
boolean lose;
int score, best;
Grid grid;


//Set up vars
void setup(){
  size(650,750);
  grid = new Grid();
  strokeWeight(0);
  font = createFont("Clear Sans Bold", 100);
  textFont(font);
  lose = false;
  score = 0;
  newEmptySquare(grid);
  newEmptySquare(grid);
}


//Run 2048
void draw(){
  if(score > best) best = score;
  background(#F9F5E4);
  textAlign(LEFT, BASELINE);
  
  init();
  
  //Print Blocks on Screen
  for(int i=0;i<grid.sqr.size();i++){ grid.sqr.get(i).display(); }
  
  if(lose) gameover();
  
  checkBlocks();
}


//Move blocks when the key is pressed
void keyPressed(){
  //Disable keyboard input when game over
  if(lose){
    return;
  }
  if(key == 'w'){
    moveBlocks('u');
  }
  if(key == 'a'){
    moveBlocks('l');
  }
  if(key == 's'){
    moveBlocks('d');
  }
  if(key == 'd'){
    moveBlocks('r');
  }
}


//Retry and New game buttons
void mousePressed(){
  if(mouseX > 475 && mouseY > 90 && mouseX < 600 && mouseY < 140){
    score = 0;
    setup();
  }
  if(lose && mouseX > 250 && mouseY > 420 && mouseX < 420 && mouseY < 470){
    score = 0;
    setup();
  }
}
