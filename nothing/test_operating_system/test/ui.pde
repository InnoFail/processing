class data_ui{
 list<String> ui_id,ui_class,ui_hash;
 list<ui> ui_object;
 
  data_ui(){
   this.ui_id = new list<String>();
   this.ui_class = new list<String>();
   this.ui_hash = new list<String>();
   this.ui_object = new list<ui>();
  }
  
  void add(ui u,String id,String ui_class){
    this.ui_object.add(u);
    this.ui_id.add(id);
    this.ui_class.add(ui_class);
    this.ui_hash.add(Integer.toString(u.hashCode()));
    int p= this.ui_object.size();
    int q=this.ui_id.size();
    int r=this.ui_class.size();
    int s=this.ui_hash.size();
    if( p!=q || p!=r || p!=s || q!=r || q!=s || r!=s){
      throw new java.lang.Error("list of ui,id,class or hash doesnot contain equal number of element.");
    }
  }
  
  ui get_object_by_hash(String hash){
    for(int i=0;i<this.ui_hash.size();i++){
      if(hash.equals(this.ui_hash.get(i))){
       return this.ui_object.get(i); 
      }
    }
    return null;
  }
  
  ui get_object_by_id(String id){
    for(int i=0;i<this.ui_id.size();i++){
      if(id.equals(this.ui_id.get(i))){
       return this.ui_object.get(i); 
      }
    }
    return null;
  }
  
  list<ui> get_object_by_class(String ui_class){
    list<ui> p=new list<ui>();
    for(int i=0;i<this.ui_class.size();i++){
      if(ui_class.equals(this.ui_class.get(i))){
       p.add(this.ui_object.get(i)); 
      }
    }
    return p;
  }
  
  String get_hash_by_object(ui u){
    return Integer.toString(u.hashCode());
  }
  
  String get_class_by_hash(String hash){
    for(int i=0;i<this.ui_hash.size();i++){
      if(hash.equals(this.ui_hash.get(i))){
       return this.ui_class.get(i); 
      }
    }
    return null;
  }
  
  String get_id_by_hash(String hash){
    for(int i=0;i<this.ui_hash.size();i++){
      if(hash.equals(this.ui_hash.get(i))){
       return this.ui_id.get(i); 
      }
    }
    return null;
  }

}



public data_ui du = new data_ui();

class ui{
  ArrayList<Float> child;
  ArrayList<ui> child_;
  float xPos,yPos,h,w;
  color c1,c2 = color(1,0);
  float weight;
  boolean vert;
  int self_count;
  ui parent;
  float anim_frameCount=0;
  int transition_dir=1;
  char[] ch;
  IntDict i_char;
  float extraX,extraY,text_h;
  String default_text;
  edit e;
  color text_color = color(0,0,0);
   
   
   /*
   All Functions and constructors are:-
   -> ui(boolean vert)
   -> ui(boolean vert,float x,float y,float w,float h)
   -> ui(boolean vert,String[] id_class)
   -> ui(boolean vert,float x,float y,float w,float h,String[] id_class)
   -> private void pos(float x,float y)
   -> void update_child()
   -> private void lay_weight(float weight)
   -> void up_to_date()
   -> void up_to_date(boolean b)
   -> private void self_c(int count)
   -> private void parent(ui p)
   -> void ui_c(color c)
   -> void update()
   ->void def_text(String txt)
   -> float c_X(float x)
   -> float c_Y(float y)
   -> float weight()
   -> ui copy_(float weight,boolean vert)
   -> boolean collision(float x,float y)
   ->void write(String s)
   ->boolean anim(float time,float del)
   ->ui add_in_(float weight,boolean vert) //add a new child
   ->ui c() returns reference to child
   ->ui add_in_(float weight,boolean vert,String id)
   ->ui add_in_(float weight,boolean vert,String[] id_class)
   
  /* 
      This class has two constructors.
    ui(boolean) constructor creates an object on the basis of condition that the child should be kept horizontal or vertical and all other are default values 
   */
  ui(boolean vert){
    this.child=new ArrayList<Float>();
    this.child_=new ArrayList<ui>();
    this.xPos=0;
    this.yPos=0;
    this.w=width;
    this.h=height;
    this.c1=color(0,0,0,1);
    this.weight=1;
    this.vert=vert;
    this.text_h=15;
    this.parent=this;
    this.ch=new char[1000];
    this.default_text=new String();
    this.e=new edit();
    du.add(this,"","");
    for(int i=0;i<ch.length;i++){
      ch[i]=" ".charAt(0);
    }
    this.i_char=new IntDict();
    this.extraX=this.extraY=0;
  }
  
  /* 
  ui(boolean,float,float,float,float) constructor creates an object on the basis of condition that the child should be kept horizontal or vertical and starting position of layout and its height and width
   -> you can eventually use this to make custom layout or dialog boxes or scrolling layout
   */
  
  ui(boolean vert,float x,float y,float w,float h){
    this.child=new ArrayList<Float>();
    this.child_=new ArrayList<ui>();
    this.xPos=x;
    this.yPos=y;
    this.w=w;
    this.h=h;
    this.c1=color(0,0,0,1);
    this.weight=1;
    this.vert=vert;
    this.text_h=15;
    this.parent=this;
    this.ch=new char[1000];
    this.default_text=new String();
    this.e=new edit();
    du.add(this,"","");
    for(int i=0;i<ch.length;i++){
      ch[i]=" ".charAt(0);
    }
    this.i_char=new IntDict();
    this.extraX=this.extraY=0;
  }
  
  
   ui(boolean vert,String id,String ui_class){
    this.child=new ArrayList<Float>();
    this.child_=new ArrayList<ui>();
    this.xPos=0;
    this.yPos=0;
    this.w=width;
    this.h=height;
    this.c1=color(0,0,0,1);
    this.weight=1;
    this.vert=vert;
    this.text_h=15;
    this.parent=this;
    this.ch=new char[1000];
    this.default_text=new String();
    this.e=new edit();
    du.add(this,id,ui_class);
    for(int i=0;i<ch.length;i++){
      ch[i]=" ".charAt(0);
    }
    this.i_char=new IntDict();
    this.extraX=this.extraY=0;
  }
  
   ui(boolean vert,float x,float y,float w,float h,String id,String ui_class){
    this.child=new ArrayList<Float>();
    this.child_=new ArrayList<ui>();
    this.xPos=x;
    this.yPos=y;
    this.w=w;
    this.h=h;
    this.c1=color(0,0,0,1);
    this.weight=1;
    this.vert=vert;
    this.text_h=15;
    this.parent=this;
    this.ch=new char[1000];
    this.default_text=new String();
    this.e=new edit();
    du.add(this,id,ui_class);
    for(int i=0;i<ch.length;i++){
      ch[i]=" ".charAt(0);
    }
    this.i_char=new IntDict();
    this.extraX=this.extraY=0;
  }
  
  /*
  It has some private functions that only this object and its parent can access
  -> postion of child formes
  ->layout weight of child
  -> self count in the position of placement and the reference to its parent
  
  apart of that there are functions that help update child and its parent when its layout weight is changed
  */
  
   private ui pos(float x,float y){
     this.xPos=x;
     this.yPos=y;
     return this;
   }
   
   ui update_child(){
     for(int i=0;i<this.child_.size();i++){
       this.child_.get(i).up_to_date();
     }
     return this;
   }
   
   private void lay_weight(float weight){
     this.weight=weight;
     this.parent.child.set(this.self_count,weight);
     this.up_to_date();
     this.parent.update_child();
   }
   
   ui up_to_date(){
     if(this.parent!=this){
     float xx,yy;
    xx=this.parent.xPos;
    yy=this.parent.yPos;
    for(int i=0;i<this.self_count;i++){
      if(!this.parent.vert){
      xx+=((float)(this.parent.child.get(i)))*this.parent.weight()*this.parent.w;
      yy=this.parent.yPos;
      }else if(this.parent.vert){
      yy+=((float)(this.parent.child.get(i)))*this.parent.weight()*this.parent.h;
      xx=this.parent.xPos;
      }
    }
    this.pos(xx,yy);
    if(this.parent.vert){
    this.h=((float)this.parent.child.get(this.self_count))*this.parent.weight()*this.parent.h;
    this.w=this.parent.w;
    }else if(!this.parent.vert){
    this.w=((float)this.parent.child.get(this.self_count))*this.parent.weight()*this.parent.w;
    this.h=this.parent.h;
    }
     }
     return this;
   }
   
   private void self_c(int count){
     this.self_count=count;
   }
   
   private void parent(ui p){
     this.parent=p;
   }
   
   /* to provide color of the ui*/
   ui ui_c(color c){
     this.c1=c;
     return this;
   }
   
   ui ui_s(color c){
     this.c2=c;
     return this;
   }
   
   ui ui_tc(color c){
     this.text_color=c;
     return this;
   }
   
  /* update the whole ui*/
  
  void update(){
  push();
  fill(this.c1);
  stroke(this.c2);
  rect(this.xPos,this.yPos,this.w,this.h);
  pop();
  }
  
  
  
  
  ui def_text(String txt){
    this.default_text=txt;
    return this;
  }
  
  /*
  Here are some functions that user can access 
  ->c_X(float)and c_Y(float) to constrain a point coordinate within its layout dimensions
  ->weight() to change its weight
  */
  float c_X(float x){
    return constrain(x,this.xPos,this.xPos+this.w);
  }
  
  float c_Y(float y){
    return constrain(y,this.yPos,this.yPos+this.h);
  }
  
  float weight(){
    float p=0;
    for(int i=0;i<this.child.size();i++){
      p+=this.child.get(i);
    }
    return 1/p;
  }
  
  /*
  ->This copy_(float ,boolean) is used to make a child with given weight and if child should contain its child horizontally or vertically
  ->collision(float ,float ) to test if a point is inside it
  */
  
  ui copy_(float weight,boolean vert){
    this.child.add(weight);
    ui n=new ui(vert);
    n.parent(this);
    n.self_c(this.child.size()-1);
    n.lay_weight(weight);
    float xx,yy;
    xx=this.xPos;
    yy=this.yPos;
    if(n.self_count==0){
    xx=this.xPos;
    yy=this.yPos;
    }else{
    for(int i=0;i<n.self_count;i++){
      if(!this.vert){
      xx+=((float)(this.child.get(i)))*this.weight()*this.w;
      yy=this.yPos;
      }else if(this.vert){
      yy+=((float)(this.child.get(i)))*this.weight()*this.h;
      xx=this.xPos;
      }
     
    }
    }
    n.pos(xx,yy);
    if(this.vert){
    n.h=((float)this.child.get(n.self_count))*this.weight()*this.h;
    n.w=this.w;
    }else if(!this.vert){
    n.w=((float)this.child.get(n.self_count))*this.weight()*this.w;
    n.h=this.h;
    }
    this.child_.add(n);
    return n;
  }
  
  boolean collision(float x,float y){
    if(x>this.xPos && x<this.xPos+this.w && y>this.yPos && y<this.yPos+this.h){
      return true;
    }
    return false;
  }
  
  boolean collision_box(float x,float y,float w,float h){
    if(x>this.xPos && x+w<this.xPos+this.w && y>this.yPos && y+h<this.yPos+this.h){
      return true;
    }
    return false;
  }
  
  /*
  ->up_to_date(boolean) to update itself on a given condition and calls up_to_date() if condition is true
  ->write(String , int[], float, float) to start to write from (x,y) and restrict to layout(w,h)
    write(String , int[],float ,float, float, float) is used to restrict to acertain dimension (x,y,w,h)
  ->void write(String s)
  ->anim(boolean, float, float) to animate blinking on a condition, given time and for how much time
  ->anim_h(String s,boolean b,float a1,float a2,float delt,float delw) ,s can be "h","w","x","y","lay"
  ->boolean anim(float time,float del)
  */



void up_to_date(boolean b){
if(b){
  this.up_to_date();
}else{
  this.up_to_date();

}
}

String write(String s){
  this.e.edit_text=s;
  this.e.x=(int)this.xPos+(int)this.extraX;
  this.e.y=(int)this.yPos+(int)this.extraY;
  this.e.bound_x=(int)this.xPos+(int)this.w-10;
  this.e.bound_y=(int)this.yPos+(int)this.h+(int)this.text_h;
  this.e.c = this.text_color;
  this.e.text_();
  if(mousePressed){
    int p1=(int)this.xPos+(int)this.extraX,p2=(int)this.yPos+(int)this.extraY+(int)this.text_h,p3=0;
    for(char i: s.toCharArray()){
      if(i == '\n'){
       p2+= this.text_h; 
       p1 = (int)this.extraX;
      }else{
       p1+= textWidth(i); 
      }
      p3++;
      int delx = 3, dely = (int)this.text_h;
      if(p1 >= mouseX-delx && p1 <= mouseX+delx && p2 >= mouseY-dely && p2 <= mouseY+dely){
        this.e.extra = -this.e.pos+p3;
      }
    }
  }
  return this.e.edit_text;
}

ui txt(boolean b){
  push();
  fill(this.text_color);
  if(b){
    text(this.default_text,this.xPos,this.yPos,this.w,this.h);
  }else{
    text(this.default_text,this.xPos+this.w/2-textWidth(this.default_text)/2,this.yPos+this.h/2);
  }
  pop();
  return this;
}



boolean anim(float time,float del){
  int t_from_s=millis();
  if(t_from_s % time>del){
    return true;
  }
  return false;
}

/* void add_in_() to add new child
   ui c() returns reference to child*/

ui add_in_(float weight,boolean vert){
  this.copy_(weight,vert);
  return this.c(this.child.size()-1);
}

ui c(int i){
  if(i>this.child_.size()-1){
   return this; 
  }
  return this.child_.get(i);
}

ui add_in_(float weight,boolean vert,String id){
  this.copy_(weight,vert);
  ui p = this.c(this.child.size()-1);
  du.add(p,id,"");
  return p;
}


ui add_in_(float weight,boolean vert,String id,String ui_class){
  this.copy_(weight,vert);
  ui p = this.c(this.child.size()-1);
  du.add(p,id,ui_class);
  return p;
}

ui c_id(String id){
 return du.get_object_by_id(id);
}

list<ui> c_class(String ui_class){
 return du.get_object_by_class(ui_class); 
}

}


/* Simple example

ui u,menu,v,w,area,run;
helper h;
String txt = "Hel\nlosjhdjsh/n sjad sadjd\n sdji \nsdan";
String[] code_func,code_draw;
boolean changed = true, code_run=false;
String func_str="",draw_str="";

void setup(){
  size(300,400);
  init_controls();
  noStroke();
  h = new helper();
  u = new ui(h.vert);
  u.ui_c(h.n_red);
  menu = u.add_in_(1,h.hor);
  v = menu.add_in_(1,h.hor).ui_c(h.white).ui_s(h.black).def_text("code_func.txt").ui_tc(h.n_red);
  w = menu.add_in_(1,h.hor).ui_c(h.white).ui_s(h.black).def_text("code_draw.txt");
  area = u.add_in_(9,h.vert).ui_c(h.n_blue);
  run = new ui(h.hor,width-50,height-25,50,25).ui_c(h.n_green).def_text("run");
  
  code_func = loadStrings("code_func.txt");
  code_draw = loadStrings("code_draw.txt");
  
  for(String i : code_func){
    func_str += "\n"+i;
  }
  
  for(String i : code_draw){
    draw_str += "\n"+i;
  }
  
}


void draw(){
  background(0);
  
  u.update();
  area.update();
  
   if(changed && !code_run){
    func_str = area.write(func_str);
  }else if(!code_run){
    draw_str = area.write(draw_str);
  }
  
  
  
  h.update(new ui[]{menu,v,w,run});
  h.up_to_date(new ui[]{area,v,w,menu},true);
  v.txt(false);
  w.txt(false);
  run.txt(false);
  if(h.mOnce()){
    if(v.collision(mouseX,mouseY)){
      changed = true;
    }else if(w.collision(mouseX,mouseY)){
      changed = false;
    }
    if(run.collision(mouseX,mouseY)){
      code_run = true;
    }else{
     code_run = false; 
    }
  }
  
 
  if(mouseroll){
    area.extraY -= scroll_num*3;
  }
  text("30\u00B0", 150, 60);
  controls_update();
}

*/
