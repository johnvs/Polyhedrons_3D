
class MapElement {
  float myHue;
  float mySat;
  float myBrt;
  float myAlpha;
  color myColor;

  MapElement() {
    // Create new blank elements as red
    setColor(ColorMap.HUE_MIN, ColorMap.SAT_MAX, ColorMap.BRT_MAX);
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

  private float getAlpha() {
    return myAlpha;
  }

  private void setAlpha(float alpha_) {
    myAlpha = alpha_;
    myColor = color(myAlpha, myHue, mySat, myBrt);
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
    // Return White if delta is too small or large
    if ((delta >= -ColorMap.HUE_MAX) && (delta <= ColorMap.HUE_MAX)) {
      myHue += delta;

      if      (myHue > ColorMap.HUE_MAX) { myHue -= (ColorMap.HUE_MAX + 1); }
      else if (myHue < ColorMap.HUE_MIN) { myHue += (ColorMap.HUE_MAX + 1); }

      return color(myHue, mySat, myBrt);
    } else {
      return ColorMap.CLR_WHITE.getColor();
    }
  }

  // Increment the hue value, keeping it in the range of 0 - 255
  private color incHue() {
    // Round the returned value because of an error in the calculation.
    // float fHue = round(hue(myColor));
    // int iHue = (int)fHue;
    // println("Old hue (float, int) = ", fHue, ", ", iHue);

    if (myHue < ColorMap.HUE_MAX) {
      ++myHue;
    } else {
      myHue = ColorMap.HUE_MIN;
    }
    color newColor = color(myHue, mySat, myBrt);
    //println("New hue = ", hue(newColor));
    return newColor;
  }

}
