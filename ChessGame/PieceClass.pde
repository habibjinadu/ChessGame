class Piece 
{
  String type;
  int indexX;
  int indexY;
  PImage icon;
<<<<<<< HEAD
  String col;
  
  
  
  Piece(String type, String col, PImage icon, int indexX, int indexY)
=======
  String col;    // distinguishes if it is a black or white piece 
  
  
  
  Piece(String type, String col, String fileName, int indexX, int indexY)
>>>>>>> c37d180e60a593c92a60b01316ac38deaff6ae60
  {
    this.type = type;
    this.indexX = indexX;
    this.indexY = indexY;
    this.col = col;
<<<<<<< HEAD
    this.icon = icon;
=======
    this.icon = loadImage(fileName);    // load the image from the assets
  }
  
  void show(int xPosition, int yPosition)  // this function takes in an x and y position in the game board.
  {
    image(icon, xPosition, yPosition);
>>>>>>> c37d180e60a593c92a60b01316ac38deaff6ae60
  }
  
  
}
