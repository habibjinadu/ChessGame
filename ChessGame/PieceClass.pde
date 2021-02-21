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
    } else if (this.type == "queen")
    {
      drawQueenPattern(indexX, indexY);
    } else if (this.type == "bishop")
    {
      drawBishopPattern(indexX, indexY);
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

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if ( i == indexY || j == indexX || indexY - i == indexX - j || indexY-i == j - indexX) {
          if (!(i == indexY && j == indexX)) {
            board.spotColor[j][i] = color(115, 252, 3);
          }
        }
      }
    }
  }
  
  void drawBishopPattern(int indexX, int indexY) {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (indexY - i == indexX - j || indexY-i == j - indexX) {
          if (!(i == indexY && j == indexX)) {
            board.spotColor[j][i] = color(115, 252, 3);
          }
        }
      }
    }
  }
  
  void drawRookPattern(int indexX, int indexY) {
    
  }
}

void drawKnightPattern(int indexX, int indexY)
{
  if (indexX < 7)
  {
    if (indexY > 1)
    {
      board.spotColor[indexX + 1][indexY - 2 ] = color(115, 252, 3);
    }
    if (indexY < 6)
    {
      board.spotColor[indexX + 1][indexY + 2 ] = color(115, 252, 3);
    }
  }
  
  if (indexX > 0)
  {
    if (indexY < 6)
    {
      board.spotColor[indexX - 1][indexY + 2 ] = color(115, 252, 3);
    }
    
    if (indexY > 1)
    {
      board.spotColor[indexX - 1][indexY - 2 ] = color(115, 252, 3);
    }
  
  }
  
  if (indexY > 0)
  {
    if (indexX > 1)
    {
    board.spotColor[indexX - 2][indexY - 1 ] = color(115, 252, 3);
    }
    if (indexX < 6)
    {
    board.spotColor[indexX + 2][indexY - 1 ] = color(115, 252, 3);
    }
  }
  
  if (indexY < 7)
  {
    if (indexX > 1)
    {
      board.spotColor[indexX - 2][indexY + 1 ] = color(115, 252, 3);
    }
    if (indexX < 6)
    {
      board.spotColor[indexX + 2][indexY + 1 ] = color(115, 252, 3);
    }
  }
}
