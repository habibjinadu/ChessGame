class Chessboard {
  Piece[][] pieces;
  Chessboard() {
    pieces = new Piece[8][8];
    pieces[0][0] = new Piece("rook", "black", blackRook);
    pieces[0][1] = new Piece("knight", "black", blackKnight);
    pieces[0][2] = new Piece("bishop", "black", blackBishop);
    pieces[0][3] = new Piece("queen", "black", blackQueen);
    pieces[0][4] = new Piece("king", "black", blackKing);
    pieces[0][5] = new Piece("bishop", "black", blackBishop);
    pieces[0][6] = new Piece("knight", "black", blackKnight);
    pieces[0][7] = new Piece("rook", "black", blackRook);
    for (int i = 0; i < 8; i++) {
      pieces[1][i] = new Piece("pawn", "black", blackPawn);
    }

    pieces[7][0] = new Piece("rook", "white", whiteRook);
    pieces[7][1] = new Piece("knight", "white", whiteKnight);
    pieces[7][2] = new Piece("bishop", "white", whiteBishop);
    pieces[7][3] = new Piece("queen", "white", whiteQueen);
    pieces[7][4] = new Piece("king", "white", whiteKing);
    pieces[7][5] = new Piece("bishop", "white", whiteBishop);
    pieces[7][6] = new Piece("knight", "white", whiteKnight);
    pieces[7][7] = new Piece("rook", "white", whiteRook);
    for (int i = 0; i < 8; i++) {
      pieces[6][i] = new Piece("pawn", "white", whitePawn);
    }
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
PImage blackRook;
PImage blackKnight;
PImage blackBishop;
PImage blackQueen;
PImage blackKing;
PImage blackPawn;

PImage whiteRook;
PImage whiteKnight;
PImage whiteBishop;
PImage whiteQueen;
PImage whiteKing;
PImage whitePawn;

void setup() {
  size(800, 800);
  blackRook = loadImage("black_rook.png");
  blackKnight = loadImage("black_knight.png");
  blackBishop = loadImage("black_bishop.png");
  blackQueen = loadImage("black_queen.png");
  blackKing = loadImage("black_king.png");
  blackPawn = loadImage("black_pawn.png");

  whiteRook = loadImage("white_rook.png");
  whiteKnight = loadImage("white_knight.png");
  whiteBishop = loadImage("white_bishop.png");
  whiteQueen = loadImage("white_queen.png");
  whiteKing = loadImage("white_king.png");
  whitePawn = loadImage("white_pawn.png");
}

void draw() {
  background(50);
  board.drawBoard();
  //board.pieces[][].method()
}
