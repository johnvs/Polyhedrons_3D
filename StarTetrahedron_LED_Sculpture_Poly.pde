
/*
  Thoughts on content generation
    Grouping faces
      1. The faces of the tetrahedrons of the upward and downward pointing major tetrahedrons, respectively.
      2. All faces with the same normals (i.e. each face of the major tetrahedrons).
      3. Faces that share an edge and that "face each other".  (like this __/)
      4. The faces that make up 

*/

private final int EDGE_LENGTH = 300;
private final int NUM_FACES = 24;

boolean runShow;
int prevFC;
int delayFC = 5;

StarTetrahedron starTetrahedron;
VisConGen jamesBrown;
color[] colorMap;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 255);  // Set color mode to HSB, with max values of 255.
  ortho();
  
  jamesBrown = new VisConGen(NUM_FACES);
  starTetrahedron = new StarTetrahedron(width/2, height/2, 0, EDGE_LENGTH);  // x, y, z, edgeLength
  
  runShow = true;
  prevFC = 0;
}

void draw() {
  if (runShow) {
    background(200);

    // Use delay to control speed of color update
    if (frameCount > prevFC + delayFC) {
      prevFC = frameCount;
      colorMap = jamesBrown.update();
      starTetrahedron.setColorMap(colorMap);
    }

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
  