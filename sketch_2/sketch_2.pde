PShader sd;

void setup() {
  size(1600, 900, P2D);
  sd = loadShader("shader.glsl");
}
void draw() {
  sd.set("time", millis() / 1000.0);
  sd.set("resolution", (float)width, (float)height);
  sd.set("mouse", (float)mouseX / (float)width - 0.5, (float)mouseY / (float)height - 0.5);
  shader(sd);
  rect(0, 0, width, height);
}

void keyPressed() {
  if(key == 's') {
    screenshot();
  }
}

int count_screenshot = 0;
void screenshot() {
  String path = dataPath("") + "/screenshot/screenshot-" + count_screenshot + ".png";
  save(path);
  count_screenshot++;
}
