

class Face {
  private color faceColor;
  private PVector[] verticies;
  //private PVector normal;

  //Face(int v1, int v2, int v3) {
  Face(PVector[] iVerticies) {
    verticies = new PVector[3];
  
    verticies[0].x = iVerticies[0].x;
    verticies[0].y = iVerticies[0].y;
    verticies[0].z = iVerticies[0].z;

    verticies[1].x = iVerticies[1].x;
    verticies[1].y = iVerticies[1].y;
    verticies[1].z = iVerticies[1].z;

    verticies[2].x = iVerticies[2].x;
    verticies[2].y = iVerticies[2].y;
    verticies[2].z = iVerticies[2].z;

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