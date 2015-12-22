
int num = 18;
private final int EDGE_LENGTH = 300;

boolean runShow;

StarTetrahedron starTetrahedron;
VisConGen jamesBrown;
color[][] colorMap;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 255);  // Set color mode to HSB, with max values of 255.
  ortho();
  
  jamesBrown = new VisConGen();
  starTetrahedron = new StarTetrahedron(width/2, height/2, 0, EDGE_LENGTH);  // x, y, z, edgeLength
  
  runShow = true;
}

void draw() {
  if (runShow) {
    background(200);
    colorMap = jamesBrown.update();
    starTetrahedron.setColorMap(colorMap);
    starTetrahedron.update();
    starTetrahedron.drawST();
  }
}

void keyPressed() {
  if (key == ' ') {
    runShow = !runShow;
  }
} 

  //camera(mouseX*2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  
  //directionalLight(0, 0, 255, 0, 0, -1);
  
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
  