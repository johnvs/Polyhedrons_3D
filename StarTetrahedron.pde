
class StarTetrahedron {
//  private final int EDGE_LENGTH = 50;
  private int x;
  private int y;
  private int z;
  private int strutLength;
  private final int numTetras = 8;
  private Octahedron octahedron;
  private Tetrahedron[] tetrahedron;
 
  StarTetrahedron(int xx, int yy, int zz, int sLength) {
    x = xx;
    y = yy;
    z = zz;
    strutLength = sLength;
     
    octahedron = new Octahedron(x, y, z, strutLength);
    tetrahedron = new Tetrahedron[numTetras];
    
    for (int i = 0; i < numTetras; ++i) {
       tetrahedron[i] = new Tetrahedron(0, 0, 0, strutLength); 
    }
  }
   
  public void update () {
    octahedron.update();
    for (int i = 0; i < numTetras; ++i) {
       tetrahedron[i].updateTetra(); 
    }
  }
  
  public void drawST() {
    octahedron.drawOcta();
    for (int i = 0; i < numTetras; ++i) {
       tetrahedron[i].drawTetra(); 
    }
  }
  
}