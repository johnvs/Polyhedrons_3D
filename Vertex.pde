
class Vertex {
  
  PVector pV;
  
  Vertex(float x_, float y_, float z_) {
    pV = new PVector();
    pV.x = x_;
    pV.y = y_;
    pV.z = z_;
  }
  
  public PVector getMyVertex() {
    return pV;
  }
  
  public void setMyVertex(PVector pV_) {
    pV = pV_;
  }
  
  public void setMyVertex(float x_, float y_, float z_) {
    pV.x = x_;
    pV.y = y_;
    pV.z = z_;
  }
  
}