

class helper{
  boolean key_pressed=true,mouse_pressed=true,enter=false,clicked=false;
 String s;
 ui u;
 color v,i,b,g,y,o,r,t,w;
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
  
void update(ui u,String ui_class){
    list<ui> ug = u.c_class(ui_class);
    for(int i=0;i<ug.size();i++){
    ug.get(i).update();
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
