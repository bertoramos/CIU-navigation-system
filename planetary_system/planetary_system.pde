
void setup() {
  size(1800, 900, P3D);
  //fullScreen(P3D);
  
  textSize(20);
  text("Loading planetary system ... ", width/2-40, height/2);
  
  bg = loadImage(".\\img\\background\\bg.jpg");
  bg.resize(width, height);
  
  setup_planetary_system();
  setup_navigation_system();
  setup_hud();
}

void keyPressed() {
  keyPressedHandler_planetary_system();
  keyPressedHandler_navigation_system();
  keyHandlerHUD();
}


void draw() {
  background(bg);
  
  rotateX(-2*PI/16);
  translate(width/2, height/2);
  
  draw_navigation_system();
  draw_planetary_system();
  draw_hud();
}
