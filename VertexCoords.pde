
/***************************************
 Star Tetrahedron Vertex Layout
 
             (8)
             

             
  (4)        (1)          (5)
             
      (11)          (12)
             
           (0)(13)

      (3)           (2)

  (7)        (10)         (9)
             
             
             
             (6)
 ***************************************/

class VertexCoords {

  private int edgeLength;
  private int edgeLengthHalf;
  private  float radius1;
  private  float radius2Minor;
  private  float radius2Major;
  private  float hgt;
  private  float hgtHalf;
  private  float hgtThreeHalves;

  private final int NUM_VERTICIES = 14;
  private PVector[] vertexCoords = new PVector[NUM_VERTICIES];  // Stores the coordinates of all the verticies

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  VertexCoords(int edgeLen) {

    edgeLength = edgeLen;                   // 1.0
    edgeLengthHalf = edgeLength/2;          // 0.5
    radius1 = edgeLength / (2*sqrt(3));     // 0.288 675 134
    radius2Minor = edgeLength / sqrt(3);    // 0.577 350 269
    radius2Major = 2 * radius2Minor;        // 1.154 700 538
    hgt = edgeLength * sqrt(2.0 / 3.0);     // 0.816 496 580
    hgtHalf = hgt/2.0;                      // 0.408 248 290
    hgtThreeHalves = 3.0 * hgtHalf;         // 1.224 744 871
    //println("radius1 = ", radius1);
    //println("radius2 = ", radius2);
    //println("hgt = ", hgt);

    setupVerticies();      // Fill the array with the appropriate coordinates
  }
  
  public PVector getCoords(int index) {
    //println("VC: vertexCoords size = ", vertexCoords.length);
    //println("VC: index = ", index);
    return vertexCoords[index];
  }

  private void setupVerticies() {  
     vertexCoords[0] =  new PVector(            0.0,           0.0,  hgtThreeHalves); 
     vertexCoords[1] =  new PVector(            0.0, -radius2Minor,         hgtHalf); 
     vertexCoords[2] =  new PVector( edgeLengthHalf,       radius1,         hgtHalf); 
     vertexCoords[3] =  new PVector(-edgeLengthHalf,       radius1,         hgtHalf); 
     vertexCoords[4] =  new PVector(    -edgeLength, -radius2Minor,         hgtHalf); 
     vertexCoords[5] =  new PVector(     edgeLength, -radius2Minor,         hgtHalf); 
     vertexCoords[6] =  new PVector(            0.0,  radius2Major,         hgtHalf); 
     vertexCoords[7] =  new PVector(    -edgeLength,  radius2Minor,        -hgtHalf); 
     vertexCoords[8] =  new PVector(            0.0, -radius2Major,        -hgtHalf); 
     vertexCoords[9] =  new PVector(     edgeLength,  radius2Minor,        -hgtHalf); 
     vertexCoords[10] = new PVector(            0.0,  radius2Minor,        -hgtHalf); 
     vertexCoords[11] = new PVector(-edgeLengthHalf,      -radius1,        -hgtHalf); 
     vertexCoords[12] = new PVector( edgeLengthHalf,      -radius1,        -hgtHalf); 
     vertexCoords[13] = new PVector(            0.0,           0.0, -hgtThreeHalves); 
   }

}