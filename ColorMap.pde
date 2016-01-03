
class ColorMap {

  public static final int HUE_MIN = 0;
  public static final int HUE_MAX = 255;
  public static final int HUE_HALF = 127;
  public static final int SAT_MIN = 0;
  public static final int SAT_MAX = 255;
  public static final int BRT_MIN = 0;
  public static final int BRT_MAX = 255;

  //private final color CLR_WHITE = color(HUE_MIN, SAT_MIN, BRT_MAX);
  //private final color CLR_BLACK = color(HUE_MIN, SAT_MAX, BRT_MIN);
  //private final color CLR_RED   = color(HUE_MIN, SAT_MAX, BRT_MAX);

  public static final ColorMap WHITE = new ColorMap(HUE_MIN, SAT_MIN, BRT_MAX);
  public static final ColorMap BLACK = new ColorMap(HUE_MIN, SAT_MAX, BRT_MIN);
  public static final ColorMap RED   = new ColorMap(HUE_MIN, SAT_MAX, BRT_MAX);

  // The ColorMap is an array of MapElements
  MapElement[] clrMap;
  MapElement randomWalker;

  ColorMap(int size) {
    clrMap = new MapElement(size);
    for (int i = 0; i < size; ++i) {
      clrMap[i] = new MapElement();
    }
  }

/*
  ColorMap(ColorMap cM) {
    myHue = cM.myHue;
    mySat = cM.mySat;
    myBrt = cM.myBrt;
    myColor = color(myHue, mySat, myBrt);
  }

  ColorMap(float hue_, float sat_, float brt_) {
    myHue = hue_;
    mySat = sat_;
    myBrt = brt_;
    myColor = color(myHue, mySat, myBrt);
  }
*/
  public MapElement getElement(int index) {
    return clrMap[i];
  }

  public ColorMap getMap() {
    return this;
  }

  // private void setMap(ColorMap cM) {
  //   myHue = cM.myHue;
  //   mySat = cM.mySat;
  //   myBrt = cM.myBrt;
  //   myColor = color(myHue, mySat, myBrt);
  // }

  public void spreadHueEvenly() {
   int hueTetra;
   for (int i = 0; i < clrMap.length; ++i) {
     // Distribute the full hue range evenly across all the faces
     hueTetra = (int) map(i, 0, myMap.length, 0 , HUE_MAX);
     println("colorMap[", i, "] hue = ", hueTetra);
     clrMap[i].setColor(hueTetra, SAT_MAX, BRT_MAX);
     //colorMap[i].setHue(hueTetra);
     //colorMap[i] = color(hueTetra, SAT_MAX, BRT_MAX);
   }
  }

}
