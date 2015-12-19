/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11908*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int num = 18;
int edgeLength = 50; // was 20

StarTetrahedron starTetrahedron;

void setup() {
  size(800, 800, P3D);
  ortho();
  
  starTetrahedron = new StarTetrahedron(0, 0, 0, 200);  // x, y, z, strutLength
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