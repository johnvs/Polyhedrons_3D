/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11908*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int num = 18;
int edgeLength = 50; // was 20

StarTetrahedron starTetrahedron;

void setup() {
  size(800, 800, P3D);

  starTetrahedron = new StarTetrahedron(0, 0, 0, 100);  // x, y, z, strutLength
}

void draw() {
  background(255);

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