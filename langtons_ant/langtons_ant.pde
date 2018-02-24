
int[][] grid;
int x;
int y;
int dir;

final int ANTUP = 0;
final int ANTRIGHT = 1;
final int ANTDOWN = 2;
final int ANTLEFT = 3;

PImage ant;

int red = 0;
int green = 0;
int blue = 0;

void setup(){
  //size(400, 400);
  fullScreen();
  grid = new int[width][height];
  ant = createImage(width, height, RGB);
  ant.loadPixels();
  // Initialize the image to white
  for (int i = 0; i < ant.pixels.length; i++){
    ant.pixels[i] = color(255);
  }
  ant.updatePixels();
  
  x = width/2;
  y = height/2;
  
  dir = ANTUP;
  
 

}

// This allows for wrapping around
void turnRight(){
  dir++;
  if (dir > ANTLEFT){
    dir = ANTUP;
  }
}

// This allows for wrapping around
void turnLeft(){
  dir--;
  if (dir < ANTUP){
    dir = ANTLEFT;
  }
}

void moveForward(){
  if (dir == ANTUP) {
    y--;
  }else if (dir == ANTRIGHT){
    x++;
  }else if (dir == ANTDOWN){
    y++;
  }else if (dir == ANTLEFT){
    x--;
  }
  
  if (x > (width - 1)){
    x = 0;
  }else if (x < 0) {
    x = width - 1;
  }
  
  if (y > (height -1)){
    y = 0;
  }else if (y < 0) {
    y = (height - 1);
  }
  
  
}

void draw(){
  background(255);
  
  ant.loadPixels();
  
  for (int n = 0; n < 500; n++){
    int state = grid[x][y];
    
    if (state == 0){
      turnRight();
      grid[x][y] = 1;
    }else if (state == 1){
      turnLeft();
      grid[x][y] = 0;
    }
    
    color col = color(255);
    if (n % 3 == 0){
      red++;
      red = red % 255;
    }
    if (n % 2 == 0){
      green++;
      green = green % 255;
    }
    if (n % 1 == 0){
      blue++;
      blue = blue % 255;
    }
    if (grid[x][y] == 1){
      col = color(red, green, blue);
    }
    int pix = x + y * ant.width;
    ant.pixels[pix] = col;
    moveForward();
  }
  ant.updatePixels();
  
  image(ant,0,0);    
}