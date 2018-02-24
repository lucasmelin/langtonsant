let grid = [];
let scale = 3;
let x, y, dir;

let ANTUP = 0;
let ANTRIGHT = 1;
let ANTDOWN = 2;
let ANTLEFT = 3;

let c = 0;

let sliderspeed;

function setup(){
  let canvas = createCanvas(floor(0.7*displayWidth), floor(0.7*displayHeight));
  canvas.parent('sketch');
  sliderspeed = createSlider(1, 500, 10);
  sliderspeed.position(screen.width * 0.5, (screen.height * 0.8) + 10)
  background(255);
  noStroke();
  colorMode(HSB);
  
  //  setup grid with all the values as 1
  for(let i = 0; i <floor(width/scale); i ++) {
    grid[i] = [];
    for(let j = 0; j < floor(height/scale); j++) {
      grid[i][j] = 1;
    }
  }
  
  // Position the ant
  x = floor(grid.length / 2);
  y = floor(grid[0].length / 2);
  dir = ANTUP;
  
}

function moveForward(){
  if (dir == ANTUP) {
    y--;
    if(y == -1){
      y = grid[0].length - 1;
    }
  }else if (dir == ANTRIGHT){
    x++;
    if (x == grid.length){
      x = 0;
    }
  }else if (dir == ANTDOWN){
    y++;
    if (y == grid[0].length){
      y = 0;
    }
  }else if (dir == ANTLEFT){
    x--;
    if (x == -1){
      x = grid.length - 1;
    }
  }
}

function draw(){
  c++;
  
  for (let n = 0; n < sliderspeed.value(); n++){
    let state = grid[x][y];
    
    if (state == 0){
      dir = (dir + 4 + 1) % 4;
      grid[x][y] = 1;
    }else if (state == 1){
      dir = (dir + 4 - 1) % 4;
      grid[x][y] = 0;
    }
    
    // Default color is white
    let col = 255;
    if (grid[x][y] == 1){
      // Cycle through colors
      if (c >= 256){
        c=0;
      }
      col = (c);
    }
    // Draw the over the location of the ant
    fill(col, 255, 255);
    rect(x * scale, y * scale, scale, scale);
    moveForward();
  }
}