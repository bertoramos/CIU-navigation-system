
class SpaceShip {
  
  private PVector pos;
  private PVector dir;
  private PVector up;
  
  private float speed;
  private float max_speed;
  
  private Camera camera;
  
  private PShape nave_obj;
    
  SpaceShip(PVector pos0, PVector dir0, PVector up0, float max_speed, Camera camera, PShape nave_obj) {
    this.pos = pos0.copy();
    this.dir = dir0.copy();
    this.up = up0.copy();
    
    this.speed = 0;
    this.max_speed = max_speed;
    
    this.camera = camera;
    
    this.nave_obj = nave_obj;
    this.nave_obj.scale(0.25);
  }
  
  public void accelerate(float s) {
    if(this.speed + s <= this.max_speed) this.speed += s;
    if(this.speed + s > this.max_speed) this.speed = this.max_speed;
  }
  
  public void brake(float s) {
    if(this.speed - s >= 0) this.speed -= s;
    else this.speed = 0;
  }
  
  public void emergencyBrake() {
    this.speed = 0;
  }
  
  public void yaw(float angle) { // girar: izquierda o derecha
    this.camera.yrotate(angle);
    this.dir = RotateU(this.dir, this.up, angle);
  }
  
  public void pitch(float angle) { // inclinar : subir o bajar
    this.camera.xrotate(angle);
    PVector perp = perpendicular(this.dir, this.up);
    this.dir = RotateU(this.dir, perp, angle);
    this.up = RotateU(this.up, perp, angle);
  }
  
  public void roll(float angle) { // rotar
    this.camera.zrotate(angle);
    this.up = RotateU(this.up, this.dir, angle);
  }
  
  public void update(boolean showCamera) {
    this.pos = PVector.add(this.pos, PVector.mult(dir, speed));
    this.camera.update(this.pos, !showCamera);
    
    if(!showCamera) {
      pushMatrix();
      
      float dim = 80;
      
      stroke(255);
      line(this.pos.x, this.pos.y, this.pos.z,
           this.pos.x + dim*this.dir.x, this.pos.y + dim*this.dir.y, this.pos.z + dim*this.dir.z
          );
      stroke(0);
      
      translate(this.pos.x, this.pos.y, this.pos.z);
      //sphere(5);
      rotateX(radians(90));
      shape(this.nave_obj);
      popMatrix();
    }
  }
  
  // get-set
  
  public PVector position() {
    return this.pos;
  }
  
  public PVector direction() {
    return this.dir;
  }
  
  public float speed() {
    return this.speed;
  }
  
  public float max_speed() {
    return this.max_speed;
  }
  
}
