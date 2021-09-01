keyboard k;

void setup(){
  size(300,400);
  noStroke();
  k=new keyboard();
}


void draw(){
  background(0);
  k.update();
  println(k.character());
}
