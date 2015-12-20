

class Octahedron {
  int x;
  int y;
  int z;
  int edgeLength;
  int hgt;
  int sLDiv2;
  float angleX = radians(60);   // PI/2;
  float angleY = 0;
  float angleZ = 0;  // PI/2;
  float spin = 0.01;
  
  Octahedron(int xx, int yy, int zz, int sLength) {
    x = xx;
    y = yy;
    z = zz;
    edgeLength = sLength;
    sLDiv2 = edgeLength/2;
    hgt = (int) (edgeLength / sqrt(2));
  }
  
  public void update() {
    //angleX += spin;
    angleZ += spin;
  }
  
  public void drawOcta() {
    pushMatrix();
    noStroke();
//    stroke(0);
//    noFill();

    translate(width/4, height/2, 0);

    //float angleXDeg = map(mouseX, 0, width, 0, 90);    // was PI/2
    //float angleXRad = radians(angleXDeg);
    //rotateX(angleXRad);    // was PI/2
    //rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
    //println("O: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);

    //rotateX(map(mouseX, 0, width, 0, TWO_PI));    // was PI/2
    rotateX(angleX);    // was PI/2
    rotateY(angleY);
    rotateZ(angleZ);    // was =PI/6
    
    //--------------------------
    // Top of octahedron
    fill(255, 255, 0);
    beginShape();
    vertex(-sLDiv2, -sLDiv2,    0);
    vertex( sLDiv2, -sLDiv2,    0);
    vertex(      0,       0,  hgt);
    endShape();
    
    fill(0, 0, 255);
    beginShape();
    vertex( sLDiv2, -sLDiv2,    0);
    vertex( sLDiv2,  sLDiv2,    0);
    vertex(      0,       0,  hgt);
    endShape();
    
    fill(0, 255, 0);
    beginShape();
    vertex( sLDiv2, sLDiv2,    0);
    vertex(-sLDiv2, sLDiv2,    0);
    vertex(      0,      0,  hgt);
    endShape();
    
    fill(255, 0, 0);
    beginShape();
    vertex(-sLDiv2,  sLDiv2,    0);
    vertex(-sLDiv2, -sLDiv2,    0);
    vertex(      0,       0,  hgt);
    endShape();

    //--------------------------
    // Bottom of octahedron
    fill(255, 255, 0);
    beginShape();
    vertex(-sLDiv2, -sLDiv2,    0);
    vertex( sLDiv2, -sLDiv2,    0);
    vertex(      0,       0,  -hgt);
    endShape();
    
    fill(0, 0, 255);
    beginShape();
    vertex( sLDiv2, -sLDiv2,    0);
    vertex( sLDiv2,  sLDiv2,    0);
    vertex(      0,       0,  -hgt);
    endShape();
    
    fill(0, 255, 0);
    beginShape();
    vertex( sLDiv2, sLDiv2,    0);
    vertex(-sLDiv2, sLDiv2,    0);
    vertex(      0,      0,  -hgt);
    endShape();
    
    fill(255, 0, 0);
    beginShape();
    vertex(-sLDiv2,  sLDiv2,    0);
    vertex(-sLDiv2, -sLDiv2,    0);
    vertex(      0,       0,  -hgt);
    endShape();
    
    popMatrix();
  }
  
}