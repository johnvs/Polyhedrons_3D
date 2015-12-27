
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

//class StarTetrahedron {
class Polyhedron {
  private int x;
  private int y;
  private int z;

  private float angleX = radians(60);   // PI/2;
  private float angleY = 0;
  private float angleZ = 0;  // PI/2;
  private float spin = 0.01;

  //private final int NUM_FACES = 24;
  private int numFaces;

  //private VertexCoords vertexCoords;

  private VisConGen jB;

  //private ArrayList<Face> faces = new ArrayList<Face>(NUM_FACES);

  // These are the indicies of the vertex coordinates array.
  // There are 24 groups of the 3 coordinate array indicies.
  // Each element (number) in the array represents a vertex coordinate (x, y, z) of a face. 
  // Groups of three coordinates represents a face 
  //private int[][] vertexGroup = 
  //{ 
  //  { 3, 11,  7}, {11, 10,  7}, {10,  3,  7}, 
  //  { 2, 10,  9}, {10, 12,  9}, {12,  2,  9}, 
  //  { 1, 12,  8}, {12, 11,  8}, {11,  1,  8}, 
  //  { 1,  3,  0}, { 3,  2,  0}, { 2,  1,  0}, 
  //  {11,  3,  4}, { 3,  1,  4}, { 1, 11,  4}, 
  //  {12,  1,  5}, { 1,  2,  5}, { 2, 12,  5}, 
  //  {10,  2,  6}, { 2,  3,  6}, { 3, 10,  6}, 
  //  {10, 11, 13}, {11, 12, 13}, {12, 10, 13} 
  //};

  //StarTetrahedron(int xx, int yy, int zz, int edgeLen) {
  Polyhedron(int xx, int yy, int zz, String filename) {
    x = xx;
    y = yy;
    z = zz;

    // Calculate and store the coordinates of the shape's verticies
    //vertexCoords = new VertexCoords(edgeLen);

    println("ST: face arraylist size = ", faces.size());
    // Create all the faces and put them in the ArrayList 
    for (int i = 0; i < NUM_FACES; ++i) {
      PShape face = null;

      // Get the coordinates of the face's three verticies
      PVector vc0 = vertexCoords.getCoords(vertexGroup[i][0]);
      PVector vc1 = vertexCoords.getCoords(vertexGroup[i][1]);
      PVector vc2 = vertexCoords.getCoords(vertexGroup[i][2]);

      face = createShape();
      face.beginShape();
      //face.noStroke();
      face.stroke(0);
      face.strokeWeight(0.5);
      face.vertex(vc0.x, vc0.y, vc0.z);
      face.vertex(vc1.x, vc1.y, vc1.z);
      face.vertex(vc2.x, vc2.y, vc2.z);
      face.endShape();
      faces.add(new Face(face));
      println("ST: add new face to array list, i = ", i);
    }
  }

  public void setColorMap(color[] colorMap) {
    // load color map into face color array
    for (int i = 0; i < NUM_FACES; ++i) {
      faces.get(i).setColor(colorMap[i]);
    }
  }

  public void update() {
    angleZ += spin;
  }

  public void drawPoly(int scale) {

    pushMatrix();

    //noStroke();
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

    for (int i = 0; i < NUM_FACES; ++i) {
      faces.get(i).drawFace(scale);
    }

    popMatrix();
  }
}