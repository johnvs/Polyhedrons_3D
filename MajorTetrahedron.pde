

class MajorTetrahedron {
  private Tetrahedron[] tetrahedrons;
  
  //private static int edgeLength;
  //private static int edgeLengthHalf;
  //private static  float radius1;
  //private static  float radius2;
  //private static  float hgt;
  //private static  float hgtHalf;
  //private static  float hgtThreeHalfs;

  //private static PVector[] vertexCoords;     // Stores the coordinates of all the verticies
  //private static final int NUM_VERTICIES = 14;
  
  MajorTetrahedron(int tetraNum, int edgeLen) {
    tetrahedrons = new Tetrahedron[4];
    
    for (int i = 0; i < tetrahedrons.length; ++i) {
      tetrahedrons[i] = new Tetrahedron();
    }
    
  }
  
  public static void init(int edgeLen) {

    //edgeLength = edgeLen;
    //edgeLengthHalf = edgeLength/2;
    //radius1 = edgeLength / (2*sqrt(3));
    //radius2 = edgeLength / sqrt(3);
    //hgt = edgeLength * sqrt(2.0 / 3.0);
    //hgtHalf = hgt/2.0;
    //hgtThreeHalfs = hgtHalf * 3.0;
    //println("radius1 = ", radius1);
    //println("radius2 = ", radius2);
    //println("hgt = ", hgt);

    //vertexCoords = new PVector[NUM_VERTICIES];
    //for (int i = 0; i < vertexCoords.length; ++i) {
    // vertexCoords[i] = new PVector();
    //}
    //setupVerticies();
    
    if (tetraNum == 0) {
      // Fill the tretrahedrons for the upward facing major tetrahedron
      
    } else if (tetraNum == 1) {
      // Fill the tretrahedrons for the downward facing major tetrahedron
      
    }
    
    
    for (int i = 0; i < tetrahedrons.length; ++i) {
      //tetrahedrons[i]
    }

    
  }

  
}