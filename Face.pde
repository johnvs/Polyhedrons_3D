

class Face {
  private PShape face;
  private color faceColor;
  //private PVector normal;

//Dir = (B - A) x (C - A)
//Norm = Dir / len(Dir)

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PShape iFace) {

    face = iFace;
  }
  
  public void setColor(color clr) {
    faceColor = clr;
  }
  
  public color getColor() {
    return faceColor;
  }
  
  public void drawFace() {
    face.setFill(faceColor);
    shape(face);
  }

  public void drawFace(color iFaceColor) {
    face.setFill(iFaceColor);
    shape(face);
  }

}