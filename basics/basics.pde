void setup() {
  size(400, 300);
  background(128);
}

void draw() {
  fill(255, frameCount % 255, 0);
  ellipse(mouseX, mouseY, 50, 50);
  line(pmouseX, pmouseY, mouseX, mouseY);
  rect(random(width), random(height), 10, 10);
}

void keyPressed() {}
void keyReleased() {}
void keyTyped() {}
void mousePressed() {}
void mouseDragged() {}
void mouseReleased() {}
void mouseClicked() {}
