void drawCircle(int x, int y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    radius *= 0.75f;
// The drawCircle() function is calling itself recursively.
    drawCircle(x, y, radius);
  }
}

void drawCircle2(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 8) {
    drawCircle2(x + radius/2, y, radius/2);
    drawCircle2(x - radius/2, y, radius/2);
    drawCircle2(x, y + radius/2, radius/2);
    drawCircle2(x, y - radius/2, radius/2);
  }
}

void setup() {
  size(500, 500);
  //background(0);
  //noStroke();
  //fill(102);
}

class Triangle {
  public int x;
  public int y;
  public boolean direction;

  public Triangle(int x, int y, boolean direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }

  public Triangle getNextTriangle(HashMap<Triangle, Boolean> allTriangles) {
    boolean newDirection = !this.direction;
    Triangle[] triangles = new Triangle[1];
    triangles[0] = new Triangle(this.x - 1, this.getSign() * 2 + this.y, newDirection);


    return triangles[0];
  }

  public int getSign() {
      return this.direction ? -1 : 1;
  }
}



//TriangleParams get_next_triangle(TriangleParams current_triangle,
//    TriangleParams all_triangles) {

//}



void drawTriangle(Triangle triangle_params) {
  int sign = triangle_params.getSign();
  int scaling_factor = 30;
  triangle(
      triangle_params.x*scaling_factor,
      triangle_params.y*scaling_factor,
      ( triangle_params.x + 2 )*scaling_factor,
      triangle_params.y*scaling_factor,
      (triangle_params.x + 1)*scaling_factor,
      (triangle_params.y + 2 * sign )*scaling_factor);
}

void draw() {

  //triangle_params =
  //int x1 = 150;
  //int x2 = 150;

  HashMap<Triangle, Boolean> allTriangles = new HashMap<Triangle, Boolean>();

  Triangle currentTriangle = new Triangle(10, 10, true);
  drawTriangle(currentTriangle);

  // for (int i =0;i<30;i++) {
    currentTriangle = currentTriangle.getNextTriangle(allTriangles);
    drawTriangle(currentTriangle);
  // }
}
