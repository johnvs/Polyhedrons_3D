
class MapElement {
  float myHue;
  float mySat;
  float myBrt;
  float myAlpha;
  color myColor;

  MapElement() {
    // Create new blank elements as red
    setColor(Colors.WHITE);
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

  private void setColor(color color_) {
    myColor = color_;
    myHue = round(hue(myColor));
    mySat = saturation(myColor);
    myBrt = brightness(myColor);
  }

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
    myColor = color(myHue, mySat, myBrt, myAlpha);
  }

  // Add the given amount to the given hue, accounting for overflow
  // i.e. 250 + 12 = 6 and 5 - 10 = 251
  // @param theHue - the original hue value
  // @param delta - the amount by which to change the hue
  // @returns the new value
  public color getNewHue(float delta) {
    // Return White if delta is too small or large
    if ((delta >= -Colors.HUE_MAX) && (delta <= Colors.HUE_MAX)) {
      myHue += delta;

      if      (myHue > Colors.HUE_MAX) { myHue -= (Colors.HUE_MAX + 1); }
      else if (myHue < Colors.HUE_MIN) { myHue += (Colors.HUE_MAX + 1); }

      myColor = color(myHue, mySat, myBrt);

    } else {
      myColor = Colors.WHITE;
    }

    return myColor;
  }

  // Increment the hue value, keeping it in the range of 0 - 255
  private color incHue() {
    // Round the returned value because of an error in the calculation.
    // float fHue = round(hue(myColor));
    // int iHue = (int)fHue;
    // println("Old hue (float, int) = ", fHue, ", ", iHue);

    if (myHue < Colors.HUE_MAX) {
      ++myHue;
    } else {
      myHue = Colors.HUE_MIN;
    }
    myColor = color(myHue, mySat, myBrt);

    return myColor;
  }

}
