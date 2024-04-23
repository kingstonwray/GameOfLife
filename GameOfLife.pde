import de.bezier.guido.*;
int NUM_ROWS = 30;
int NUM_COLS = 30;
private Life[][] buttons; 
private Life[][] buffer; 
private boolean running = true; 

public void setup () {
  size(400, 400);
  frameRate(60);
  Interactive.make( this );


  buttons = new Life [NUM_ROWS] [NUM_COLS];
  for (int row = 0; row < NUM_ROWS; row++) {
    for ( int col = 0; col < NUM_COLS; col++) {
      buttons[row][col] = new Life(row, col);
    }
  }
  buffer = new Life[NUM_ROWS] [NUM_COLS];
  for (int row = 0; row < NUM_ROWS; row++) {
    for ( int col = 0; col < NUM_COLS; col++) {
      buffer[row][col] = buttons[row][col];
    }
  }
}

public void draw () {
  background( 0 );
  if (running == false)
    return;

  for (int row = 0; row < NUM_ROWS; row++) {
    for ( int col = 0; col < NUM_COLS; col++) {
      if (countNeighbors(row, col) == 3) {
        buffer[row][col].setLife(true);
      } else if (countNeighbors(row, col) == 2 && buttons[row][col].getLife()) {
        buffer[row][col].setLife(true);
      } else {
        buffer[row][col].setLife(false);
      }
      buttons[row][col].draw();
    }
  }
  copyFromBufferToButtons();
}

public void keyPressed() {
  if  (keyCode == 75) {
    for (int row = 0; row < NUM_ROWS; row++) {
      for ( int col = 0; col < NUM_COLS; col++) {
        buttons[row][col].setLife(false);
      }
    }
  } else {
    running = !running;
  }
}

public void copyFromBufferToButtons() {
  for (int row = 0; row < NUM_ROWS; row++) {
    for ( int col = 0; col < NUM_COLS; col++) {
      buttons[row][col] = new Life(row, col);
      buttons[row][col].setLife(buffer[row][col].getLife());
    }
  }
}

public void copyFromButtonsToBuffer() {
  for (int row = 0; row < NUM_ROWS; row++) {
    for ( int col = 0; col < NUM_COLS; col++) {
      buffer[row][col] = buttons[row][col];
    }
  }
}

public boolean isValid(int r, int c) {
  if (r<0||c<0) {
    return false;
  } else if (r>=NUM_ROWS||c>=NUM_COLS) {
    return false;
  } else {
    return true;
  }
}

public int countNeighbors(int row, int col) {
  int neighbors = 0;
  if (isValid(row-1, col) && buttons[row-1][col].getLife()) {
    neighbors++;
  }
  if (isValid(row-1, col-1) && buttons[row-1][col-1].getLife()) {
    neighbors++;
  }
  if (isValid(row-1, col+1) && buttons[row-1][col+1].getLife()) {
    neighbors++;
  }
  if (isValid(row, col-1) && buttons[row][col-1].getLife()) {
    neighbors++;
  }
  if (isValid(row, col+1) && buttons[row][col+1].getLife()) {
    neighbors++;
  }
  if (isValid(row+1, col-1) && buttons[row+1][col-1].getLife()) {
    neighbors++;
  }
  if (isValid(row+1, col) && buttons[row+1][col].getLife()) {
    neighbors++;
  }
  if (isValid(row+1, col+1) && buttons[row+1][col+1].getLife()) {
    neighbors++;
  }
  return neighbors;
}
