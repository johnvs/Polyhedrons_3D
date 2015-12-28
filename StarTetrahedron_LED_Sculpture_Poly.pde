
/*
  Thoughts on content generation
    Grouping faces
      1. The faces of the tetrahedrons of the upward and downward pointing major tetrahedrons, respectively.
      2. All faces with the same normals (i.e. each face of the major tetrahedrons).
      3. Faces that share an edge and that "face each other".  (like this __/)
      4. The faces that make up 

*/

boolean runShow;

Polyhedron polyhedrons[];
int numPolies;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  colorMode(HSB, 255);  // Set color mode to HSB, with max values of 255.
  ortho();
  
  numPolies = 4;
  polyhedrons = new Polyhedron[numPolies];
  
  for (int i = 0; i < numPolies; ++i) {
    if (i % 2 == 0) {
      // Even i's
      polyhedrons[i] = new Polyhedron(width/4, height*(i+1)/4, 0, 100, "tetrahedron.json");
      println("Created polyhedron no. ", i);
    } else {
      // Odd i's
      polyhedrons[i] = new Polyhedron((int)(width*0.75), (height*i)/4, 0, 100, "tetrahedron.json");
      println("Created polyhedron no. ", i);
    }
  }
  
  runShow = true;
}


void draw() {
  if (runShow) {
    background(200);

    for (int i = 0; i < numPolies; ++i) {
      //println("Updating and drawing polyhedron no. ", i);
      polyhedrons[i].update();
      polyhedrons[i].drawPoly();
    }
    
    //if (frameCount > 5) {
    //  runShow = false;
    //}
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
  