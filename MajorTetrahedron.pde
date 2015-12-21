
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
 
    tetrahedron 1
      face  vC
      0     2, 10, 9
      1     10, 12, 9
      2     12, 2, 9
 
    tetrahedron 2
      face  vC
      0     1, 12, 8
      1     12, 11, 8
      2     11, 1, 8
 
    tetrahedron 3
      face  vC
      0     1, 3, 0
      1     3, 2, 0
      2     2, 1, 0
*/
   

class MajorTetrahedron {
  private final int NUM_TETRAS = 4;
  private Tetrahedron[] tetrahedrons = new Tetrahedron[NUM_TETRAS];

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

  MajorTetrahedron(int tetraNum, VertexCoords vertexCoords) {
    
    if (vertexCoords != null) {
      //vertexCoords = vC;
      println("MT: vertexCoords is not null");
    } else {
      println("MT: vertexCoords is null");
    }
    
    PVector[] verticies = new PVector[3];
    Face[] faces = new Face[3];

    if (tetraNum == 0) {
      // Create the minor tretrahedrons for the upward facing major tetrahedron
      for (int i = 0; i < NUM_TETRAS; ++i) {
        for (int j = 0; j < faces.length; ++j) {
          for (int k = 0; k < verticies.length; ++k) {
            
            PVector temp = vertexCoords.getCoords(vertexGroup[i][j][k]);
            verticies[k] = new PVector(temp.x, temp.y, temp.z);

          }
          faces[j] = new Face(verticies);
        }
        tetrahedrons[i] = new Tetrahedron(faces);
      }

    } else if (tetraNum == 1) {
      // Create the minor tretrahedrons for the downward facing major tetrahedron
      for (int i = 0; i < NUM_TETRAS; ++i) {
        for (int j = 0; j < faces.length; ++j) {
          for (int k = 0; k < verticies.length; ++k) {
            
            println("MT: getCoords index indices: ", i+4, ", ", j, ", ", k);
            PVector temp = vertexCoords.getCoords(vertexGroup[i+4][j][k]);
            verticies[k] = new PVector(temp.x, temp.y, temp.z);

          }
          faces[j] = new Face(verticies);
        }
        tetrahedrons[i] = new Tetrahedron(faces);
      }
        
    }
  }
  
  public void drawMT() {
    for (int i = 0; i < NUM_TETRAS; ++i) {
      tetrahedrons[i].drawTetra();
    }
  }
 
}