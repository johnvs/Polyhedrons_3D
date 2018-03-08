// Visual Content Generator

class VisConGen {

  private ArrayList<Layer> layers;
  private Face[] faces;

  private long previousTime;            // the time in millis of the last color change

  private int prevFrameCount = 0;
  private int delayFrameCount = 2;

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

  VisConGen(Face[] faces_) {
    final int PATTERN_0 = 0;

    layers = new ArrayList<Layer>();

    // faces = new Face[faces_.length];
    faces = faces_;

    Layer newLayer = new Layer(faces.length, PATTERN_0);  // Params: numfaces = the size of buffer in pixels
                                                          //         patterNum = Specifies which pattern to load
    layers.add(newLayer);
  }

  public void setFaces(Face[] faces_) {
    faces = faces_;
  }

  public Face[] getFaces() {
    return faces;
  }

  public void setPattern(int p) {
    layers.get(0).setPattern(p);
  }

  // Update the color map
  public void update() {

    // Use delay to control speed of color update
    if (frameCount > prevFrameCount + delayFrameCount) {
      prevFrameCount = frameCount;

      for (Layer layer : layers) {
        layer.update();
      }

      // Integrate the colorMaps of all layers
      color[] colorMap = integrateLayers();

      // load color map into face color array
      for (int i = 0; i < faces.length; ++i) {
        // println("Hue[", i, "] = ", hue(colorMap[i]));
        faces[i].setColor(colorMap[i]);
      }
    }
  }

  private color[] integrateLayers() {
    // Temp solution
    return layers.get(0).getMyColors();
  }

}
