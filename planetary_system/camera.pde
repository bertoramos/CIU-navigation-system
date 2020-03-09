
class Camera {
  private PVector eye; // Localizacion de la camara
  private PVector dir; // Direccion a la que mira la camara
  private PVector up; // Vector vertical a la camara
  
  private float distance;
  
  Camera(PVector pos, PVector dir, PVector up, float distance) {
    this.eye = pos;
    this.dir = dir;
    this.up = up;
    
    this.distance = distance;
  }
  
  public void update(PVector pos, boolean update_data_only) {
    // Punto al que mira la camara
    this.eye = pos;
    PVector fwd = PVector.add(eye, PVector.mult(this.dir, this.distance));
    if(!update_data_only)
      camera(eye.x, eye.y, eye.z,
             fwd.x, fwd.y, fwd.z,
              up.x,  up.y,  up.z);
  }
  
  public void xrotate(float angle)
  {
    PVector perp = perpendicular(this.dir, this.up);
    this.dir = RotateU(this.dir, perp, angle);
    this.up = RotateU(this.up, perp, angle);
  }
  
  public void yrotate(float angle)
  {
    this.dir = RotateU(this.dir, this.up, angle);
  }
  
  public void zrotate(float angle)
  {
    this.up = RotateU(this.up, this.dir, angle);
  }
  
}
