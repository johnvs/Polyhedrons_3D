

public class Layer {

  final int INTERVALS_2  = 2;
  final int INTERVALS_8  = 8;
  final int INTERVALS_12 = 12;
  final int INTERVALS_24 = 24;

  private int numFaces;
  private int patternNum;
  private int[] patternMap;
  private ColorMap colorMap;

  // private boolean isRandomWalk = false;
  // private int randomWalkIndex = 0;
  // //private color randonWalkClr = CLR_RED;
  // // private ColorMap randonWalkClr;
  // private long randomWalkDelay = 250;   // number of millis of delay

  // Create the randomWalker Layer
  //colorMap.randonWalkClr = new ColorMap(CLR_RED);
  // randonWalkClr = new ColorMap(Colors.CLR_RED);
  //randonWalkClr.setMap(CLR_RED.getMap());

// public void setRandomWalk(boolean rW) {
//   isRandomWalk = rW;
// }
//
// public boolean isRandomWalk() {
//   return isRandomWalk;
// }

  private int[][] patterns =
    {
      { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,
       12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23 },

      { 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1 },

      { 0,  1,  2,  2,  1,  3,  3,  1,  0,  0,  2,  3,
        4,  5,  6,  6,  5,  7,  7,  5,  4,  4,  6,  7 },

      { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11,
        0,  9,  8,  6, 11,  5,  3, 10,  2,  1,  7,  4 },

      { 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
        1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1 }
    };

  Layer(int nF, int patNum) {
    numFaces = nF;

    patternNum = patNum;
    patternMap = patterns[patNum];

    colorMap = new ColorMap(numFaces);
    colorMap.spreadHueEvenly(INTERVALS_24, patternMap);
  }

  public void setPattern(int p) {

    if (patternNum != p) {

      patternNum = p;
      patternMap = patterns[p];

      switch (p) {
        case 0:
          // Spread the hue range across 24 intervals
          colorMap.spreadHueEvenly(INTERVALS_24, patternMap);
          break;
        case 1: {
          // Spread the hue range across two intervals
          // (the two major tetrahedrons)
          colorMap.spreadHueEvenly(INTERVALS_2, patternMap);
          break;
        }
        case 2: {
          // Spread the hue range across eight intervals
          // (the eight minor tetrahedrons)
          colorMap.spreadHueEvenly(INTERVALS_8, patternMap);
          break;
        }
        case 3: {
          // Spread the hue range across 12 intervals
          // (the 12 pairs of faces)
          colorMap.spreadHueEvenly(INTERVALS_12, patternMap);
          break;
        }
        case 4:
          // Setup randomWalker
          // isRandomWalk = true;
          // randomWalkIndex = 0;
          // randonWalkClr.setColor(CLR_RED.getHue(), CLR_RED.getSat(), CLR_RED.getBrt());
          // previousTime = millis() - randomWalkDelay;   // This will make it fire the next time through update
          //allOneColor(CLR_WHITE.getHue(), CLR_WHITE.getSat(), CLR_WHITE.getBrt());
          colorMap.allOneColor(Colors.WHITE);
          break;
      }
    }
  }

  public void update() {

    for (int i = 0; i < numFaces; ++i) {
      // print("Old hue[", i, "] = ", colorMap.getHue(i));
      colorMap.incHue(i);
      // println(", New hue = ", colorMap.getHue(i));

      // if (isRandomWalk) {
      //   randonWalkClr.incHue();
      //   if (i == randomWalkIndex) {
      //     if (millis() > previousTime + randomWalkDelay) {
      //       previousTime = millis();
      //
      //       // Make the current face white and invert the next face
      //       colorMap.setMap(i, white); // was Colors.CLR_WHITE
      //       myColors[i] = Colors.CLR_WHITE.getColor();
      //
      //       // Find one of the current face's neighbors to become the next step in the random walk
      //       ArrayList<Integer> neighbors = faces[i].getNeighbors();
      //       //print("neighbors.size() = ", neighbors.size());
      //       int newNeighbor = (int)(random(neighbors.size())) - 1;
      //       //println(" , new neightbor = ", newNeighbor);
      //       randomWalkIndex = neighbors.get(newNeighbor);
      //       colorMap.setMap(randomWalkIndex, randonWalkClr.getMap());
      //       myColors[randomWalkIndex] = randonWalkClr.getColor();
      //     }
      //   }
      // }

      // println("myColors (RGB) ", i, " = ", red(myColors[i]), green(myColors[i]), blue(myColors[i]));
    }
  }

  public color[] getMyColors() {
    // Make a copy of the array to return

    color[] myColors = new color[numFaces];
    myColors = colorMap.getColors();

    return myColors;
  }

}
