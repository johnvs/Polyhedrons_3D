
class ColorMap {

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
    // Set the size of the new color map to the provided color map
    colorMap = new MapElement[cM.getSize()];
    for (int i = 0; i < colorMap.length; ++i) {
      colorMap[i] = cM.getElement(i);
    }
  }

  public int getSize() {
    return colorMap.length;
  }

  public float getHue(int index) {
    return colorMap[index].getHue();
  }

  public void setHue(int index, float hue_) {
    colorMap[index].setHue(hue_);
  }

  public MapElement getElement(int index) {
    return colorMap[index];
  }

  public color getColor(int index) {
    return colorMap[index].getColor();
  }

  public color[] getColors() {
    color[] colors = new color[colorMap.length];
    for (int i = 0; i < colorMap.length; ++i) {
      colors[i] = colorMap[i].getColor();
    }
    return colors;
  }

  public void setColor(int index, float hue_, float sat_, float brt_) {
    colorMap[index].setColor(hue_, sat_, brt_);
  }

  public void incHue(int index) {
    colorMap[index].incHue();
  }

  public ColorMap getMap() {
    return this;
  }

  public void spreadHueEvenly(int numIntervals, int[] pattern) {
    // Spread the hue range across numIntervals intervals
    float myHue;
    float hueInc = (Colors.HUE_MAX + 1) / numIntervals;

    for (int i = 0; i < colorMap.length; ++i) {
      myHue = pattern[i] * hueInc;
      colorMap[i].setColor(myHue, Colors.SAT_MAX, Colors.BRT_MAX);
    }
  }

  private void allOneColor(color color_) {
    for (int i = 0; i < colorMap.length; ++i) {
      colorMap[i].setColor(color_);
    }
  }

}
