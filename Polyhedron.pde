
/*
 Each polyhedron is made up of N faces, and each face is made up of M vertices.

 */

class Polyhedron {
  // private final float OFFSET_ANGLE_X = PI - atan(2);
  private final float OFFSET_ANGLE_X = 0;

  private float x;
  private float y;
  private float z;

  private float angleX = 0;  // radians(60);   // PI/2;
  private float angleY = 0;
  private float angleZ = 0;  // PI/2;
  private float angleXDeg;
  private float angleYDeg;
  private float angleZDeg;

  private float spin = 0.01;

  private float scaleFactor;

  private color[] colorMap;  // The accumulation of all of visualContent colorMaps
  private VisConGen visualContent;

  private Face[] faces;
  private int numFaces;

  private int identGroupMember = -1;  // -1  = no group idented, 0 through numFaces-1, that face will be gray

  private float epsilon = 0.0000001;  // Used to compare two floats

  Polyhedron(float _x, float _y, float _z, float sF, String filename) {
    x = _x;
    y = _y;
    z = _z;
    scaleFactor = sF;

    // Calculate and store the coordinates of the shape's vertices
    // Load the json data from the file
    JSONArray polyFacesJsonArray = loadJSONArray(filename);
    numFaces = polyFacesJsonArray.size();
    faces = new Face[numFaces];
    colorMap = new color[numFaces];

    // For all faces in the polyhedron,
    for (int i = 0; i < numFaces; ++i) {

      // Load the current face's vertex array
      JSONArray vertexCoordsJsonArray = polyFacesJsonArray.getJSONArray(i);
      int numVertices = vertexCoordsJsonArray.size();

      // Create all the faces and put them in the array
      PShape facePS = null;
      facePS = createShape();
      facePS.beginShape();
      //facePS.noStroke();
      facePS.stroke(0);
      facePS.strokeWeight(0.5);

      // And for each vertex that defines a face, retrieve it's coordinates
      for (int j = 0; j < numVertices; ++j) {

        JSONObject coordJsonObj = vertexCoordsJsonArray.getJSONObject(j);

        float x = coordJsonObj.getFloat("x");
        float y = coordJsonObj.getFloat("y");
        float z = coordJsonObj.getFloat("z");

        //println("PolyH: coords[", i, "] = ", x, ", ", y, ", ", z);

        facePS.vertex(x, y, z);
      }

      facePS.endShape();
      faces[i] = new Face(facePS);
      //println("PolyH: add new face to array list, i = ", i);
    }

    // Create an array of face neighbors
    for (int i = 0; i < numFaces - 1; ++i) {          // For all but the last face,
      Face faceA = faces[i];                          // Get the ith faceA
      Face faceB = null;
      int k = 0;
      int numVerticesA = faceA.getNumVertices();      // Get the number of its vertices

      for (k = i + 1; k < numFaces; ++k) {            // For all the faces after faceA,
        faceB = faces[k];                             // Get the kth face
        int numVerticesB = faceB.getNumVertices();    // Get the number of faceB vertices
        int sharedVertices = 0;                       // Init the counter

        for (int j = 0; j < numVerticesA; ++j) {      // For every faceA vertex,
          PVector vertexA = faceA.getMyVertex(j);     // Get the jth vertex,

          for (int n = 0; n < numVerticesB; ++n) {    // And compare it to every faceB vertex,
            PVector vertexB = faceB.getMyVertex(n);   // Get the vertex and compare each of its x, y and z
                                                      // values with the current faceA vertex, respectively
                                                      // Compare pairs of floating point numbers
            //println("Face vertex ", i, "-", j, " and ", k, "-", n);
            //println("vertexA.x, vertexB.x: ", vertexA.x, ", ", vertexB.x);
            //println("vertexA.y, vertexB.y: ", vertexA.y, ", ", vertexB.y);
            //println("vertexA.z, vertexB.z: ", vertexA.z, ", ", vertexB.z);

            if ((Math.abs(vertexA.x - vertexB.x) < epsilon) &&
                (Math.abs(vertexA.y - vertexB.y) < epsilon) &&
                (Math.abs(vertexA.z - vertexB.z) < epsilon)) {
                  ++sharedVertices;                   // If all coordinates are "the same", inc the counter
                  //println("Incing sharedVertices");
                  break;                              // VertexA is not going to match any other verices of this face.
            }
          }
          if (sharedVertices > 1) {
            break;
          }
        }
        //println("Number of sharedVertices = ", sharedVertices);
        if (sharedVertices > 1) {    // If the two faces had more than 1 vertex in common
                                     // (it will likely be 0 or 2)
          faceA.addNeighbor(k);      // Added the index of each face to the other's neighbor list
          faceB.addNeighbor(i);
          sharedVertices = 0;        // Clear counter
          //println("Neighbors!");
        }
      }
    }

    for (int i = 0; i < numFaces; ++i) {
      println("Face ", i, " neighbors are: ", faces[i].getNeighbors());
    }

    visualContent = new VisConGen(faces);
  }

  public void setColorPattern(int p) {
    visualContent.setPattern(p);
  }

  public void update() {

    visualContent.update();

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
    text(identGroupMember, width * 0.05, height * 0.95);

    pushMatrix();

    //noStroke();
    //stroke(0);
    //noFill();

    translate(x, y, z);

    // Calculate the X rotation based on the mouse Y value
    angleXDeg = map(mouseY, height, 0, 0, 180);    // was PI/2
    angleX = radians(angleXDeg) + OFFSET_ANGLE_X;

    //float angleYDeg = map(mouseX, 0, width, 180, -180);    // was PI/2

    // Calculate the Z rotation based on the mouse X value
    if (mouseY <= height/2) {
      angleZDeg = map(mouseX, 0, width, 180, -180);
    } else {
      angleZDeg = map(mouseX, width, 0, -180, 180);
    }
    angleZ = radians(angleZDeg);

    //rotateX(angleXRad);    // was PI/2
    //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
    //println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);

    rotateX(angleX);    // was PI/2
    rotateY(angleY);
    rotateZ(angleZ);    // was =PI/6
    scale(scaleFactor);

    for (int i = 0; i < numFaces; ++i) {
      //print("Face [", i, "]
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
