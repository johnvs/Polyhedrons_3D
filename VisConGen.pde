

class VisConGen {
  private final int MAX_HUE = 255;
  private final int MAX_SAT = 255;
  private final int MAX_BRT = 255;
  
  // A color array with a color for each face of the shape
  private color[] colorMap;
  private int[] patternMap;
  private int patternId;
  
          //Face 1: 0, 8, 9
          //Face 2: 1, 4, 7
          //Face 3: 2, 3, 10
          //Face 4: 5, 6, 11
          //Face 5: 12, 20, 21
          //Face 6: 13, 16, 19
          //Face 7: 14, 15, 22
          //Face 8: 17, 18, 23
          
          //Pair 1:  0, 12
          //Pair 2:  1, 21
          //Pair 3:  2, 20
          //Pair 4:  3, 18
          //Pair 5:  4, 23
          //Pair 6:  5, 17
          //Pair 7:  6, 15
          //Pair 8:  7, 22
          //Pair 9:  8, 14
          //Pair 10: 9, 13
          //Pair 11: 10, 19
          //Pair 12: 11, 16


//                                   1  1
//     0  1  2  3  4  5  6  7  8  9  0  1

//     1  1  1  1  1  1  1  1  2  2  2  2
//     2  3  4  5  6  7  8  9  0  1  2  3 

  private int[][] patterns = 
    {
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
       2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},

      {1, 2, 3, 3, 2, 4, 4, 2, 1, 1, 3, 4,
       5, 6, 7, 7, 6, 8, 8, 6, 5, 5, 7, 8},
       
      {1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
       1, 10,  9,  7, 12,  6,  4, 11,  3,  2,  8,  5}
    };
  
  VisConGen(int numFaces) {
    colorMap = new color[numFaces];
    patternId = 0;
    //patternMap = new int[numFaces];
    
    int hueTetra = 0;
    
    for (int i = 0; i < numFaces; ++i) {
      // Initialize the color map. Map the full hue 
      // range evenly across all the faces
      hueTetra = (int) map(i, 0, numFaces, 0 , MAX_HUE);
      colorMap[i] = color(hueTetra, MAX_SAT, MAX_BRT);
    }
  }
  
  public void initColorMap(int pattern) {
    int hueTetra = 0;
    
    if (pattern == 0) {
      for (int i = 0; i < colorMap.length; ++i) {
        // Initialize the color map. Map the full hue 
        // range evenly across all the faces
        hueTetra = (int) map(i, 0, colorMap.length, 0 , MAX_HUE);
        colorMap[i] = color(hueTetra, MAX_SAT, MAX_BRT);
      }
    } else if (pattern == 1) {
      for (int i = 0; i < colorMap.length; ++i) {
        if (patternMap[i] == 1) {
          colorMap[i] = color(0, MAX_SAT, MAX_BRT);      // 1 => 0 , 2 => 128
        } else if (patternMap[i] == 2) {
          colorMap[i] = color(128, MAX_SAT, MAX_BRT);
        }
      }
    } else if (pattern == 2) {
      for (int i = 0; i < colorMap.length; ++i) {
        // Spread the hue range across eight intervals
        int hueInc = 256/8;
        colorMap[i] = color((patternMap[i] - 1) * hueInc, MAX_SAT, MAX_BRT);
      }
    } else if (pattern == 3) {
      for (int i = 0; i < colorMap.length; ++i) {
        // Spread the hue range across eight intervals
        int hueInc = 256/12;
        colorMap[i] = color((patternMap[i] - 1) * hueInc, MAX_SAT, MAX_BRT);
      }
    }
  }
  
  public void setPattern(int p) {
    patternId = p;
    patternMap = patterns[p];
    initColorMap(p);
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