
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

  polyhedrons[0] = new Polyhedron(width * 0.5,  height * 0.5,  0, 150, "Dodecahedron01.json");
  // polyhedrons[0] = new Polyhedron(width/2,  height/2,  0,  300, "DodecahedronT.json");
  // polyhedrons[0] = new Polyhedron(width/2, height/2, 0, 300, "Cube.json");
  // polyhedrons[0] = new Polyhedron(width/2, height/2, 0, 300, "Icosahedron.json");

  // polyhedrons[0] = new Polyhedron(width * 0.25, height * 0.25, 0, 100, "Tetrahedron.json");
  // polyhedrons[1] = new Polyhedron(width * 0.75, height * 0.25, 0, 100, "Cube.json");
  // polyhedrons[2] = new Polyhedron(width * 0.25, height * 0.75, 0, 100, "Octahedron.json");
  // polyhedrons[0] = new Polyhedron(width * 0.75, height * 0.75, 0, 100, "Icosahedron.json");
  // polyhedrons[0] = new Polyhedron(width * 0.5,  height * 0.5,  0,  150, "Dodecahedron01.json");
  // polyhedrons[0] = new Polyhedron(width * 0.5,  height * 0.5,  0,  200, "StarTetrahedron.json");
  // polyhedrons[0] = new Polyhedron(width * 0.67,  height * 0.5,  0,  100, "DodecahedronT.json");


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

    for (Polyhedron poly : polyhedrons) {
      poly.update();
      poly.drawPoly();
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

  // if (key == '4') {
  //   polyhedrons[0].setColorPattern(4);
  // }

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