
class StarTetrahedron {
//  private final int EDGE_LENGTH = 50;
  private int x;
  private int y;
  private int z;

  private int edgeLength;
  private int edgeLengthHalf;
  private  float radius1;
  private  float radius2;
  private  float hgt;
  private  float hgtHalf;
  private  float hgtThreeHalves;
  
  //private int strutLength;
  private final int NUM_TETRAS = 2;
  private final int NUM_MAJOR_TETRAS = 2;
  private Octahedron octahedron;
  private Tetrahedron[] tetrahedron;
  private MajorTetrahedron[] majorTetrahedrons;
  private PVector[] vertexCoords;     // Stores the coordinates of all the verticies
  private final int NUM_VERTICIES = 14;
 
  StarTetrahedron(int xx, int yy, int zz, int edgeLen) {
    x = xx;
    y = yy;
    z = zz;
     
    edgeLength = edgeLen;
    edgeLengthHalf = edgeLength/2;
    radius1 = edgeLength / (2*sqrt(3));
    radius2 = edgeLength / sqrt(3);
    hgt = edgeLength * sqrt(2.0 / 3.0);
    hgtHalf = hgt/2.0;
    hgtThreeHalves = hgtHalf * 3.0;
    println("radius1 = ", radius1);
    println("radius2 = ", radius2);
    println("hgt = ", hgt);

    vertexCoords = new PVector[NUM_VERTICIES];
    for (int i = 0; i < vertexCoords.length; ++i) {
     vertexCoords[i] = new PVector();
    }

    majorTetrahedrons = new MajorTetrahedron[NUM_MAJOR_TETRAS];
    majorTetrahedrons[0] = new MajorTetrahedron(0, edgeLength);
    majorTetrahedrons[1] = new MajorTetrahedron(1, edgeLength);
    
    octahedron = new Octahedron(x, y, z, edgeLength);
    tetrahedron = new Tetrahedron[NUM_TETRAS];
    
    for (int i = 0; i < NUM_TETRAS; ++i) {
       //tetrahedron[i] = new Tetrahedron(0, 0, 0, strutLength); 
       tetrahedron[i] = new Tetrahedron(); 
    }
  }
  
  public void init() {
    Tetrahedron[] tetrahedrons = new Tetrahedron[4];
    Face[] faces = new Face[3];
    faces[0] = new Face();
    
  }
   
  public void update() {
    octahedron.update();
    for (int i = 0; i < NUM_TETRAS; ++i) {
       tetrahedron[i].updateTetra(); 
    }
  }
  
  public void drawST() {
    octahedron.drawOcta();

    for (int i = 0; i < NUM_TETRAS; ++i) {
      pushMatrix();
    
      noStroke();
  //    stroke(0);
  //    noFill();
  
      translate(width * 0.75, height/2, 0);
  
      float angleXDeg = map(mouseX, 0, width, 0, 90);    // was PI/2
      float angleXRad = radians(angleXDeg);
      rotateX(angleXRad);    // was PI/2
      //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
      //println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);
      //rotateX(angleX);    // was PI/2
      rotateY(0);
      rotateZ(0);    // was =PI/6
      
      tetrahedron[i].drawTetra(); 
      
      popMatrix();
    }
  }
  
  private void tetrahedronSetup() {

  //v1 = new PVector(40, 20);
  //v2 = new PVector(25, 50); 

  //ellipse(v1.x, v1.y, 12, 12);
  //ellipse(v2.x, v2.y, 12, 12);

    //vertex(-edgeLengthHalf,  radius1,       hgtHalf);
    //vertex(              0, -radius2,       hgtHalf);
    //vertex(              0,        0, hgt + hgtHalf);
    
    //vertex(              0, -radius2,       hgtHalf);
    //vertex( edgeLengthHalf,  radius1,       hgtHalf);
    //vertex(              0,        0, hgt + hgtHalf);
 
    //vertex( edgeLengthHalf, radius1,       hgtHalf);
    //vertex(-edgeLengthHalf, radius1,       hgtHalf);
    //vertex(              0,       0, hgt + hgtHalf);
  }
  
/*
  Star Tetrahedron Vertex Layout
  
             (8)
             

             
  (4)        (1)          (5)
             
      (11)          (12)
             
           (0)(13)

      (3)           (2)

  (7)        (10)         (9)
             
             
             
             (6)

*/
  
  
  private void setupVerticies() {
    vertexCoords[0].x = 0.0;
    vertexCoords[0].y = 0.0;
    vertexCoords[0].z = hgtThreeHalves;

    vertexCoords[1].x = 0.0;
    vertexCoords[1].y = -radius2;
    vertexCoords[1].z = hgtHalf;

    vertexCoords[2].x = edgeLengthHalf;
    vertexCoords[2].y = radius1;
    vertexCoords[2].z = hgtHalf;

    vertexCoords[3].x = -edgeLengthHalf;
    vertexCoords[3].y = radius1;
    vertexCoords[3].z = hgtHalf;

    vertexCoords[4].x = -edgeLength;
    vertexCoords[4].y = -radius2;
    vertexCoords[4].z = hgtHalf;

    vertexCoords[5].x = edgeLength;
    vertexCoords[5].y = -radius2;
    vertexCoords[5].z = hgtHalf;

    vertexCoords[6].x = 0.0;
    vertexCoords[6].y = 2 * radius2;
    vertexCoords[6].z = hgtHalf;

    vertexCoords[7].x = -edgeLength;
    vertexCoords[7].y = radius2;
    vertexCoords[7].z = -hgtHalf;

    vertexCoords[8].x = 0.0;
    vertexCoords[8].y = -(2 * radius2);
    vertexCoords[8].z = -hgtHalf;

    vertexCoords[9].x = edgeLength;
    vertexCoords[9].y = radius2;
    vertexCoords[9].z = -hgtHalf;

    vertexCoords[10].x = 0.0;
    vertexCoords[10].y = radius2;
    vertexCoords[10].z = -hgtHalf;

    vertexCoords[11].x = -edgeLengthHalf;
    vertexCoords[11].y = -radius1;
    vertexCoords[11].z = -hgtHalf;

    vertexCoords[12].x = edgeLengthHalf;
    vertexCoords[12].y = -radius1;
    vertexCoords[12].z = -hgtHalf;

    vertexCoords[13].x = 0.0;
    vertexCoords[13].y = 0.0;
    vertexCoords[13].z = -hgtThreeHalves;
  }
  
}