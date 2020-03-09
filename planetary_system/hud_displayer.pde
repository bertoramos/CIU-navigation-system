
PImage manual;
boolean display_manual;

PImage front; // 0
PImage right; // 1 -3
PImage back; // 2 -2
PImage left; // 3 -1

PImage accelerometer;

void setup_hud() {
  manual = loadImage(".\\img\\hud_img\\manual.png"); // 877 x 459
  manual.resize(round(877/1.5), round(459/1.5));
  display_manual = false;
  
  front = loadImage(".\\img\\hud_img\\frontal.png"); // 1865 x 1305
  float rel = 1865.0/1305.0;
  front.resize(round(900.0*rel), round(900));
  
  accelerometer = loadImage(".\\img\\hud_img\\accelerometer.png"); // 79 x 79
  accelerometer.resize(200, 200);
  
  rel = 4232.0/1800.0;
  back = loadImage(".\\img\\hud_img\\fondo.png"); // 4232 x 1800
  back.resize(round(1000.0*rel), round(1000));
  
  rel = 2500.0/1667.0;
  left = loadImage(".\\img\\hud_img\\lateral_A.png"); // 1800 x 900
  
  right = loadImage(".\\img\\hud_img\\lateral_B.png"); // 1800 x 900
}

void draw_hud() {
  if(mode != NAVE) return;
  
  float x = (width - front.width)/2.0;
  if(current_view == FRONT_FACE) {
    displayImageHUD(front, x, 0);
    
    displayImageHUD(accelerometer, (width - accelerometer.width)-20, +20);
    int percentage = round(100.0*ship.speed()/(ship.max_speed()));
    
    textSize(20);
    displayTextHUD(percentage + "%", (width - accelerometer.width)+50, +130, color(77, 141, 175));
  }
  
  if(current_view == BACK_FACE) displayImageHUD(back, -275, 0);
  
  if(current_view == RIGHT_FACE) displayImageHUD(right, 0, 0);
  if(current_view == LEFT_FACE) displayImageHUD(left, 0, 0);
  
  if(display_manual) displayImageHUD(manual, 0, height - manual.height);
  else displayTextHUD("Press M to open manual", 0, height - 20, color(0));
  
}

void keyHandlerHUD() {
  if(Character.toLowerCase(key) == 'm') display_manual = !display_manual;
  
}
