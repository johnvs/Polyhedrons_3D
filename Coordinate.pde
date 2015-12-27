
class Coordinate {
  
  PVector pV;
  
  Coordinate(float x_, float y_, float z_) {
    pV = new PVector();
    pV.x = x_;
    pV.y = y_;
    pV.z = z_;
  }
  
  public PVector getCoord() {
    return pV;
  }
  
}