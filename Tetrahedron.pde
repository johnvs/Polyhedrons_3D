

class Tetrahedron {
  private final int NUM_FACES = 3;
  
  //int x, y, z;
  //int edgeLength;
  //int edgeLengthHalf;
  //float radius1;
  //float radius2;
  //float hgt;
  //float hgtHalf;
  //float counter;

  //float angleX = 0;  // radians(60);
  //float angleY = 0;
  //float angleZ = 0;
  //float spin = 0.01;
  
  //float[][][] vertexArray;
  
  private Face[] faces;

  //boolean selected=false;

  //Tetrahedron (int ix, int iy, int iz, int iedgeLength) {
  //Tetrahedron (float[][] vI) {
  Tetrahedron () {
    faces = new Face[3];
  }    
    
  Tetrahedron (Face[] iFaces) {
    faces = new Face[3];
    
    for (int i = 0; i < NUM_FACES; ++i) {
      faces[i] = iFaces[i];
    }
    
    //for (int i = 0; i < vI.length; ++i) {
      
    //}
      
    //x = ix;
    //y = iy;
    //z = iz;

    //edgeLength = iedgeLength;
    //edgeLengthHalf = edgeLength/2;
    //radius1 = edgeLength / (2*sqrt(3));
    //radius2 = edgeLength / sqrt(3);
    //hgt = edgeLength * sqrt(2.0 / 3.0);
    //hgtHalf = hgt/2.0;
    //println("radius1 = ", radius1);
    //println("radius2 = ", radius2);
    //println("hgt = ", hgt);
  }
  
  public void setFaces (Face[] iFaces) {
    if (faces != null) {
      for (int i = 0; i < NUM_FACES; ++i) {
        faces[i] = iFaces[i];
      }
    }
  }
  
  public Face[] getFaces() {
    return faces;
  }
  
  public void updateTetra() {
    //angleY += spin;
    //angleZ += spin;
  }
  
  public void drawTetra() {
    for (int i = 0; i < NUM_FACES; ++i) {
      faces[i].drawFace();
    }
    

    //pushMatrix();
    
    //noStroke();
//  //  stroke(0);
//  //  noFill();

    //translate(width * 0.75, height/2, 0);

    //float angleXDeg = map(mouseX, 0, width, 0, 90);    // was PI/2
    //float angleXRad = radians(angleXDeg);
    //rotateX(angleXRad);    // was PI/2
    ////rotateX(radians(map(mouseX, 0, width, 0, 90)));    // was PI/2
    ////println("T: angleXDeg = ", angleXDeg, " angleXRad = ", angleXRad);
    ////rotateX(angleX);    // was PI/2
    //rotateY(angleY);
    //rotateZ(angleZ);    // was =PI/6
    
    //fill(255, 255, 0);
    //beginShape();
    //vertex(-edgeLengthHalf,  radius1,       hgtHalf);
    //vertex(              0, -radius2,       hgtHalf);
    //vertex(              0,        0, hgt + hgtHalf);
    //endShape();
    
    //fill(0, 0, 255);
    //beginShape();
    //vertex(              0, -radius2,       hgtHalf);
    //vertex( edgeLengthHalf,  radius1,       hgtHalf);
    //vertex(              0,        0, hgt + hgtHalf);
    //endShape();
    
    //fill(0, 255, 0);
    //beginShape();
    //vertex( edgeLengthHalf, radius1,       hgtHalf);
    //vertex(-edgeLengthHalf, radius1,       hgtHalf);
    //vertex(              0,       0, hgt + hgtHalf);
    //endShape();
    
    //popMatrix();
  }
  
/*
  void makeShape() {
    translate(x, y);

    theta = frameCount/TWO_PI;

    float dx = x-mouseX;
    float dy = y-mouseY;
    float d = (sqrt(dx*dx+dy*dy));

    if (d < edgeLength*2) {
      counter = 200;
      angleX = (theta * 0.1);
      angleY = (theta * 0.1);
      stroke(200, 200, 255);
      rotateY(angleX);
      rotateX(angleY);
    }
    else {
      counter-=0.5;
      rx = (rx*0.95)+(angleX*0.1);
      ry = (ry*0.95)+(angleY*0.1);
      rotateX(rx);
      rotateY(ry);
      stroke(counter, counter, 255);
    }
    
    beginShape(TRIANGLE_STRIP);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    vertex(-edgeLength, edgeLength, -edgeLength);
    vertex(edgeLength, -edgeLength, -edgeLength);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    endShape(CLOSE);
  }
*/
}