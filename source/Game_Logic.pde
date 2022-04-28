//Check if a square on the grid is empty
//If empty, place a new square there
void newEmptySquare(Grid a){
    int b = int(random(16));
    while(!a.sqr.get(b).isEmpty){
      b = int(random(16));
    }
    a.sqr.set(a.sqr.indexOf(a.sqr.get(b)), new Block(a.sqr.get(b)));
}


//Sets all blocks in grid to combinable
void combinable(){
  for(int i=0;i<grid.sqr.size();i++) grid.sqr.get(i).notCombined = true;
}


//Move blocks on screen based off of key pressed
void moveBlocks(char a){
  combinable();
  boolean notMoved = true;
  switch(a){
    //Up
    case('u'):
      //Cycle from row 2 to 4
      for(int i=4;i<16;i++){
        if(grid.sqr.get(i).isEmpty) continue;
        //Check for all blocks above it
        for(int n=1;n<4;n++){
          if(i-4*n>=0){
            //If empty, move up one
            if(grid.sqr.get(i-4*n).isEmpty){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i-4*n)), new Block(grid.sqr.get(i-4*n), grid.sqr.get(i-4*(n-1)).num)); 
              grid.sqr.get(i-4*(n-1)).removeNum();
              notMoved = false;
            }
            //If not empty, check if numbers match and add
            else if((grid.sqr.get(i-4*n).num == grid.sqr.get(i-4*(n-1)).num) && (grid.sqr.get(i-4*n).notCombined && grid.sqr.get(i-4*(n-1)).notCombined)){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i-4*n)), new Block(grid.sqr.get(i-4*n), grid.sqr.get(i-4*n).num*2, false));
              score += grid.sqr.get(i-4*n).num;
              grid.sqr.get(i-4*(n-1)).removeNum();
              notMoved = false;
            }
            else break;
          }
        }
      }
      if(notMoved) return;
      newEmptySquare(grid);
      break;
      
    //Left
    case('l'):
      //Cycle from col 2 to 4
      for(int i=1;i<16;i++){
        if((i%4 == 0) || (grid.sqr.get(i).isEmpty))continue;
        for(int n=1;n<4;n++){
          if(n<=i%4){
            //If empty, move left one
            if(grid.sqr.get(i-n).isEmpty){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i-n)), new Block(grid.sqr.get(i-n), grid.sqr.get(i-n+1).num));
              grid.sqr.get(i-n+1).removeNum();
              notMoved = false;
            }
            //If not empty, check if numbers match and add
            else if((grid.sqr.get(i-n).num == grid.sqr.get(i-n+1).num) && (grid.sqr.get(i-n).notCombined && grid.sqr.get(i-n+1).notCombined)){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i-n)), new Block(grid.sqr.get(i-n), grid.sqr.get(i-n).num*2, false));
              score += grid.sqr.get(i-n).num;
              grid.sqr.get(i-n+1).removeNum();
              notMoved = false;
            }
            else break;
          }
        }
      }
      if(notMoved) return;
      newEmptySquare(grid);
      break;
      
    //Down
    case('d'):
      //Cycle from row 4 to 2
      for(int i=11;i>-1;i--){
        if(grid.sqr.get(i).isEmpty) continue;
        //Check for all blocks below it
        for(int n=1;n<4;n++){
          if(i+4*n<=15){
            //If empty, move down one
            if(grid.sqr.get(i+4*n).isEmpty){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i+4*n)), new Block(grid.sqr.get(i+4*n), grid.sqr.get(i+4*(n-1)).num)); 
              grid.sqr.get(i+4*(n-1)).removeNum();
              notMoved = false;
            }
            //If not empty, check if numbers match and add
            else if((grid.sqr.get(i+4*n).num == grid.sqr.get(i+4*(n-1)).num) && (grid.sqr.get(i+4*n).notCombined && grid.sqr.get(i+4*(n-1)).notCombined)){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i+4*n)), new Block(grid.sqr.get(i+4*n), grid.sqr.get(i+4*n).num*2, false));
              score += grid.sqr.get(i+4*n).num;
              grid.sqr.get(i+4*(n-1)).removeNum();
              notMoved = false;
            }
            else break;
          }
        }
      }
      if(notMoved) return;
      newEmptySquare(grid);
      break;
    
    //Right
    case('r'):
      //Cycle from col 3 to 1
      for(int i=14;i>-1;i--){
        if((i%4==3) || (grid.sqr.get(i).isEmpty)) continue;
        //Check all blocks to the right of it
        for(int n=1;n<4;n++){
          if((4-n)>i%4){
            //If empty, move one right
            if(grid.sqr.get(i+n).isEmpty){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i+n)), new Block(grid.sqr.get(i+n), grid.sqr.get(i+n-1).num));
              grid.sqr.get(i+n-1).removeNum();
              notMoved = false;
            }
            //If not empty, check if numbers match and add
            else if((grid.sqr.get(i+n).num == grid.sqr.get(i+n-1).num) && (grid.sqr.get(i+n).notCombined && grid.sqr.get(i+n-1).notCombined)){
              grid.sqr.set(grid.sqr.indexOf(grid.sqr.get(i+n)), new Block(grid.sqr.get(i+n), grid.sqr.get(i+n).num*2, false));
              score += grid.sqr.get(i+n).num*2;
              grid.sqr.get(i+n-1).removeNum();
              notMoved = false;
            }
            else break;
          }
        }
      }
      if(notMoved) return;
      newEmptySquare(grid);
      break;
  }
}


//Check if there are no available moves
void checkBlocks(){
  int a=0;
  for(int i=0;i<16;i++){
    if(grid.sqr.get(i).isEmpty) continue;
    int num = grid.sqr.get(i).num;
    switch(i%4){
      //First col
      case(0):
        if(i<4){if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i+4).num)) a++;}
        else if(i>11){if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i-4).num)) a++;}
        else{if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i+4).num) && (num != grid.sqr.get(i-4).num)) a++;}
        break;
        
      //Last col
      case(3):
        if(i<4){if((num != grid.sqr.get(i-1).num) && (num != grid.sqr.get(i+4).num)) a++;}
        else if(i>11){if((num != grid.sqr.get(i-1).num)&& (num != grid.sqr.get(i-4).num)) a++;}
        else{if((num != grid.sqr.get(i-1).num) && (num != grid.sqr.get(i+4).num) && (num != grid.sqr.get(i-4).num)) a++;}
        break;
      
      //Middle cols
      default:
        if(i<4){if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i-1).num) && (num != grid.sqr.get(i+4).num)) a++;}
        else if(i>11){if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i-1).num) && (num != grid.sqr.get(i-4).num)) a++;}
        else{if((num != grid.sqr.get(i+1).num) && (num != grid.sqr.get(i-1).num) && (num != grid.sqr.get(i+4).num) && (num != grid.sqr.get(i-4).num)) a++;}
        break;
    }
  }
  if(a==16) lose=true;
}
