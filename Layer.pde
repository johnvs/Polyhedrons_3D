

public class Layer {
  private int numFaces;
  private int patternNum;
  private int[] patternMap;
  private ColorMap colorMap;

  Layer(int nF, int pN) {
    numfaces = nF;
    patternNum = pN;
    patternMap = VisConGen.patterns[pN];
    colorMap = new ColorMap(numFaces);

    }

  public void setPattern(int p) {
    if (patternNum != p) {

      patternNum = p;
      patternMap = patterns[p];

      switch (p) {
        case 0:
          spreadHueEvenly();
          isRandomWalk = false;
          break;
        case 1:
          // colorMap.setPattern(1);
          for (int i = 0; i < numFaces; ++i) {
            //println("patternMap size = ", patternMap.length, "index = ", i);
            if (patternMap[i] == 1) {
              colorMap.setHue(i, ColorMap.HUE_MIN);       // 1 => 0 , 2 => 128
            } else if (patternMap[i] == 2) {
              colorMap.setHue(i, ColorMap.HUE_HALF);
            }
          }
          isRandomWalk = false;
          break;
        case 2:
          // Spread the hue range across eight intervals
          int hueInc = (ColorMap.HUE_MAX + 1) / 8;
          for (int i = 0; i < numFaces; ++i) {
            colorMap.setHue(i, (patternMap[i] - 1) * hueInc);
          }
          isRandomWalk = false;
          break;
        case 3:
          // Spread the hue range across 12 intervals
          int hueInc = (ColorMap.HUE_MAX + 1) / 12;
          for (int i = 0; i < numFaces; ++i) {
            colorMap.setHue(i, (patternMap[i] - 1) * hueInc);
          }
          break;
        case 4:
          // Setup randomWalker
          isRandomWalk = true;
          randomWalkIndex = 0;
          randonWalkClr.setColor(CLR_RED.getHue(), CLR_RED.getSat(), CLR_RED.getBrt());
          previousTime = millis() - randomWalkDelay;   // This will make it fire the next time through update
          //allOneColor(CLR_WHITE.getHue(), CLR_WHITE.getSat(), CLR_WHITE.getBrt());
          allOneColor(ColorMap.CLR_WHITE);
          break;
      }
    }
  }


}
