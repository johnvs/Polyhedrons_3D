

class Face {
  private PShape face;
  private color faceColor;
  private ArrayList<Integer> neighbors;
  private PVector faceCenter;
  private PVector faceNormal;

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PShape iFace) {
    face = iFace;
    neighbors = new ArrayList<Integer>();
    // calc face center and normal
    faceCenter = findFaceCenter();
    faceNormal = findFaceNormal();
  }

  private PVector findFaceCenter() {
    // PVector center = ;
    return center;
  }

  private PVector findFaceNormal() {
    //Dir = (B - A) x (C - A)
    //Norm = Dir / len(Dir)
    // PVector normal = ;
    return normal;
  }

  public PVector getCenter() {
    return faceCenter;
  }

  public PVector getNormal() {
    return faceNormal;
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
