
PVector XRotation(PVector p, float angle) {
  float x, y, z;
  x = p.x;
  y = p.y*cos(angle) + p.z*sin(angle);
  z = -p.y*sin(angle) +p.z*cos(angle);
  return new PVector(x, y, z);
}

PVector YRotation(PVector p, float angle) {
  float x, y, z;
  x = p.x*cos(angle) - p.z*sin(angle);
  y = p.y;
  z = p.x*sin(angle) + p.z*cos(angle);
  return new PVector(x, y, z);
}

PVector ZRotation(PVector p, float angle) {
  float x, y, z;
  x = +p.x*cos(angle) + p.y*sin(angle);
  y = -p.x*sin(angle) + p.y*cos(angle);
  z = +p.z;
  return new PVector(x, y, z);
}

PVector RotateU(PVector dir, PVector u, float angle)
{
  PVector n = new PVector(0, 0, 0);
  
  PVector c1 = new PVector(cos(angle) + u.x*u.x*(1 - cos(angle)),
                           u.y*u.x*(1 - cos(angle)) + u.z*sin(angle),
                           u.z*u.x*(1 - cos(angle)) - u.y*sin(angle)
                          );
  PVector c2 = new PVector(u.x*u.y*(1 - cos(angle)) - u.z*sin(angle),
                           cos(angle) + u.y*u.y*(1 - cos(angle)),
                           u.z*u.y*(1 - cos(angle)) + u.x*sin(angle)
                          );
  PVector c3 = new PVector(u.x*u.z*(1 - cos(angle)) + u.y*sin(angle),
                           u.y*u.z*(1 - cos(angle)) - u.x*sin(angle),
                           cos(angle) + u.z*u.z*(1 - cos(angle))
                          );
                          
  n.x = PVector.dot(dir, c1);
  n.y = PVector.dot(dir, c2);
  n.z = PVector.dot(dir, c3);
  
  return n;
}

PVector perpendicular(PVector a, PVector b) {
  PVector res = new PVector();
  PVector.cross(a, b, res);
  return res;
}
