

class Tetrahedron {
  private final int NUM_FACES = 3;
  private Face[] faces = new Face[NUM_FACES];

  Tetrahedron () {
  }    
    
  Tetrahedron (Face[] iFaces) {
    if (iFaces.length == NUM_FACES) {
      for (int i = 0; i < NUM_FACES; ++i) {
        faces[i] = iFaces[i];
      }
    }
  }
  
  public void setFaces (Face[] iFaces) {
    if (faces != null) {
      for (int i = 0; i < NUM_FACES; ++i) {
        faces[i] = iFaces[i];
      }
    }
  }
  
  public void setFaceColors (color[] faceColors) {
    if (faceColors.length == NUM_FACES) {
      for (int i = 0; i < NUM_FACES; ++i) {
        faces[i].setColor(faceColors[i]);
      }
    }
  }
  
  public Face[] getFaces() {
    return faces;
  }
  
  public void updateTetra() {
  }
  
  public void drawTetra() {
    for (int i = 0; i < NUM_FACES; ++i) {
      faces[i].drawFace();
    }
  }
  
}