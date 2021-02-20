class Chessboard {
  Piece[][] pieces;
  Chessboard() {
    pieces = new Piece[8][8];
    pieces[0][0] = new Piece("rook", "black", loadImage("/assets/pieces/black_rook.png"), 0, 0);
    pieces[0][1] = new Piece("knight", "black", loadImage("/assets/pieces/black_knight.png"), 0, 1);
  }
  void drawBoard() {
    int counter = 0;
    for (int i = 100; i <= 625; i+= 75) {
      counter++;
      for (int j = 100; j <= 625; j+=75) {
        if (counter%2 == 1) {
          fill(128, 81, 34);
        } else {
          fill(219, 183, 147);
        }
        square(j, i, 75);
        counter++;
      }
    }
  }
}

Chessboard board = new Chessboard();
void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  board.drawBoard();
  //board.pieces[][].method()
}
