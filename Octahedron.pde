

class Octahedron {
  int x;
  int y;
  int z;
  int strutLength;
  float angleX = PI/2;
  float angleY = 0;
  float angleZ = PI/2;
  float spin = 0.01;
  
  Octahedron(int xx, int yy, int zz, int sLength) {
    x = xx;
    y = yy;
    z = zz;
    strutLength = sLength;
  }
  
  public void update() {
    angleZ += spin;
  }
  
  public void drawOcta() {
    stroke(0);
    noFill();

    translate(width/2, height/2, 0);

    //rotateX(angleX);    // was PI/2
    //rotateY(angleY);
    //rotateZ(angleZ);    // was =PI/6
    
    beginShape();
    // 
    vertex(-strutLength, -strutLength, -strutLength);
    vertex( strutLength, -strutLength, -strutLength);
    vertex(           0,            0,  strutLength);
    
    vertex( strutLength, -strutLength, -strutLength);
    vertex( strutLength,  strutLength, -strutLength);
    vertex(           0,            0,  strutLength);
    
    vertex( strutLength, strutLength, -strutLength);
    vertex(-strutLength, strutLength, -strutLength);
    vertex(           0,           0,  strutLength);
    
    vertex(-strutLength,  strutLength, -strutLength);
    vertex(-strutLength, -strutLength, -strutLength);
    vertex(           0,            0,  strutLength);

    endShape();
  }
  
}