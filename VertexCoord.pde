
class VertexCoord {
  
  PVector pV;
  
  VertexCoord(float x_, float y_, float z_) {
    pV = new PVector();
    pV.x = x_;
    pV.y = y_;
    pV.z = z_;
  }
  
  public PVector getCoord() {
    return pV;
  }
  
  public void setCoord(PVector pV_) {
    pV = pV_;
  }
  
  public void setCoord(float x_, float y_, float z_) {
    pV.x = x_;
    pV.y = y_;
    pV.z = z_;
  }
  
}