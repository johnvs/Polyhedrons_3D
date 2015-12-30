
/*
  Thoughts on content generation
    Grouping faces
      1. The faces of the tetrahedrons of the upward and downward pointing major tetrahedrons, respectively.
          Upward:   0 - 11
          Downward: 12 - 23
          
      2. All faces with the same normals (i.e. each face of the major tetrahedrons).
          Face 1: 0, 8, 9
          Face 2: 1, 4, 7
          Face 3: 2, 3, 10
          Face 4: 5, 6, 11
          Face 5: 12, 20, 21
          Face 6: 13, 16, 19
          Face 7: 14, 15, 22
          Face 8: 17, 18, 23
          
      3. Faces that share an edge and that "face each other".  (like this __/)
          Pair 1:  0, 12
          Pair 2:  1, 21
          Pair 3:  2, 20
          Pair 4:  3, 18
          Pair 5:  4, 23
          Pair 6:  5, 17
          Pair 7:  6, 15
          Pair 8:  7, 22
          Pair 9:  8, 14
          Pair 10: 9, 13
          Pair 11: 10, 19
          Pair 12: 11, 16
          
      4. The faces that make up 

*/

boolean runShow;

Polyhedron polyhedrons[];
int numPolies;

void setup() {
  size(1000, 800, P3D);
  smooth(8);
  colorMode(HSB, 255);  // Set color mode to HSB, with max values of 255.
  ortho();
  
  numPolies = 1;
  polyhedrons = new Polyhedron[numPolies];
  
  polyhedrons[0] = new Polyhedron(width/2, height/2, 0, 300, "tetrahedron.json");

  //for (int i = 0; i < numPolies; ++i) {
  //  if (i % 2 == 0) {
  //    // Even i's
  //    polyhedrons[i] = new Polyhedron(width/10, (int)(height*(0.1 + (0.4 * i))), 0, 600, "tetrahedron.json");
  //    println("Created polyhedron no. ", i);
  //  } else {
  //    // Odd i's
  //    polyhedrons[i] = new Polyhedron((int)(width*0.9), (int)(height*(0.1 + (.4 * (i - 1)))), 0, 600, "tetrahedron.json"); // was 100
  //    println("Created polyhedron no. ", i);
  //  }
  //}
  
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

  if (key == CODED) {
    if (keyCode == UP) {
      polyhedrons[0].incIdentGroup();
    } else if (keyCode == DOWN) {
      polyhedrons[0].decIdentGroup();
    } 
  }
  
  if (key == '0') {
    polyhedrons[0].setColorPattern(0);
  }
  
  if (key == '1') {
    polyhedrons[0].setColorPattern(1);
  }
  
  if (key == '2') {
    polyhedrons[0].setColorPattern(2);
  }
  
  if (key == '3') {
    polyhedrons[0].setColorPattern(3);
  }
  
  if (key == '4') {
    polyhedrons[0].setColorPattern(4);
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
  