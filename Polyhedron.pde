
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

class Polyhedron {
  private int x;
  private int y;
  private int z;

  private float angleX = 0;  // radians(60);   // PI/2;
  private float angleY = 0;
  private float angleZ = 0;  // PI/2;
  private float spin = 0.01;
  
  private float scaleFactor;

  private color[] colorMap;
  private VisConGen visualContent;

  private VertexCoord vertexCoords[];
  private Face faces[];
  private int numFaces;

  private int prevFrameCount = 0;
  private int delayFrameCount = 5;
  
  private int identGroupMember = -1;  // -1  = no group idented, 0 through numFaces, that face will be gray

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

  Polyhedron(int x_, int y_, int z_, float scaleFactor_, String filename) {
    x = x_;
    y = y_;
    z = z_;
    scaleFactor = scaleFactor_;

    // Calculate and store the coordinates of the shape's verticies
    // Load the json data from the file
    JSONObject polyDataJson = loadJSONObject(filename);
    
    JSONArray coordJArray = polyDataJson.getJSONArray("verticies");
    vertexCoords = new VertexCoord[coordJArray.size()];
    
    for (int i = 0; i < coordJArray.size(); ++i) {
      JSONObject coordJObj = coordJArray.getJSONObject(i);
      
      float x = coordJObj.getFloat("x");
      float y = coordJObj.getFloat("y");
      float z = coordJObj.getFloat("z");

      //println("PolyH: coords[", i, "] = ", x, ", ", y, ", ", z);

      vertexCoords[i] = new VertexCoord(x, y, z);
    }
    
    JSONArray faceJArray = polyDataJson.getJSONArray("faces");
    numFaces = faceJArray.size();
    faces = new Face[numFaces];
    colorMap = new color[numFaces];
    
    //println("PolyH: face arraylist size = ", faces.length);

    for (int i = 0; i < faceJArray.size(); ++i) {
      JSONObject faceJObj = faceJArray.getJSONObject(i);
      
      int v1 = faceJObj.getInt("v1");
      int v2 = faceJObj.getInt("v2");
      int v3 = faceJObj.getInt("v3");
      
      //println("PolyH: faces[", i, "] = ", v1, ", ", v2, ", ", v3);

      // Create all the faces and put them in the ArrayList 
      PShape face = null;

      // Get the coordinates of the face's three verticies
      PVector vc0 = vertexCoords[v1].getCoord();
      PVector vc1 = vertexCoords[v2].getCoord();
      PVector vc2 = vertexCoords[v3].getCoord();

      //println("PolyH: face PVs[", i, "] = ", vc0, ", ", vc1, ", ", vc2);

      face = createShape();
      face.beginShape();
      //face.noStroke();
      face.stroke(0);
      face.strokeWeight(0.5);
      face.vertex(vc0.x, vc0.y, vc0.z);
      face.vertex(vc1.x, vc1.y, vc1.z);
      face.vertex(vc2.x, vc2.y, vc2.z);
      face.endShape();
      faces[i] = new Face(face);
      //println("PolyH: add new face to array list, i = ", i);
    }
    
    visualContent = new VisConGen(numFaces);

  }

  public void setColorMap(color[] colorMap) {
    // load color map into face color array
    for (int i = 0; i < numFaces; ++i) {
      faces[i].setColor(colorMap[i]);
    }
  }

  public void update() {
    
    // Use delay to control speed of color update
    if (frameCount > prevFrameCount + delayFrameCount) {
      prevFrameCount = frameCount;
      colorMap = visualContent.update();
      setColorMap(colorMap);
    }

    //angleZ += spin;
  }

  public void incIdentGroup() {
    if (identGroupMember < numFaces - 1) {
      ++identGroupMember;
    } else {
      identGroupMember = -1;
    }
  }
  
  public void decIdentGroup() {
    if (identGroupMember > -1) {
      --identGroupMember;
    } else {
      identGroupMember = numFaces - 1;
    }
  }
  
  public void drawPoly() {

    textSize(32);
    fill(0, 102, 153);
    text(identGroupMember, width*0.05, height*0.95);

    pushMatrix();

    //noStroke();
    //stroke(0);
    //noFill();

    translate(x, y, z);

    //float angleYDeg = map(mouseX, 0, width, 180, -180);    // was PI/2
    float angleZDeg;
    if (mouseY <= height/2) {
      angleZDeg = map(mouseX, 0, width, 180, -180);
    } else {
      angleZDeg = map(mouseX, width, 0, -180, 180);
    }
    angleZ = radians(angleZDeg);

    float angleXDeg;
    angleXDeg = map(mouseY, height, 0, 0, 180);    // was PI/2
    angleX = radians(angleXDeg);

    //rotateX(angleXRad);    // was PI/2
    //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
    //println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);

    rotateX(angleX);    // was PI/2
    rotateY(angleY);
    rotateZ(angleZ);    // was =PI/6
    scale(scaleFactor);

    for (int i = 0; i < numFaces; ++i) {
      if (identGroupMember >= 0) {
        if (i == identGroupMember) {
          faces[i].drawFace(color(128));
        } else {
          faces[i].drawFace();
        }
      } else {
        faces[i].drawFace();
      }
    }

    popMatrix();

    // Debug
    //fill(0, 102, 153);
    //text(angleXDeg, width*0.80, height*0.95);
  }
}