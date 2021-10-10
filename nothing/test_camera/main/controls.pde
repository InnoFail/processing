//All the controlling functions of KeyBoard and mouse


String keyp,mousep,keyclp,spkey,spkeycl;
final String keymf=new String("");
boolean keyisp=false,mouseisp=false,mouseisd=false,keycl=false,mousecl=false,mouseroll;
float delx,dely,time,scroll_num;
int text_height=15;

//camera-----------------------
float fore,side,up;
float alpha,beta,gamma;
vector eye,to_view,mediate,st_med;

void camera_setup(){
 fore=side=up=0;
 alpha=beta=gamma=0;
 eye=new vector(0,0,0);
 to_view=new vector(0,0,0);
 mediate=new vector(0,0,0);
 st_med=new vector(0,1,0);
}

void camera_p(){
 if(keyisp==true){
    if(mouseisp==false){
   switch(keyp){
    case "a":
    fore++;
    break;
    case "d":
    fore--;
    break;
    case "w":
    side++;
    break;
    case "s":
    side--;
    break;
    case "j":
    up--;
    break;
    case "k":
    up++;
    break;
   }
  }else{
   switch(keyp){
    case "w":
    alpha+=0.001;
    break;
    case "s":
    alpha-=0.001;
    break;
    case "a":
    beta-=0.001;
    break;
    case "d":
    beta+=0.001;
    break;
    case "j":
    gamma-=0.001;
    break;
    case "k":
    gamma+=0.001;
    break;
   }
  }
  }
   
  if(alpha>=360){
  alpha=0;
  }
  if(beta>=360){
  beta=0;
  }
  if(gamma>=360){
  gamma=0;
  }
 mediate.apply(mediate.n(fore,side,up));
 mediate.apply(mediate.rotx(alpha).roty(beta).rotz(gamma));
 eye.apply(eye.add(mediate));
 st_med.apply(st_med.rotx(alpha).roty(beta).rotz(gamma));
 to_view=eye.add(st_med.normalize().scalar_mul(10));
 println(alpha," ",beta," ",gamma);
 fore=side=up=0;
 st_med=new vector(0,1,0);
     //pushMatrix();
     //fill(0,255,0);
     //translate(100+eye.x,100+eye.y,100+eye.z);
     //box(10);
     //popMatrix();
     //pushMatrix();
     //fill(0,0,255);
     //translate(100+to_view.x,100+to_view.y,100+to_view.z);
     //box(10);
     //popMatrix();
 camera(eye.x, eye.y, eye.z, to_view.x,  to_view.y, to_view.z,0.0, 1.0, 0.0);
}

//------------------------------

void init_controls(){
     this.keyp=this.mousep=this.keyclp=this.spkey=this.spkeycl=new String();
 }

  
  
void controls_update(){
  this.delx=this.dely=0;
  this.keycl=false;
  this.mousecl=false;
  this.mouseroll=false;
  this.scroll_num=0;
  this.time+=1/frameRate;
  }
  
void keyPressed(){
  
  if(key==ENTER){
    this.spkey="e";
  }else if(key==BACKSPACE){
   this.spkey="b"; 
  }else if(key==SHIFT){
    this.spkey="sh";
  }else if(key==ALT){
   this.spkey="alt"; 
  }else{
   this.keyp=Character.toString(key);
  }
  this.keyisp=true;
}

void keyReleased(){
  this.keyclp=keyp;
  this.spkeycl=spkey;
  this.keyp=keymf;
  this.spkey=keymf;
  this.keyisp=false;
  this.keycl=true;
}

void mousePressed(){
  if(mouseButton==LEFT){
    this.mousep="l";
  }else if(mouseButton==RIGHT){
   this.mousep="r"; 
  }else{
   this.mousep="c"; 
  }
  this.mouseisp=true;
}

void mouseReleased(){
  this.mousep=keymf;
  this.mouseisp=false;
  this.mouseisd=false;
}

void mouseDragged(){
  if(mouseButton==LEFT){
    this.mousep="l";
  }else if(mouseButton==RIGHT){
   this.mousep="r"; 
  }else{
   this.mousep="c"; 
  }
    
  this.delx=mouseX-pmouseX;
  this.dely=mouseY-pmouseY;
  this.mouseisd=true;
}

void mouseClicked(){
 this.mousecl=true; 
}

void mouseWheel(MouseEvent event){
  this.mouseroll=true;
  this.scroll_num=event.getCount();
}

void edit(String s,int x,int y,int bound_x,int bound_y){
  if(s!=null){
  int px=x;
  int py=y;
  for(char c:s.toCharArray()){
    if(c=="`".charAt(0)){
      y+=text_height;
      x=px;
      continue;
    }
    text(c,x,y);
    x+=textWidth(c);
    if(x>bound_x){
      x=px;
      y+=text_height;
    }
    if(y>bound_y){
      y=py;
     break; 
    }
  }
  }
}


ArrayList<Float> float_arrayList(String s,float ...x){
  if(!s.equals("")){
  ArrayList<Float> x_array=new ArrayList<Float>();
  for(float x1:x){
   x_array.add(x1); 
  }
  return x_array;
  }
  return new ArrayList<Float>();
}

 list<Float> float_list(String s,float ...x){
  if(!s.equals("")){
  list<Float> x_array=new list<Float>();
  for(float x1:x){
   x_array.add(x1); 
  }
  return x_array;
  }
  return new list<Float>();
}
