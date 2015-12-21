
int num = 18;
private final int EDGE_LENGTH = 300;

StarTetrahedron starTetrahedron;

void setup() {
  size(800, 800, P3D);
  ortho();
  
  starTetrahedron = new StarTetrahedron(width/2, height/2, 0, EDGE_LENGTH);  // x, y, z, edgeLength
}

void draw() {
  background(230);

  //camera(mouseX*2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  
  //if (keyPressed) {
  //  if (key == 32) {
  //    fill(255);
  //    stroke(0);
  //    directionalLight(255, 0, 0, -1, 1, 0);
  //    directionalLight(200, 200, 255, 0, -1, 0);
  //  }
  //}
  //else {
  //  noFill();
  //}
  
  //directionalLight(0, 0, 255, 0, 0, -1);
  
  starTetrahedron.update();
  starTetrahedron.drawST();
}