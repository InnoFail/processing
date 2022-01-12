
token t;
edit e;
ui u,v;
helper help;
String s=new String();
keyboard k;
ui_process uip;


void setup(){
  //All the initials
  size(300,400);
  noStroke();
  init_controls();
  ////Initial;izations
  //uip= new ui_process("ab.csv");
  help = new helper();
  v=new ui(true,"hello","");
  v.ui_c(color(124,0,0));
  v.add_in_(1,true,"","wow").ui_c(255);
  v.add_in_(1,true,"","wow").ui_c(155);
  /*k=new keyboard();
  help=new helper();
  u=new ui(help.vert,0,0,width,height);
  u.ui_c(help.b);
  p=new play(50,50);
  t=new token();
  e=new edit();
  e.x=width/2;*/
  textSize(text_height);
}

void draw(){
  background(0);
  v.update();
  help.update(v,"wow");
  //help.update(v.child_);
  //uip.update();
 /* u.update();
  u.write(k.character());
  if(keycl){
    if(spkeycl.equals("e")){
      s+="`";
    }else if(spkeycl.equals("b")){
      if(s.length()!=0){
      s=s.substring(0,s.length()-1);
      }
    }else{
    s+=keyclp;
    }
  }
    k.update();*/
  //should be at the end of the code
    controls_update();
}
