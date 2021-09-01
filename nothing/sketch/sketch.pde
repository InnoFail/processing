use u;

void setup(){
  size(300,400,P3D);
  u=new use();
}

void draw(){
  background(0);
  u.draw();
  u.update();
}
