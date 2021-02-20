class Chessboard {
  Piece[][] pieces;
  color [][] spotColor = new color[8][8];
  Chessboard() {
    pieces = new Piece[8][8];
    //creates all pieces in the formation of a starting chess board
    pieces[0][0] = new Piece("rook", "black", blackRook);
    pieces[1][0] = new Piece("knight", "black", blackKnight);
    pieces[2][0] = new Piece("bishop", "black", blackBishop);
    pieces[3][0] = new Piece("queen", "black", blackQueen);
    pieces[4][0] = new Piece("king", "black", blackKing);
    pieces[5][0] = new Piece("bishop", "black", blackBishop);
    pieces[6][0] = new Piece("knight", "black", blackKnight);
    pieces[7][0] = new Piece("rook", "black", blackRook);
    for (int i = 0; i < 8; i++) {
      pieces[i][1] = new Piece("pawn", "black", blackPawn);
    }

    pieces[0][7] = new Piece("rook", "white", whiteRook);
    pieces[1][7] = new Piece("knight", "white", whiteKnight);
    pieces[2][7] = new Piece("bishop", "white", whiteBishop);
    pieces[3][7] = new Piece("queen", "white", whiteQueen);
    pieces[4][7] = new Piece("king", "white", whiteKing);
    pieces[5][7] = new Piece("bishop", "white", whiteBishop);
    pieces[6][7] = new Piece("knight", "white", whiteKnight);
    pieces[7][7] = new Piece("rook", "white", whiteRook);
    for (int i = 0; i < 8; i++) {
      pieces[i][6] = new Piece("pawn", "white", whitePawn);
    }

    //setting up alternating color pattern
    instantiateColors();

  }
  void drawBoard() {
    int yInd = 0;
    //loops through the board, draws each square, and then draws the pieces on each square
    for (int i = 100; i <= 625; i+= 75) {
      //offset color pattern each new line
      int xInd = 0;
      for (int j = 100; j <= 625; j+=75) {
        //draw square
        fill(spotColor[xInd][yInd]);
        square(j, i, 75);
        //draw piece
        if (pieces[xInd][yInd] != null) {
          pieces[xInd][yInd].show(j, i);
        }
        xInd++;
      }
      yInd++;
    }
  }
  void instantiateColors() {
    int counter = 0;
    for (int i = 0; i < 8; i++) {
      counter++;
      for (int j = 0; j < 8; j++) {
        if (counter %2 == 0) {
          spotColor[i][j] = color(128, 81, 34);
        } else {
          spotColor[i][j] = color(219, 183, 147);
        }
        counter++;
      }
    }
  }
}

Chessboard board;
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

String boardState = "IDLE";
Piece pieceToBeMoved;
void setup() {
  size(800, 800);
  blackRook = loadImage("/assets/pieces/black_rook.png");
  blackKnight = loadImage("/assets/pieces/black_knight.png");
  blackBishop = loadImage("/assets/pieces/black_bishop.png");
  blackQueen = loadImage("/assets/pieces/black_queen.png");
  blackKing = loadImage("/assets/pieces/black_king.png");
  blackPawn = loadImage("/assets/pieces/black_pawn.png");

  whiteRook = loadImage("/assets/pieces/white_rook.png");
  whiteKnight = loadImage("/assets/pieces/white_knight.png");
  whiteBishop = loadImage("/assets/pieces/white_bishop.png");
  whiteQueen = loadImage("/assets/pieces/white_queen.png");
  whiteKing = loadImage("/assets/pieces/white_king.png");
  whitePawn = loadImage("/assets/pieces/white_pawn.png");
  board = new Chessboard();
}

void draw() {
  background(50);
  board.drawBoard();

  //board.pieces[][].method()
}

void mouseClicked()
{
  int indexX;
  int indexY;
  if (mouseX < 900 && mouseX > 100 && mouseY < 900 && mouseY > 100 && boardState.equals("MOVING") == false)
  {

    indexX = round((mouseX-100)/75); // find the X index that was clicked
    indexY = round((mouseY-100)/75); // find the Y index that was clicked
    print(indexY);
    print(indexX);
    if(board.pieces[indexX][indexY] == null) return;
    board.pieces[indexX][indexY].toBeMoved = true;
    board.pieces[indexX][indexY].drawPattern(indexX, indexY);
    boardState = "MOVING";      // set the board state to MOVING
  } else if (mouseX < 900 && mouseX > 100 && mouseY < 900 && mouseY > 100 && boardState.equals("MOVING") == true)
  { 
    indexX = round((mouseX-100)/75); // find the X index that was clicked
    indexY = round((mouseY-100)/75); // find the Y index that was clicked
    for (int row = 0; row < 8; row++)
    {
      for (int column = 0; column < 8; column++)
      {
        if (board.pieces[row][column] != null)
        {
          if (board.pieces[row][column].toBeMoved == true)
          {
            if (board.pieces[indexX][indexY] == null || board.pieces[indexX][indexY].col != board.pieces[row][column].col) {
              board.pieces[indexX][indexY] = board.pieces[row][column];
              board.pieces[indexX][indexY].toBeMoved = false;
              board.pieces[row][column] = null;
              board.instantiateColors();
            }
          }
        }
      }
    }
    boardState = "IDLE";      // set the board state to MOVING
  }
}
