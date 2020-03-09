
final int NAVE = 1;
final int PERSPECTIVA = 2;

int mode = NAVE;

SpaceShip ship;
Camera camera;

PShape nave_obj;

int FRONT_FACE = 0;
int RIGHT_FACE = 1;
int BACK_FACE = 2;
int LEFT_FACE = 3;

int current_view = 0;

void setup_navigation_system()
{
  PVector pos = new PVector(0, 0, 500);
  PVector dir = new PVector(0, 0, -1);
  PVector up = new PVector(0, 1, 0);
  
  float max_speed = 2;
  float distance = 500;
  
  camera = new Camera(pos, dir, up, distance);
  
  nave_obj = loadShape(".\\nave\\13884_UFO_Saucer_v1_l2.obj");
  
  ship = new SpaceShip(pos, dir, up, max_speed, camera, nave_obj);
  
  
}

void draw_navigation_system()
{
  ship.update(mode == NAVE);
  
  if(keyPressed)
  {
    
    if(Character.toLowerCase(key) == 'w') ship.pitch(radians(+1));
    if(Character.toLowerCase(key) == 's') ship.pitch(radians(-1));
    if(Character.toLowerCase(key) == 'a') ship.yaw(radians(-1));
    if(Character.toLowerCase(key) == 'd') ship.yaw(radians(+1));
    
    if(Character.toLowerCase(key) == 'q') ship.roll(radians(-1));
    if(Character.toLowerCase(key) == 'e') ship.roll(radians(+1));
    
    if(key == CODED)
    {
      if(keyCode == UP) ship.accelerate(0.1);
      if(keyCode == DOWN) ship.brake(0.05);
    }
  }
}

void keyPressedHandler_navigation_system()
{
  if(key == CODED)
  {
    if(keyCode == CONTROL) ship.emergencyBrake();
    
    if(keyCode == LEFT) {
      current_view -= 1;
      camera.yrotate(radians(-90));
    }
    if(keyCode == RIGHT) {
      current_view += 1;
      camera.yrotate(radians(+90));
    }
    current_view = current_view % 4;
    current_view = current_view < 0 ? 4 + current_view: current_view;
  }
  if(Character.toString(key).equals(Integer.toString(PERSPECTIVA))) {
    mode = PERSPECTIVA;
    perspective();
    
    camera(); // reset camera
  }
  if(Character.toString(key).equals(Integer.toString(NAVE))) mode = NAVE;
}
