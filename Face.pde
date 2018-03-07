

class Face {
  private PShape face;
  private color faceColor;
  private ArrayList<Integer> neighbors;
  private PVector faceCenter;
  private PVector faceNormal;
  private PVector[] edges;

  /////////////////////////////////////
  // Constructor
  /////////////////////////////////////
  Face(PShape face_) {
    face = face_;
    neighbors = new ArrayList<Integer>();
    edges = new PVector[face.getVertexCount()];

    // calc face center and normal
    faceCenter = findFaceCenter();
    faceNormal = findFaceNormal();
  }

  private PVector findFaceCenter() {
    final int NUM_VERTICES = face.getVertexCount();
    PVector center = new PVector();
    PVector[] edgeMidpoints = new PVector[NUM_VERTICES];

    // calculate face center based on the face PShape
    // Temp
    // center.x = 0;
    // center.y = 0;

    // Find the face's edges and edge midpoints
    for (int i = 0; i < NUM_VERTICES; ++i) {
      PVector vA = face.getVertex(i);
      PVector vB;
      if (i < NUM_VERTICES - 1) {
        // All vertices except the last
        vB = face.getVertex(i + 1);
      } else {
        // The last vertex
        vB = face.getVertex(0);
      }
      edges[i] = new PVector(vB.x - vA.x, vB.y - vA.y, vB.z - vA.z);
      edgeMidpoints[i] = new PVector((vB.x - vA.x) / 2.0, (vB.y - vA.y) / 2.0, (vB.z - vA.z) / 2.0);
    }

    // Find the midpoints of each edge
    for (int i = 0; i < NUM_VERTICES; ++i) {

    }

    return center;
  }

/*
  Finding the intersection point of two lines in three dimensions
  Define line 1 to contain point (x1,y1,z1) with vector (a1,b1,c1).
  Define line 2 to contain point (x2,y2,z2) with vector (a2,b2,c2).

  Ex. L1: P1 = (1, 0, 0), V1 = (2, 3, 1)
      L2: P2 = (0, 5, 5), V2 = (5, 1, -3)

  We can write these parametric equations for the lines.

    Line1                         Line2
    -----                         -----
    x = x1 + a1 * t1              x = x2 + a2 * t2
    y = y1 + b1 * t1              y = y2 + b2 * t2
    z = z1 + c1 * t1              z = z2 + c2 * t2

    x = 1 + 2 * t1                x = 0 + 5 * t2
    y = 0 + 3 * t1                y = 5 + 1 * t2
    z = 0 + 1 * t1                z = 5 - 3 * t2

    (x)  1 + 2 * t1 = 0 + 5 * t2
    (y)  0 + 3 * t1 = 5 + 1 * t2
    (z)  0 + 1 * t1 = 5 - 3 * t2

  Solve the x and y equations

    (x)  2*t1 - 5*t2 = -1
    (y)  3*t1 - 1*t2 - 5

  We can multiply the first equation by -1 and the second equation by 5 and add:

    -2t1 + 5t2 =  1
    15t1 - 5t2 = 25
    ---------------
    13t1       = 26

    t1 = 26/13 = 2

  Plugging that into the second of our pair, we get

    3*2 - t2 = 5

  which gives

    t2 = 1

  Plugging those into all six equations for x, y, and z, we get

    x = 1 + 2*2 = 5     x = 0 + 5*1 = 5
    y = 0 + 3*2 = 6     y = 5 + 1*1 = 6
    z = 0 + 1*2 = 2     z = 5 - 3*1 = 2

  *** Explaination D
  Don't use the y=mx+b form. It fails for vertical lines, also there are numerical stability issues.
  Use a(x-xm) + b(y-ym) = c.
  For lines through points (x0,y0) and (x1,y1), let
    xm = (x0+x1)/2,
    ym = (y0+y1)/2 (median of line segment).

  Then
    a = (y1-y0) and
    b = (x0-x1)

  If you evaluate c = a(x-xm)+b(y-ym), c=0 for (x,y) on the line, and the sign(c) tells you which side a point is on.
  you can also replace xm,ym with x0,y0 or x1,y1
*/

  private PVector findFaceNormal() {
    PVector normal = new PVector();

    // calculate face normal based on the face PShape
    //Dir = (B - A) x (C - A)
    //Norm = Dir / len(Dir)

    // Temp
    normal.x = 0;
    normal.y = 0;

    return normal;
  }

  public PVector getCenter() {
    return faceCenter;
  }

  public PVector getNormal() {
    return faceNormal;
  }

  public PVector getMyVertex(int index) {
    return face.getVertex(index);
  }

  public void addNeighbor(Integer neighbor) {
    neighbors.add(neighbor);
  }

  public ArrayList<Integer> getNeighbors() {
    return neighbors;
  }

  public void setColor(color color_) {
    faceColor = color_;
  }

  public color getColor() {
    return faceColor;
  }

  public int getNumVertices() {
    return face.getVertexCount();
  }

  public void drawFace() {
    face.setFill(faceColor);
    shape(face);
  }

  public void drawFace(color color_) {
    face.setFill(color_);
    shape(face);
  }

}
