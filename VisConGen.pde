

class VisConGen {
/*
  private final int HUE_MIN = 0;
  private final int HUE_MAX = 255;
  private final int HUE_HALF = 127;
  private final int SAT_MIN = 0;
  private final int SAT_MAX = 255;
  private final int BRT_MIN = 0;
  private final int BRT_MAX = 255;

  //private final color CLR_WHITE = color(HUE_MIN, SAT_MIN, BRT_MAX);
  //private final color CLR_BLACK = color(HUE_MIN, SAT_MAX, BRT_MIN);
  //private final color CLR_RED   = color(HUE_MIN, SAT_MAX, BRT_MAX);

  private final ColorMap CLR_WHITE = new ColorMap(HUE_MIN, SAT_MIN, BRT_MAX);
  private final ColorMap CLR_BLACK = new ColorMap(HUE_MIN, SAT_MAX, BRT_MIN);
  private final ColorMap CLR_RED   = new ColorMap(HUE_MIN, SAT_MAX, BRT_MAX);
*/
  private boolean isRandomWalk = false;
  private int randomWalkIndex = 0;
  //private color randonWalkClr = CLR_RED;
  // private ColorMap randonWalkClr;
  private long randomWalkDelay = 250;   // number of millis of delay
  private long previousTime;            // the time in millis of the last color change

  // private ColorMap colorMap;
  // private int[] patternMap;
  // private int patternNum;

  private ArrayList<Layer> layers;

/*
  Thoughts on content generation
   Grouping faces
     1. The faces of the tetrahedrons of the upward and downward pointing major tetrahedrons, respectively.
         Upward:   0 - 11
         Downward: 12 - 23

          Face 1: 0, 8, 9
          Face 2: 1, 4, 7
          Face 3: 2, 3, 10
          Face 4: 5, 6, 11
          Face 5: 12, 20, 21
          Face 6: 13, 16, 19
          Face 7: 14, 15, 22
          Face 8: 17, 18, 23

          Pair 1:  0, 12
          Pair 2:  1, 21
          Pair 3:  2, 20
          Pair 4:  3, 18
          Pair 5:  4, 23
          Pair 6:  5, 17
          Pair 7:  6, 15
          Pair 8:  7, 22
          Pair 9:  8, 14
          Pair 10: 9, 13
          Pair 11: 10, 19
          Pair 12: 11, 16


                                     1  1
       0  1  2  3  4  5  6  7  8  9  0  1

       1  1  1  1  1  1  1  1  2  2  2  2
       2  3  4  5  6  7  8  9  0  1  2  3
*/

  private static int[][] patterns =
    {
      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},

      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
       2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},

      {1, 2, 3, 3, 2, 4, 4, 2, 1, 1, 3, 4,
       5, 6, 7, 7, 6, 8, 8, 6, 5, 5, 7, 8},

      {1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12,
       1, 10,  9,  7, 12,  6,  4, 11,  3,  2,  8,  5},

      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    };

  VisConGen(int numFaces) {
    //colorMap = new color[numFaces];
    Layer newLayer = new Layer(numFaces, 0);  // Params: numfaces = the size of buffer in pixels
                                              //         patterNum = Specifies which pattern to load
    newLayer.spreadHueEvenly();
    layers.add(newLayer);
    // colorMap = new ColorMap(numFaces);
    // colorMap.spreadHueEvenly();
    // patternNum = 0;
    // patternMap = patterns[0];
    //for (int i = 0; i < numFaces; ++i) {
    //  colorMap[i] = new ColorMap(CLR_RED);
    //}

    // Create the randomWalker Layer

    //colorMap.randonWalkClr = new ColorMap(CLR_RED);
    randonWalkClr = new ColorMap(ColorMap.CLR_RED);
    //randonWalkClr.setMap(CLR_RED.getMap());

  }

/*
  public void initColorMap(int pattern) {
    //int hueTetra = 0;

    if (pattern == 0) {
      spreadHueEvenly();
    } else if (pattern == 1) {
      for (int i = 0; i < colorMap.length; ++i) {
        if (patternMap[i] == 1) {
          colorMap[i] = color(0, SAT_MAX, BRT_MAX);      // 1 => 0 , 2 => 128
        } else if (patternMap[i] == 2) {
          colorMap[i] = color(128, SAT_MAX, BRT_MAX);
        }
      }
    } else if (pattern == 2) {
      for (int i = 0; i < colorMap.length; ++i) {
        // Spread the hue range across eight intervals
        int hueInc = 256/8;
        colorMap[i] = color((patternMap[i] - 1) * hueInc, SAT_MAX, BRT_MAX);
      }
    } else if (pattern == 3) {
      for (int i = 0; i < colorMap.length; ++i) {
        // Spread the hue range across eight intervals
        int hueInc = 256/12;
        colorMap[i] = color((patternMap[i] - 1) * hueInc, SAT_MAX, BRT_MAX);
      }
    }
  }
*/

  public void setRandomWalk(boolean rW) {
    isRandomWalk = rW;
  }

  public boolean isRandomWalk() {
    return isRandomWalk;
  }

  public void setPattern(int p) {

    layers[0].setPattern(p);

    // if (patternNum != p) {
    //
    //   patternNum = p;
    //   patternMap = patterns[p];
    //
    //   switch (p) {
    //     case 0:
    //       spreadHueEvenly();
    //       isRandomWalk = false;
    //       break;
    //     case 1:
    //       // colorMap.setPattern(1);
    //       for (int i = 0; i < numFaces; ++i) {
    //         //println("patternMap size = ", patternMap.length, "index = ", i);
    //         if (patternMap[i] == 1) {
    //           colorMap.setHue(i, ColorMap.HUE_MIN);       // 1 => 0 , 2 => 128
    //         } else if (patternMap[i] == 2) {
    //           colorMap.setHue(i, ColorMap.HUE_HALF);
    //         }
    //       }
    //       isRandomWalk = false;
    //       break;
    //     case 2:
    //       // Spread the hue range across eight intervals
    //       int hueInc = (ColorMap.HUE_MAX + 1) / 8;
    //       for (int i = 0; i < numFaces; ++i) {
    //         colorMap.setHue(i, (patternMap[i] - 1) * hueInc);
    //       }
    //       isRandomWalk = false;
    //       break;
    //     case 3:
    //       // Spread the hue range across 12 intervals
    //       int hueInc = (ColorMap.HUE_MAX + 1) / 12;
    //       for (int i = 0; i < numFaces; ++i) {
    //         colorMap.setHue(i, (patternMap[i] - 1) * hueInc);
    //       }
    //       break;
    //     case 4:
    //       // Setup randomWalker
    //       isRandomWalk = true;
    //       randomWalkIndex = 0;
    //       randonWalkClr.setColor(CLR_RED.getHue(), CLR_RED.getSat(), CLR_RED.getBrt());
    //       previousTime = millis() - randomWalkDelay;   // This will make it fire the next time through update
    //       //allOneColor(CLR_WHITE.getHue(), CLR_WHITE.getSat(), CLR_WHITE.getBrt());
    //       allOneColor(ColorMap.CLR_WHITE);
    //       break;
    //   }
    // }
  }

  // Update the color map
  public color[] update(Face[] faces) {
    color[] myColors = new color[numFaces];

    for (int i = 0; i < numFaces; ++i) {
      print("Old hue[", i, "] = ", colorMap.getHue(i));
      //colorMap[i] = incHue(colorMap[i]);
      colorMap.incHue(i);
      myColors[i] = colorMap.getColor(i);
      println(", New hue = ", colorMap[i].getHue());

      if (isRandomWalk) {
        randonWalkClr.incHue();
        if (i == randomWalkIndex) {
          if (millis() > previousTime + randomWalkDelay) {
            previousTime = millis();

            // Make the current face white and invert the next face
            colorMap.setMap(i, ColorMap.CLR_WHITE);
            myColors[i] = ColorMap.CLR_WHITE.getColor();

            // Find one of the current face's neighbors to become the next step in the random walk
            ArrayList<Integer> neighbors = faces[i].getNeighbors();
            //print("neighbors.size() = ", neighbors.size());
            int newNeighbor = (int)(random(neighbors.size())) - 1;
            //println(" , new neightbor = ", newNeighbor);
            randomWalkIndex = neighbors.get(newNeighbor);
            colorMap.setMap(randomWalkIndex, randonWalkClr.getMap());
            myColors[randomWalkIndex] = randonWalkClr.getColor();
          }
        }

      }
      println("myColors (RGB) ", i, " = ", red(myColors[i]), green(myColors[i]), blue(myColors[i]));
    }
    //return colorMap;
    return myColors;
  }

}
