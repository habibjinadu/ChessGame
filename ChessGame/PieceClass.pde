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
    }
    
  }
  
  void drawPawnPattern(int indexX, int indexY)
  
  {
    if (indexX > 0 && indexX < 8 && indexY > 0 && indexY < 8)
    {
      board.spotColor[indexX - 1][indexY - 1] = color(115, 252, 3);
      board.spotColor[indexX][indexY - 1] = color(115, 252, 3);
      board.spotColor[indexX + 1][indexY - 1] = color(115, 252, 3);
      board.spotColor[indexX - 1][indexY] = color(115, 252, 3);
      board.spotColor[indexX + 1][indexY] = color(115, 252, 3);
      board.spotColor[indexX - 1][indexY + 1] = color(115, 252, 3);
      board.spotColor[indexX][indexY + 1] = color(115, 252, 3);
      board.spotColor[indexX + 1][indexY + 1] = color(115, 252, 3);
      board.spotColor[indexX + 1][indexY] = color(115, 252, 3);
      
    }
    
    
  }
}
