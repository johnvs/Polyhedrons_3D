
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

  // The main structure of a ColorMap is an array of MapElements
  private MapElement[] colorMap;
  private MapElement randomWalker;

  ColorMap(int size) {
    colorMap = new MapElement[size];
    for (int i = 0; i < size; ++i) {
      colorMap[i] = new MapElement();
    }
  }

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

  public float getHue(int index) {
    return colorMap[i].getHue();
  }

  public void setHue(int index, float hue_) {
    colorMap[i].setHue(hue_);
  }

  public MapElement getElement(int index) {
    return colorMap[index];
  }

  public color getColor(int index) {
    return colorMap[index].getColor();
  }

  public void setColor(int index, float hue_, float sat_, float brt_) {
    colorMap[index].setColor(hue_, sat_, brt_);
  }

  public void incHue(int index) {
    colorMap[index].incHue();
  }

  public ColorMap getMap(int index) {
    return colorMap[index];
  }

  private void setMap(int index, ColorMap cM) {
    colorMap[index].setMap(cM);
  }

  public void spreadHueEvenly() {
   int hueTetra;
   for (int i = 0; i < colorMap.length; ++i) {
     // Distribute the full hue range evenly across all the faces
     hueTetra = (int) map(i, 0, myMap.length, 0 , HUE_MAX);
     println("colorMap[", i, "] hue = ", hueTetra);
     colorMap[i].setColor(hueTetra, SAT_MAX, BRT_MAX);
     //colorMap[i].setHue(hueTetra);
     //colorMap[i] = color(hueTetra, SAT_MAX, BRT_MAX);
   }
  }

  private void allOneColor(ColorMap cM) {
    for (int i = 0; i < colorMap.length; ++i) {
      //colorMap[i].setColor(cM.getHue(), cM.getSat(), cM.getBrt());
      colorMap[i].setMap(cM);
    }
  }

}
