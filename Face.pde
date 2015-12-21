

class Face {
  private color faceColor;
  private PVector[] verticies;
  //private PVector normal;

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PVector[] iVerticies) {

    if (iVerticies.length == 3) {
      verticies = new PVector[3];

      for (int i = 0; i < verticies.length; ++i) {
        verticies[i] = new PVector(iVerticies[i].x, iVerticies[i].y, iVerticies[i].z);
      }
    } else {
      println("Face: incorrect number of verticies - ", iVerticies.length);
    }
  }
  
  public void setColor(color clr) {
    faceColor = clr;
  }
  
  public color getColor() {
    return faceColor;
  }
  
  public void drawFace() {
    fill(faceColor);

    beginShape();
    vertex(verticies[0].x, verticies[0].y, verticies[0].z);
    vertex(verticies[1].x, verticies[1].y, verticies[1].z);
    vertex(verticies[2].x, verticies[2].y, verticies[2].z);
    endShape();
  }

  public void drawFace(color iFaceColor) {
    fill(iFaceColor);

    beginShape();
    vertex(verticies[0].x, verticies[0].y, verticies[0].z);
    vertex(verticies[1].x, verticies[1].y, verticies[1].z);
    vertex(verticies[2].x, verticies[2].y, verticies[2].z);
    endShape();
  }
}