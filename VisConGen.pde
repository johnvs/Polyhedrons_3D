

class VisConGen {
  private final int MAX_HUE = 255;
  private final int MAX_SAT = 255;
  private final int MAX_BRT = 255;
  
  // A color array with a color for each face of the shape
  private color[] colorMap;
  
  VisConGen(int numFaces) {
    colorMap = new color[numFaces];
    int hueTetra = 0;
    
    for (int i = 0; i < numFaces; ++i) {
      // Initialize the color map. Map the full hue 
      // range evenly across all the faces
      hueTetra = (int) map(i, 0, numFaces, 0 , MAX_HUE);
      colorMap[i] = color(hueTetra, MAX_SAT, MAX_BRT);
    }
  }
  
  // Update the color map
  public color[] update() {
    for (int i = 0; i < colorMap.length; ++i) {
        colorMap[i] = incHue(colorMap[i]); 
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