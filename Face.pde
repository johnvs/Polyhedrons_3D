

class Face {
  private PShape face;
  private color faceColor;
  private ArrayList<Integer> neighbors;
  //private PVector faceCenter;
  //private PVector normal;
  //Dir = (B - A) x (C - A)
  //Norm = Dir / len(Dir)

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PShape iFace) {
    face = iFace;
    neighbors = new ArrayList<Integer>();
  }

  public PVector getMyVertex(int index) {
    return face.getVertex(index);
  }

  public void addNeighbor(Integer neighbor) {
    neighbors.add(neighbor);
  }

  public ArrayList<Integer> getNeighbors() {
    return neighbors;
  }

  public void setColor(color clr) {
    faceColor = clr;
  }

  public color getColor() {
    return faceColor;
  }

  public int getNumVertices() {
    return face.getVertexCount();
  }

  public void drawFace() {
    face.setFill(faceColor);
    shape(face);
  }

  public void drawFace(color color_) {
    face.setFill(color_);
    shape(face);
  }

}
