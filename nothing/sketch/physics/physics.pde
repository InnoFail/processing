
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





class play{
  
  float gravity,accn,velocity,time;
  float x,y;
  boolean stop=false;
  
  play(float x,float y){
    this.x=x;
    this.y=y;
    this.gravity=1;
    this.accn=0;
    this.velocity=0;
    this.time=0;
  }
  
 void update(){
   if(!this.stop){
   this.x+=this.accn*this.time*this.time;
   this.y+=this.gravity*this.time*this.time;
   this.time+=0.1;
 }
 }
 
 void stop(){
  this.stop=true; 
 }
 
 void start(){
  this.stop=false; 
 }
 
 
 boolean collision(list<Float> x,list<Float> y,float c_x,float c_y,float x_check,float y_check){
   if(x.size()==y.size()){
     for(int i=0;i<x.size()-1;i++){
      float p1=x.get(i)-x.get(i+1);
      float p2=y.get(i)-y.get(i+1);
      float p3=x.get(i)-c_x; 
      float p4=y.get(i)-c_y; 
      float p5=x.get(i)-x_check; 
      float p6=y.get(i)-y_check; 
      float a1=p1*p4-p2*p3;
      float a2=p1*p6-p2*p5;
      if(!((a1>0 && a2>0) || (a1<0 && a2<0))){
        return false;
      }
     }
     return true;
   }
   return false;
 }
 
 
  
}
