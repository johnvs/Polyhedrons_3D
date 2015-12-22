

class VisConGen {
  private final int NUM_TETRAS = 8;
  private final int NUM_FACES = 3;
  private final int MAX_HUE = 255;
  private final int MAX_SAT = 255;
  private final int MAX_BRT = 255;
  
  // A color array with a color for each face of the shape
  color[][] colorMap = new color[NUM_TETRAS][NUM_FACES];
  
  VisConGen() {
    //int hueInc = MAX_HUE / (NUM_TETRAS * NUM_FACES);
    int hueTetra = 0;
    final int TOTAL_FACE_CNT = NUM_FACES * NUM_TETRAS;
    
    for (int i = 0; i < NUM_TETRAS; ++i) {
      for (int j = 0; j < NUM_FACES; ++j) {
        // Initialize the color map
        // Map the full hue range evenly across all the faces
        hueTetra = (int) map((i*NUM_FACES + j), 0, TOTAL_FACE_CNT, 0 , MAX_HUE);
        colorMap[i][j] = color(hueTetra, MAX_SAT, MAX_BRT);
      }
    }
  }
  
  // Update the color map
  public color[][] update() {
    for (int i = 0; i < NUM_TETRAS; ++i) {
      for (int j = 0; j < NUM_FACES; ++j) {
        colorMap[i][j] = incHue(colorMap[i][j]); 
      }
    }
    return colorMap;
  }
  
  // Increment the hue value, keeping it in the range of 0 - 255
  public color incHue(color iColor) {
    float iHue = hue(iColor);

    if (iHue < MAX_HUE) {
      ++iHue;
    } else {
      iHue = 0;
    }
    return color(iHue, saturation(iColor), brightness(iColor));
  }
}