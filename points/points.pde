void setup() {
  size(500, 500);
  background(255); smooth();
//  strokeWeight(5);
  for(int i = 0; i < 250; i++) {
    points.add(new Point(random(width), random(height)));
  }
}

List<Point> points = new ArrayList();

void draw() {
//  fill(255, 2);
//  rect(0, 0, width, height);
  background(0);
  for(Point l : points) {
    l.draw();
  }
}

void mouseDragged() {
  if(mouseButton == RIGHT)
    points.add(new Point(mouseX, mouseY));
}

public class Point {
  float x, y;
  float dx, dy;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
    dx = dy = 0;
  }
  
  public void draw() {
    jitter();
    if(mousePressed && mouseButton == LEFT)
      attract();
    float xn = x, yn = y;
    x += dx *= .98f;
    y += dy *= .98f;
    colorMode(HSB);
    stroke(map(atan2(dy, dx), -PI, PI, 0, 255), 255, dist(0, 0, dx, dy) * 50);
    line(x, y, xn, yn);
    
    stroke(255);
/*    Point n = nearest();
    line(x, y, n.x, n.y);*/
    for(Point p : within(10)) {
      line(x, y, p.x, p.y);
    }
  }
  
  void jitter() {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  
  void attract() {
    float dx = mouseX - x,
          dy = mouseY - y,
          dist = dist(0, 0, dx, dy);
    this.dx += dx / dist;
    this.dy += dy / dist;
  }
  
  Set<Point> within(float rad) {
    Set<Point> s = new HashSet();
    for( Point pt : points) {
      if(pt == this) continue;
      if(dist(x, y, pt.x, pt.y) < rad) s.add(pt);
    }
    return s;
  }
//  
//  Point nearest() {
//    Point p = null;
//    for(Point pt : points) {
//      if(p == null) p = pt;
//      if(pt == this) continue;
//      if(dist(x, y, pt.x, pt.y) < dist(x, y, p.x, p.y)) {
//        p = pt;
//      }
//    }
//    return p;
//  }
}
