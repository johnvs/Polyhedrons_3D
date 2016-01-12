

class Face {
  private PShape face;
  private color faceColor;
  private ArrayList<Integer> neighbors;
  private PVector faceCenter;
  private PVector faceNormal;

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PShape face_) {
    face = face_;
    neighbors = new ArrayList<Integer>();

    // calc face center and normal
    faceCenter = findFaceCenter();
    faceNormal = findFaceNormal();
  }

  private PVector findFaceCenter() {
    PVector center = new PVector();

    // calculate face center based on the face PShape
    // Temp
    center.x = 0;
    center.y = 0;

    return center;
  }

  private PVector findFaceNormal() {
    PVector normal = new PVector();

    // calculate face normal based on the face PShape
    //Dir = (B - A) x (C - A)
    //Norm = Dir / len(Dir)

    // Temp
    normal.x = 0;
    normal.y = 0;

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

  public void setColor(color color_) {
    faceColor = color_;
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
