class ui{
  ArrayList<Float> child;
  ArrayList<ui> child_;
  float xPos,yPos,h,w;
  color c1;
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
   
   
   /*
   All Functions and constructors are:-
   -> ui(boolean vert)
   -> ui(boolean vert,float x,float y,float w,float h)
   -> private void pos(float x,float y)
   -> void update_child()
   -> private void lay_weight(float weight)
   -> void up_to_date()
   -> void up_to_date(boolean b)
   -> private void self_c(int count)
   -> private void parent(ui p)
   -> void ui_c(color c)
   -> void update()
   ->void txt(float x1,float y1)
   ->void txt()
   ->void def_text(String txt)
   -> float c_X(float x)
   -> float c_Y(float y)
   -> float weight()
   -> ui copy_(float weight,boolean vert)
   -> boolean collision(float x,float y)
   -> void anim(boolean b,float delt,float delw)
   -> void anim(float delt,float delw)
   ->void write(String s)
   ->anim(boolean, float, float) to animate blinking on a condition, given time and for how much time
   ->anim_h(String s,boolean b,float a1,float a2,float delt,float delw) ,s can be "h","w","x","y","lay"
   ->boolean anim(float time,float del)
   -> void write(String s,int[] pro,float x,float y)
   -> void write(String s,int[] pro,float x,float y,float w,float h)
   ->ui add_in_(float weight,boolean vert)
   ->ui c(int i) , for color*/
   
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
  
   private void pos(float x,float y){
     this.xPos=x;
     this.yPos=y;
   }
   
   void update_child(){
     for(int i=0;i<this.child_.size();i++){
       this.child_.get(i).up_to_date();
     }
   }
   
   private void lay_weight(float weight){
     this.weight=weight;
     this.parent.child.set(this.self_count,weight);
     this.up_to_date();
     this.parent.update_child();
   }
   
   void up_to_date(){
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
   }
   
   private void self_c(int count){
     this.self_count=count;
   }
   
   private void parent(ui p){
     this.parent=p;
   }
   
   /* to provide color of the ui*/
   void ui_c(color c){
     this.c1=c;
   }
   
  /* update the whole ui*/
  
  void update(){
  push();
  fill(this.c1);
  rect(this.xPos,this.yPos,this.w,this.h);
  pop();
  }
  
  
  
  void txt(float x1,float y1){
  int[] nn={};
  this.write(this.default_text,nn,x1,y1);
  }
  
  
  void txt(){
   this.txt(this.w/2,this.h/2);
  }
  
  void def_text(String txt){
    this.default_text=txt;
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
  
void anim(boolean b,float delt,float delw){
if(b){
  this.lay_weight(1+this.anim_frameCount);
  this.anim_frameCount+=delt*this.transition_dir;
}else{
  this.lay_weight(1+this.anim_frameCount);
 this.anim_frameCount-=delt*this.transition_dir;
}

if(this.anim_frameCount>delw){
  this.anim_frameCount=delw;
}else if(this.anim_frameCount<0){
  this.anim_frameCount=0;
}
}


void anim_(String s,boolean b,float a1,float a2,float delt,float delw){
  if(delw<=0){
   delw=1; 
  }
if(b){
  switch(s){
  case "height":
  this.h=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "width":
  this.w=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "x":
  this.xPos=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "y":
  this.yPos=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "lay":
  this.lay_weight(1+a1+(a2-a1)*(1-this.anim_frameCount/delw));
  break;
  default:
  }
  this.anim_frameCount+=delt*this.transition_dir;
}else{
  switch(s){
  case "height":
  this.h=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "width":
  this.w=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "x":
  this.xPos=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "y":
  this.yPos=a1+(a2-a1)*(1-this.anim_frameCount/delw);
  break;
  case "lay":
  this.lay_weight(1+a1+(a2-a1)*(1-this.anim_frameCount/delw));
  break;
  default:
  }
  this.anim_frameCount-=delt*this.transition_dir;
}

if(this.anim_frameCount>delw){
  this.anim_frameCount=delw;
}else if(this.anim_frameCount<0){
  this.anim_frameCount=0;
}
}

void up_to_date(boolean b){
if(b){
  this.up_to_date();
}else{
  this.up_to_date();

}
}

void write(String s){
  this.e.edit_text=s;
  this.e.x=(int)this.xPos;
  this.e.y=(int)this.yPos+(int)this.text_h;
  this.e.bound_x=(int)this.xPos+(int)this.w-10;
  this.e.bound_y=(int)this.yPos+(int)this.h-(int)this.text_h;
  this.e.text();
}


void write(String s,int[] pro,float x,float y){
  this.extraX=constrain(x,0,this.w);
  this.extraY=constrain(y,this.text_h,this.h);
  textSize(this.text_h);
  if(s.length()<1000){
  for(int i=0;i<s.length();i++){
    ch[i]=s.charAt(i);
  }
  }else{
    for(int i=0;i<1000;i++){
    ch[i]=s.charAt(i);
  }
  }
  int pp=0;
  while(extraY<(int)this.h){
  while(extraX+textWidth(ch[pp])<(int)this.w){
    boolean hp=false;
    for(int j=0;j<pro.length;j++){
    if(anim(1000,100) && pp==pro[j]){
      text(" ",extraX+this.xPos,extraY+this.yPos);// Instead of " " in you can use any string , this works as flickring or blinking a text at specified position
      hp=true;
    }
    }
    if(!hp){
    text(ch[pp],extraX+this.xPos,extraY+this.yPos);
    }
    extraX+=textWidth(ch[pp]);
        pp++;
      }
  if(extraX>=this.w-textWidth(ch[pp])){
     extraX=0;
     extraY+=text_h;
    }else if(extraX<0){
      extraX=this.w;
      extraY-=text_h;
    }
    
    this.extraX=constrain(this.extraX,0,this.w);
    this.extraY=constrain(this.extraY,this.text_h,this.h);

  }
  
}

void write(String s,int[] pro,float x,float y,float x1,float y1){
  this.extraX=constrain(x,0,x1);
  this.extraY=constrain(y,this.text_h,y1);
  textSize(this.text_h);
  if(s.length()<1000){
  for(int i=0;i<s.length();i++){
    ch[i]=s.charAt(i);
  }
  }else{
    for(int i=0;i<1000;i++){
    ch[i]=s.charAt(i);
  }
  }
  int pp=0;
  while(extraY<(int)y1){
  while(extraX+textWidth(ch[pp])<(int)x1){
    if(pp<1000){
    boolean hp=false;
    for(int j=0;j<pro.length;j++){
    if(anim(1000,100) && pp==pro[j]){
      text(" ",extraX+this.xPos,extraY+this.yPos);
      hp=true;
    }
    }
    if(!hp){
    text(ch[pp],extraX+this.xPos,extraY+this.yPos);
    }
    extraX+=textWidth(ch[pp]);
    }
        pp++;
      }
      
      
      if(pp<1000){
  if(extraX>=x1-textWidth(ch[pp])){
     extraX=0;
     extraY+=text_h;
    }else if(extraX<0){
      extraX=x1;
      extraY-=text_h;
    }
    this.extraX=constrain(this.extraX,0,x1);
    this.extraY=constrain(this.extraY,this.text_h,y1);
      }
  }
  
}

boolean anim(float time,float del){
  int t_from_s=millis();
  if(t_from_s % time>del && t_from_s % time<time-del){
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
  
}


/* Simple example


ui u,g,h,i,j;
helper help;
float r;

void setup(){
  size(300,400);
  u=new ui(true);
  g=u.copy_(1,true);
  h=u.copy_(2,true);
  g.ui_c(g.r);
  h.ui_c(h.g);
  h.vert=false;
  i=h.copy_(2,true);
  j=h.copy_(3,true);
  help=new helper();
}

void draw(){
background(255);
ui[] up={u,g,h,i,j};
help.update(up);
boolean bb=g.collision(mouseX,mouseY);
boolean ba=i.collision(mouseX,mouseY);
i.anim(ba,0.1,2);
g.anim(bb,0.1,2);
ui[] ug={g,h,i,j};
help.up_to_date(ug,bb);
help.up_to_date(ug,ba);
help.edit(g,50,50);
if(mousePressed){
rect(g.c_X(mouseX)-25,g.c_Y(mouseY)-25,50,50);
}
}


*/
