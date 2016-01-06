
static class Colors {

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

}
