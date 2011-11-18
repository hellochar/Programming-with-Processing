void setup() {
  size(500, 500);
  background(255); smooth();
}

List<point> points = new ArrayList();

void draw() {
//  fill(255, 2);
//  rect(0, 0, width, height);
  background(0);
  for(point l : points) {
    l.draw();
  }
}

void mouseDragged() {
  if(mouseButton == RIGHT)
    points.add(new point(mouseX, mouseY));
}

public class point {
  float x1, y1;
  float dx, dy;
  public point(float x1, float y1) {
    this.x1 = x1;
    this.y1 = y1;
    dx = dy = 0;
  }
  
  public void draw() {
    jitter();
    if(mousePressed && mouseButton == LEFT)
      attract();
    float xn = x1, yn = y1;
    x1 += dx *= .98f;
    y1 += dy *= .98f;
    colorMode(HSB);
    stroke(map(atan2(dy, dx), -PI, PI, 0, 255), 255, dist(0, 0, dx, dy) * 25);
    line(x1, y1, xn, yn);
  }
  
  void jitter() {
    x1 += random(-2, 2);
    y1 += random(-2, 2);
  }
  
  void attract() {
    float dx = mouseX - x1,
          dy = mouseY - y1,
          dist = dist(0, 0, dx, dy);
    this.dx += dx / dist;
    this.dy += dy / dist;
  }
}
