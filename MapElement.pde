
class MapElement {
  float myHue;
  float mySat;
  float myBrt;
  color myColor;

  MapElement() {
    myHue = ColorMap.HUE_MIN;
    mySat = ColorMap.SAT_MAX;
    myBrt = ColorMap.BRT_MAX;
    setColor(ColorMap.HUE_MIN, ColorMap.SAT_MIN, ColorMap.BRT_MIN);
  }

  MapElement(float hue_, float sat_, float brt_) {
    setColor(hue_, sat_, brt_);
  }

  private color getColor() {
    return myColor;
  }

  private void setColor(float hue_, float sat_, float brt_) {
    myHue = hue_;
    mySat = sat_;
    myBrt = brt_;
    myColor = color(myHue, mySat, myBrt);
  }

  //private void setColor(color color_) {
  //  myColor = color_;
  //}

  private float getHue() {
    return myHue;
  }

  private void setHue(float hue_) {
    myHue = hue_;
    myColor = color(myHue, mySat, myBrt);
  }

  private float getSat() {
    return mySat;
  }

  private void setSat(float sat_) {
    mySat = sat_;
    myColor = color(myHue, mySat, myBrt);
  }

  private float getBrt() {
    return myBrt;
  }

  private void setBrt(float brt_) {
    myBrt = brt_;
    myColor = color(myHue, mySat, myBrt);
  }

  private ColorMap getMap() {
    return this;
  }

  private void setMap(ColorMap cM) {
    myHue = cM.myHue;
    mySat = cM.mySat;
    myBrt = cM.myBrt;
    myColor = color(myHue, mySat, myBrt);
  }

  // Add the given amount to the given hue, accounting for overflow
  // i.e. 250 + 12 = 6 and 5 - 10 = 251
  // @param theHue - the original hue value
  // @param delta - the amount by which to change the hue
  // @returns the new value
  public color getNewHue(float delta) {
    //float result;
    //float temp = myHue + delta;

    // Return White if delta is too small or large
    if ((delta >= -HUE_MAX) && (delta <= HUE_MAX)) {
      myHue += delta;

      if      (myHue > HUE_MAX) { myHue -= (HUE_MAX + 1); }
      else if (myHue < HUE_MIN) { myHue += (HUE_MAX + 1); }
      //else                     { result = myHue;                 }
      return color(myHue, mySat, myBrt);
    } else {
      return CLR_WHITE.getColor();
    }
  }

  // Increment the hue value, keeping it in the range of 0 - 255
  private color incHue() {
    //float fHue = hue(iColor);
    //int iHue = (int)fHue;
    //println("Old hue (float, int) = ", fHue, ", ", iHue);

    if (myHue < HUE_MAX) {
      ++myHue;
    } else {
      myHue = 0;
    }
    //return color(fHue, saturation(iColor), brightness(iColor));
    color newColor = color(myHue, mySat, myBrt);
    //println("New hue = ", hue(newColor));
    return newColor;

    //float fHue = hue(iColor);
    //int iHue = (int)hue(iColor);
    //int iSat = (int)saturation(iColor);
    //int iBrt = (int)brightness(iColor);
    //print("Old hue (float, int), sat and brt = ", fHue, ", ", iHue, ", ", iSat, ", ", iBrt);

    //if (iHue < HUE_MAX) {
    //  ++iHue;
    //} else {
    //  iHue = 0;
    //}
    //println(", new hue = ", iHue);
    //color newColor = color(iHue, saturation(iColor), brightness(iColor));
    //println("New hue, sat and brt = ", hue(newColor), ", ", saturation(newColor), ", ", brightness(newColor));
    //return newColor;
  }

}
