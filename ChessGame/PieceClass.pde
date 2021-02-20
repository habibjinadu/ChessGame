class Piece 
{
  String type;
  int indexX;
  int indexY;
  PImage icon;
  String col;    // distinguishes if it is a black or white piece 
  
  
  
  Piece(String type, String col, String fileName, int indexX, int indexY)
  {
    this.type = type;
    this.indexX = indexX;
    this.indexY = indexY;
    this.col = col;
    this.icon = loadImage(fileName);    // load the image from the assets
  }
  
  void show(int xPosition, int yPosition)  // this function takes in an x and y position in the game board.
  {
    image(icon, xPosition, yPosition);
  }
  
