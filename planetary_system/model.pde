
class Star {
  
  private float radius;
  private float angle;
  private PShape shape;
  
  Star(float radius, PImage texture) {
    this.radius = radius;
    this.angle = 0;
    
    this.shape = createShape(SPHERE, radius);
    this.shape.setTexture(texture);
    this.shape.setStroke(false);
    this.shape.setFill(false);
  }
  
  Star(float radius) {
    this.radius = radius;
    this.angle = 0;
    
    this.shape = createShape(SPHERE, radius);
  }
  
  void move(float speed) {
    this.angle += speed;
  }
  
  void draw(String txt, color col, float txt_size, float hint_space) {
    fill(col);
    textSize(txt_size);
    textMode(SHAPE);
    text(txt, 0, -this.radius - hint_space, 0);
    fill(255);
    
    rotateY(this.angle);
    shape(this.shape);
  }
  
}

class Astro {
  
  public float distance;
  private PShape shape;
  
  public float rotation;
  public float translation;
  
  private float radius;
  
  Astro(float distance, float radius) {
    this.distance = distance;
    this.radius = radius;
    this.shape = createShape(SPHERE, radius);
    
    this.rotation = 0;
    this.translation = 0;
  }
  
  Astro(float distance, float radius, PImage texture) {
    this.distance = distance;
    this.shape = createShape(SPHERE, radius);
    this.shape.setTexture(texture);
    this.shape.setStroke(false);
    this.shape.setFill(false);
    
    this.rotation = 0;
    this.translation = 0;
  }
  
  void move(float rotation, float translation) {
    this.rotation += rotation;
    this.translation += translation;
  }
  
  void draw(Astro[] parent, String txt, color col, float txt_size, float hint_space) {
    rotateY(this.translation);
    translate(this.distance, 0);
    rotateY(this.rotation);
    shape(this.shape);
    
    
    pushMatrix();
      for(Astro a : parent) {
        rotateY(-a.translation);
        rotateY(-a.rotation);
      }
      rotateY(-this.translation);
      rotateY(-this.rotation);
      
      textMode(SHAPE);
      fill(col);
      textSize(20);
      text(txt, 0, - this.radius - hint_space, 0);
      fill(255);
    popMatrix();
  }
  
  void draw(Astro[] parent, float[][] undo_rotation, String txt, color col, float txt_size, float hint_space) {
    rotateY(this.translation);
    translate(this.distance, 0);
    rotateY(this.rotation);
    shape(this.shape);
    
    
    pushMatrix();
      for(Astro a : parent) {
        rotateY(-a.translation);
        rotateY(-a.rotation);
      }
      rotateY(-this.translation);
      rotateY(-this.rotation);
      for(float e: undo_rotation[0]) rotateX(-e);
      for(float e: undo_rotation[1]) rotateY(-e);
      for(float e: undo_rotation[2]) rotateZ(-e);
      
      textMode(SHAPE);
      fill(col);
      textSize(20);
      text(txt, 0, - this.radius - hint_space, 0);
      fill(255);
    popMatrix();
  }

}

class StatSatellite {
  
  private float distance;
  private PShape shape;
  
  StatSatellite(float distance) {
    this.distance = distance;
    this.shape = loadShape(".\\Satellite\\10477_Satellite_v1_L3.obj");
    this.shape.scale(0.01);
  }
  
  void draw(Astro[] parent, String txt, color c, float txt_size, float hint_space) {
    translate(this.distance, 0);
    rotateY(PI/2);
    shape(this.shape);
    
    pushMatrix();
      for(Astro a : parent) {
        rotateY(-2*PI/4);
        rotateY(-a.translation);
        rotateY(-a.rotation);
      }
      
      textMode(SHAPE);
      fill(c);
      textSize(txt_size);
      text(txt, 0, -hint_space, 0);
      fill(255);
    popMatrix();
  }
  
}
