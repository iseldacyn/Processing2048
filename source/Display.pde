//Initialize background and UI
void init(){
  //2048 Title Text
  fill(#776E65);
  textSize(125);
  text("2048",75,125);
  
  //Boxes
  fill(#BBADA0);
  rect(400,20,100,50,5);
  rect(525,20,100,50,5);
  fill(#8F7A66);
  rect(475,90,150,50,5);
  
  //Text
  textSize(20);
  fill(#EEE4DA);
  textAlign(CENTER,CENTER);
  text("Score",450,30);
  text("Best",575,30);
  textSize(25);
  fill(255);
  text("New Game",550,110);
  textSize(30);
  text(score,450,50);
  text(best,575,50);
  
  //Background Tile
  fill(#BBADA0);
  rect(50, 150, 550, 550, 10);
  
  //Smaller Tiles
  fill(#CDC1B4);
  for(int i=60;i<600;i+=135){
    for(int j=160;j<700;j+=135){
      rect(i,j,125,125,5);
    }
  }
}


//Display when there are no more available moves
void gameover(){
  blend(50,150,550,550,50,150,550,550,HARD_LIGHT);
  textAlign(LEFT, BASELINE);
  fill(#776E65);
  text("Game Over!",175,370);
  fill(#8F7A66);
  rect(250,420,170,50,5);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Try Again",335,437);
}
