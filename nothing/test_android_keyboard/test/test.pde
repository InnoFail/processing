keyboard k;
ui u,v;
helper help;
float a=0,b=0;

void setup(){
  size(300,400);
  help=new helper();
  
  u=new ui(help.vert);
  u.add_in_(3,help.vert);
  u.add_in_(7,help.vert);
  u.c(0).ui_c(help.v);
  u.c(1).ui_c(help.g);
  u.c(1).def_text("Hello");
}

void draw(){
  background(255);
  u.update();
  if(u.c(1).anim(5000,50)){
    u.c(1).ui_c(help.n_red);
  }else{
    u.c(1).ui_c(help.n_green);
  }
  u.c(0).update();
  u.c(1).update();
  u.c(1).txt();
}
 
