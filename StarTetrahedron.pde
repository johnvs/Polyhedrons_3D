
/*  
  Each major tetrahedron is composed of four small tetrahedrons.
    0, 1 and 2 make up the base, with 3 being the top.
  Each small tetrahedron is composed of three faces.
  Each face is composed of three verticies.
  
  Ex.
    tetrahedron 0
      face  vC
      0     3, 11, 7
      1     11, 10, 7
      2     10, 3, 7
*/

class StarTetrahedron {
  private int x;
  private int y;
  private int z;

  private float angleX = radians(60);   // PI/2;
  private float angleY = 0;
  private float angleZ = 0;  // PI/2;
  private float spin = 0.01;

  private final int NUM_MAJOR_TETRAS = 2;
  private final int NUM_MINOR_TETRAS = 4;
  private Tetrahedron[] tetrahedrons = new Tetrahedron[NUM_MAJOR_TETRAS * NUM_MINOR_TETRAS];

  private VertexCoords vertexCoords;
  
  private VisConGen jB;

  // These are the indicies of the vertex coordinates array.
  // Each row represents the three verticies each of the three faces each that 
  // make up one of eight minor tetrahedrons
  private int[][][] vertexGroup = {
                                    { { 3, 11,  7}, {11, 10,  7}, {10,  3,  7} },
                                    { { 2, 10,  9}, {10, 12,  9}, {12,  2,  9} }, 
                                    { { 1, 12,  8}, {12, 11,  8}, {11,  1,  8} },
                                    { { 1,  3,  0}, { 3,  2,  0}, { 2,  1,  0} }, 
                                    
                                    { {11,  3,  4}, { 3,  1,  4}, { 1, 11,  4} },
                                    { {12,  1,  5}, { 1,  2,  5}, { 2, 12,  5} },
                                    { {10,  2,  6}, { 2,  3,  6}, { 3, 10,  6} }, 
                                    { {10, 11, 13}, {11, 12, 13}, {12, 10, 13} }
                                  };
  StarTetrahedron(int xx, int yy, int zz, int edgeLen) {
    x = xx;
    y = yy;
    z = zz;
    
    // Calculate and store the coordinates of the shape's verticies
    vertexCoords = new VertexCoords(edgeLen);

    for (int m = 0; m < NUM_MAJOR_TETRAS; ++m) {
      // For each major tetrahedron
      PVector[] verticies = new PVector[3];
      Face[] faces = new Face[3];

      // Create the minor tretrahedrons 
      for (int i = 0; i < NUM_MINOR_TETRAS; ++i) {
        // For each minor tetrahedron
        for (int j = 0; j < faces.length; ++j) {
          // For each face
          for (int k = 0; k < verticies.length; ++k) {
            // Get the coordinates of the face's three verticies
            PVector temp = vertexCoords.getCoords(vertexGroup[i+(m*4)][j][k]);
            verticies[k] = new PVector(temp.x, temp.y, temp.z);
          }
          faces[j] = new Face(verticies);
        }
        tetrahedrons[i + (4 * m)] = new Tetrahedron(faces);
      }
    }

  }
  
  public void setColorMap(color[][] colorMap) {
    // load color map into face color array
    for (int i = 0; i < tetrahedrons.length; ++i) {
      tetrahedrons[i].setFaceColors(colorMap[i]);
    }
  }
  
  public void update() {
    angleZ += spin;
  }
  
  public void drawST() {
    
    pushMatrix();
    
    noStroke();
    //stroke(0);
    //noFill();
  
    translate(x, y, z);
  
    float angleXDeg = map(mouseY, height, 0, 0, 180);    // was PI/2
    float angleX = radians(angleXDeg);
    //rotateX(angleXRad);    // was PI/2
    //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
    //println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);
    rotateX(angleX);    // was PI/2
    rotateY(angleY);
    rotateZ(angleZ);    // was =PI/6
    
    for (int i = 0; i < tetrahedrons.length; ++i) {
      tetrahedrons[i].drawTetra();
    }
    
    popMatrix();
  }
  
}