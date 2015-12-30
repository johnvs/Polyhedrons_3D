
/*  
 Each polyhedron is made up of N faces, and each face is made up of M vertices.
 
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

  private Face faces[];
  private int numFaces;

  private int prevFrameCount = 0;
  private int delayFrameCount = 5;
  
  private int identGroupMember = -1;  // -1  = no group idented, 0 through numFaces, that face will be gray

  Polyhedron(int x_, int y_, int z_, float scaleFactor_, String filename) {
    x = x_;
    y = y_;
    z = z_;
    scaleFactor = scaleFactor_;

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
      PShape face = null;
      face = createShape();
      face.beginShape();
      //face.noStroke();
      face.stroke(0);
      face.strokeWeight(0.5);

      // And for each vertex that defines a face, retrieve it's coordinates 
      for (int j = 0; j < numVertices; ++j) {
        
        JSONObject coordJsonObj = vertexCoordsJsonArray.getJSONObject(j);
        
        float x = coordJsonObj.getFloat("x");
        float y = coordJsonObj.getFloat("y");
        float z = coordJsonObj.getFloat("z");
  
        //println("PolyH: coords[", i, "] = ", x, ", ", y, ", ", z);
  
        face.vertex(x, y, z);
      }

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
  
  public void setColorPattern(int p) {
    visualContent.setPattern(p);
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