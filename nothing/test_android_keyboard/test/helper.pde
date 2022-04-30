import java.util.regex.*;


class helper{
  boolean key_pressed=true,mouse_pressed=true,enter=false,clicked=false;
 String s;
 ui u;
 color v,i,b,g,y,o,r,t,w;
 color clear,white,black,grey,grey_1,grey_2,grey_3,grey_4,grey_5,n_red,n_blue,n_light_blue,n_sky_blue,n_yellow,n_green,n_orange,n_violet,n_pink,dye_blue,dye_sky_blue,dye_violet,dye_dark_pink,dye_pink,dye_light_pink,brick_red,brick_blue,brick_dark_blue,brick_violet,brick_pink,vb_blue,vb_aqua,vb_red,vb_orange,vb_yellow;
 color[] colors;
 boolean vert,hor;
  
  /* All functins and constructors
  -> helper()
  -> String key_()
  -> void edit(ui g,float x,float y)
  ->void edit(ui g,String s,float x,float y)
  -> void edit(ui g,float x,float y,float x1,float y1)
  -> void up_to_date(ui[] u,boolean b)
  -> void update(ui[] u)
  -> ui clicked(ArrayList<ui> v,boolean b)
  ->boolean mClick(ui u)
  */
 
  
  helper(){
    this.s=new String();
    this.u=null;
    this.v=color(139,0,255);
    this.i=color(46,43,95);
    this.b=color(0,0,255);
    this.g=color(0,255,0);
    this.y=color(255,255,0);
    this.o=color(255,127,0);
    this.r=color(255,0,0);
    this.t=color(0,0,0,1);
    this.w=color(255,255,255);
    this.vert=true;
    this.hor=false;
    
    
    this.clear = color(0,0,0,0);
  this.white = color(255);
  this.black = color(0,0,0);
  this.grey = color(80,80,80);
  
  this.grey_1 = color(189);
  this.grey_2 = color(159);
  this.grey_3 = color(105);
  this.grey_4 = color(66);
  this.grey_5 = color(45);
  
  this.n_red = color(249,59,47);
  this.n_blue = color(3,118,247);
  this.n_sky_blue = color(90,196,246);
  this.n_light_blue = color(52,166,214);
  this.n_yellow = color(252,200,3);
  this.n_green = color(78,213,95);
  this.n_orange = color(249,146,5);
  this.n_violet = color(87,82,208);
  this.n_pink = color(249,45,82);
  
  this.dye_blue = color(11,19,84);
  this.dye_sky_blue = color(22,91,170);
  this.dye_violet = color(161,85,185);
  this.dye_dark_pink = color(247,101,163);
  this.dye_pink = color(253,163,181);
  this.dye_light_pink = color(249,209,209);
  
  this.brick_dark_blue = color(88,100,146);
  this.brick_blue = color(118,171,187);
  this.brick_red = color(248,66,82);
  this.brick_violet = color(112,12,84);
  this.brick_pink = color(235,219,152);
  
  this.vb_orange = color(243,98,54);
  this.vb_blue = color(47,40,89);
  this.vb_aqua = color(26,154,140);
  this.vb_red = color(231,29,54);
  this.vb_yellow = color(231,213,76);
  
  this.colors = new color[]{this.white,this.black,this.grey,this.grey_1,this.grey_2,this.grey_3,this.grey_4,this.grey_5,this.n_red,this.n_blue,this.n_light_blue,this.n_sky_blue,this.n_yellow,this.n_green,this.n_orange,this.n_violet,this.n_pink,this.dye_blue,this.dye_sky_blue,this.dye_violet,this.dye_dark_pink,this.dye_pink,this.dye_light_pink,this.brick_red,this.brick_blue,this.brick_dark_blue,this.brick_violet,this.brick_pink,this.vb_yellow,this.vb_blue,this.vb_aqua,this.vb_red,this.vb_orange};
  
  }
  
  String key_(){
    if(keyPressed==true && this.key_pressed==true){
      this.key_pressed=false;
      return String.valueOf(key);
    }else if(keyPressed==false){
     this.key_pressed=true; 
    }
    return "";
  }
  
  Boolean mOnce(){
    if(mousePressed==true && this.mouse_pressed==true){
      this.mouse_pressed=false;
      return true;
    }else if(mousePressed==false){
     this.mouse_pressed=true; 
    }
    return false;
  }
  
  void edit(ui g,float x,float y){
   int[] srk={};
  this.s=this.s.concat(this.key_());
  g.write(this.s,srk,x,y);
  }
  

  
  void edit(ui g,String s,float x,float y){
   int[] srk={};
  this.s=this.s.concat(s);
  g.write(this.s,srk,x,y);
  }
  
  void edit(ui g,float x,float y,float x1,float y1){
   int[] srk={};
  this.s=this.s.concat(this.key_());
  g.write(this.s,srk,x,y,x1,y1);
  }
  
  void up_to_date(ui[] u,boolean b){
  for(int i=0;i<u.length;i++){
    u[i].up_to_date(b);
  }
}

void update(ui[] u){
  for(int i=0;i<u.length;i++){
    u[i].update();
  }
}

void update(ArrayList<ui> u){
    for(int i=0;i<u.size();i++){
    u.get(i).update();
  }
}
  


ui clicked(ArrayList<ui> v,boolean b){
  this.clicked=false;
  for(int i=0;i<v.size();i++){
    this.clicked|=v.get(i).collision(mouseX,mouseY);
   if(this.clicked && b){
     this.u=v.get(i);
     this.clicked=true;
     return this.u;
  }else{
   this.u=null; 
  }
  }
 return this.u; 
}

boolean mClick(ui u){
  return u.collision(mouseX,mouseY);
}

}
