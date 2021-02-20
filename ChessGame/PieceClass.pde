class Piece 
{
  String type;
  //int indexX;
  //int indexY;
  PImage icon;
  String col;    // distinguishes if it is a black or white piece 
  boolean toBeMoved;


  Piece(String type, String col, PImage icon)
  {
    this.type = type;
    //this.indexX = indexX;
    //this.indexY = indexY;
    this.col = col;
    this.icon = icon;    // load the image from the assets
  }

  void show(int xPosition, int yPosition)  // this function takes in an x and y position in the game board.
  {
    image(icon, xPosition, yPosition);
  }

  //void movePiece(int indexX, int indexY)
  //{
  //  image(icon, xPosition, yPosition);
  //}

  String getType()
  {
    return this.type;
  }

  String getCol()
  {
    return this.col;
  }

  void drawPattern(int indexX, int indexY)
  {
    if (this.type == "pawn")
    {
      drawPawnPattern(indexX, indexY);
    }else if (this.type == "queen")
    {
      drawQueenPattern(indexX, indexY);
    }
  }

  void drawPawnPattern(int indexX, int indexY)

  {
    if (indexX > 0) {
      board.spotColor[indexX - 1][indexY] = color(115, 252, 3);
      if (indexY > 0) {
        board.spotColor[indexX - 1][indexY - 1] = color(115, 252, 3);
      }
      if (indexY < 7) {
        board.spotColor[indexX - 1][indexY + 1] = color(115, 252, 3);
      }
    }
    if (indexX < 7) {
      board.spotColor[indexX + 1][indexY] = color(115, 252, 3);
      if (indexY > 0) {
        board.spotColor[indexX + 1][indexY - 1] = color(115, 252, 3);
      }
      if (indexY < 7) {
        board.spotColor[indexX + 1][indexY + 1] = color(115, 252, 3);
      }
    }
    if (indexY > 0) {
      board.spotColor[indexX][indexY - 1] = color(115, 252, 3);
    }
    if (indexY < 7) {
      board.spotColor[indexX][indexY + 1] = color(115, 252, 3);
    }
  }
  
  void drawQueenPattern(int indexX, int indexY)
  {
    int rowOffsetDirection = 1;
    int columnOffsetDirection = 1;
    
    for (int currentOffset = 1; currentOffset < 8; currentOffset++ )
          {
              // make a current row position which is the queen row position plus an offset
              int currentRowPosition = indexY + rowOffsetDirection * currentOffset;
              
              // make a current column position which is the queen column position minus an offset
              int currentColumnPosition = indexX + columnOffsetDirection * currentOffset ;
  
              // if the current position is still on the board
              if (currentRowPosition > -1 && currentRowPosition < 8 
              &&  currentColumnPosition > -1 && currentColumnPosition < 8)
              {
                  board.spotColor[currentRowPosition][currentColumnPosition] = color(115, 252, 3);
              }
          }
  
  }
  
}
