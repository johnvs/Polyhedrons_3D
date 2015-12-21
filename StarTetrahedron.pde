
class StarTetrahedron {
  private int x;
  private int y;
  private int z;

  private float angleX = radians(60);   // PI/2;
  private float angleY = 0;
  private float angleZ = 0;  // PI/2;
  private float spin = 0.01;

  private final int NUM_MAJOR_TETRAS = 2;
  private MajorTetrahedron[] majorTetrahedrons;
  private VertexCoords vertexCoords;

  // these are temp
  //private final int NUM_TETRAS = 2;
  //private Octahedron octahedron;
  //private Tetrahedron[] tetrahedron;
 
  StarTetrahedron(int xx, int yy, int zz, int edgeLen) {
    x = xx;
    y = yy;
    z = zz;
    
    vertexCoords = new VertexCoords(edgeLen);

    majorTetrahedrons = new MajorTetrahedron[NUM_MAJOR_TETRAS];
    majorTetrahedrons[0] = new MajorTetrahedron(0, vertexCoords);  // Pointing up
    majorTetrahedrons[1] = new MajorTetrahedron(1, vertexCoords);  // Pointing down
    
    //octahedron = new Octahedron(x, y, z, edgeLen);
    //tetrahedron = new Tetrahedron[NUM_TETRAS];
    
    //for (int i = 0; i < NUM_TETRAS; ++i) {
    //   //tetrahedron[i] = new Tetrahedron(0, 0, 0, strutLength); 
    //   tetrahedron[i] = new Tetrahedron(); 
    //}
  }
  
  public void update() {
    angleZ += spin;
    //octahedron.update();
    //for (int i = 0; i < NUM_TETRAS; ++i) {
    //   tetrahedron[i].updateTetra(); 
    //}
  }
  
  public void drawST() {
    //octahedron.drawOcta();
    
    //for (int i = 0; i < NUM_TETRAS; ++i) {
      pushMatrix();
    
      //noStroke();
     stroke(0);
  //    noFill();
  
      translate(x, x, z);
  
      float angleXDeg = map(mouseY, height, 0, 0, 180);    // was PI/2
      float angleX = radians(angleXDeg);
      //rotateX(angleXRad);    // was PI/2
      //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
      //println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);
      rotateX(angleX);    // was PI/2
      rotateY(angleY);
      rotateZ(angleZ);    // was =PI/6
      
      //tetrahedron[i].drawTetra(); 
      for (int i = 0; i < NUM_MAJOR_TETRAS; ++i) {
        majorTetrahedrons[i].drawMT();
      }
      
      popMatrix();
    //}
  }
  
}