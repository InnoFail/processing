package processing.test.test;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.regex.*; 
import controlP5.*; 
import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class test extends PApplet {

keyboard k;

public void setup(){
  
  k=new keyboard();
}


public void draw(){
  background(0);
  k.update();
  println(k.character());
}



class helper{
  boolean key_pressed=true,mouse_pressed=true,enter=false,clicked=false;
 String s;
 ui u;
 int v,i,b,g,y,o,r,t,w;
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
  
  public String key_(){
    if(keyPressed==true && this.key_pressed==true){
      this.key_pressed=false;
      return String.valueOf(key);
    }else if(keyPressed==false){
     this.key_pressed=true; 
    }
    return "";
  }
  
  public Boolean mOnce(){
    if(mousePressed==true && this.mouse_pressed==true){
      this.mouse_pressed=false;
      return true;
    }else if(mousePressed==false){
     this.mouse_pressed=true; 
    }
    return false;
  }
  
  public void edit(ui g,float x,float y){
   int[] srk={};
  this.s=this.s.concat(this.key_());
  g.write(this.s,srk,x,y);
  }
  

  
  public void edit(ui g,String s,float x,float y){
   int[] srk={};
  this.s=this.s.concat(s);
  g.write(this.s,srk,x,y);
  }
  
  public void edit(ui g,float x,float y,float x1,float y1){
   int[] srk={};
  this.s=this.s.concat(this.key_());
  g.write(this.s,srk,x,y,x1,y1);
  }
  
  public void up_to_date(ui[] u,boolean b){
  for(int i=0;i<u.length;i++){
    u[i].up_to_date(b);
  }
}

public void update(ui[] u){
  for(int i=0;i<u.length;i++){
    u[i].update();
  }
}

public void update(ArrayList<ui> u){
    for(int i=0;i<u.size();i++){
    u.get(i).update();
  }
}
  


public ui clicked(ArrayList<ui> v,boolean b){
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

public boolean mClick(ui u){
  return u.collision(mouseX,mouseY);
}


public String calculate(String exp){
  ArrayList<String> ss=new ArrayList<String>();
  Pattern p=Pattern.compile("[0-9]+|[^0-9]");
  Matcher m=p.matcher(exp);
  while(m.find()){
    ss.add(exp.substring(m.start(),m.end()));
  }
  p=Pattern.compile("[^0-9]+");
  m=p.matcher(exp);
   while(m.find()){
    if(m.end()-m.start()>1){
      return "u r just a hell .... just correct ur statement";
    }
    
    if(m.start()==0){
      return "u r just a hell .... just correct ur statement";
    }
  }
  
  
  for(int i=0;i<ss.size();i++){
    int a=0,b=0,c=0;
    float pp=0,pq=0;
    switch(ss.get(i)){
      
      case "*":
      a=i;
      b=i-1;
      c=i+1;
      pp=Float.valueOf(ss.get(b));
      pq=Float.valueOf(ss.get(c));
      pp=pp*pq;
      ss.set(b,String.valueOf(pp));
      ss.remove(a);
      ss.remove(a);
      i=0;
      break;
      
      case "/":
      a=i;
      b=i-1;
      c=i+1;
      pp=Float.valueOf(ss.get(b));
      pq=Float.valueOf(ss.get(c));
      pp=pp/pq;
      ss.set(b,String.valueOf(pp));
      ss.remove(a);
      ss.remove(a);
      i=0;
      break;   
      
      case "+":
      a=i;
      b=i-1;
      c=i+1;
      pp=Float.valueOf(ss.get(b));
      pq=Float.valueOf(ss.get(c));
      pp=pp+pq;
      ss.set(b,String.valueOf(pp));
      ss.remove(a);
      ss.remove(a);
      i=0;
      break;   
      
      case"-": 
      a=i;
      b=i-1;
      c=i+1;
      pp=Float.valueOf(ss.get(b));
      pq=Float.valueOf(ss.get(c));
      pp=pp-pq;
      ss.set(b,String.valueOf(pp));
      ss.remove(a);
      ss.remove(a);
      i=0;
      break;   
      
    }
  }
  if(ss.size()!=0){
  return ss.get(0);
  }
  return "";
}

}
class keyboard{
  ui u,v;
  helper help;
  boolean dis=true;
  int index=0;
  int size=20;
  int txt_h=15;
  final String character_1="qwertyuiopasdfghjklz>-xcvbnm_<\\=.\":?;/()";
  final String character_2="QWERTYUIOPASDFGHJKLZ>-XCVBNM_<\\=.\":?;/()";
  String character=new String();
  
  keyboard(){
  this.help=new helper();
  this.u=new ui(this.help.vert,0,height/2-height/10,width,height/2);
  this.u.ui_c(this.help.r);
  this.v=new ui(this.help.vert,0,height-height/10,width,height/10);
  this.v.ui_c(this.help.b);
  for(int i=0;i<5;i++){
    this.u.add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(0).add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(0).c(i).def_text(Integer.toString(i));
    this.u.c(0).c(i).text_h=this.txt_h;
  }
  
  for(int i=0;i<10;i++){
    this.u.c(1).add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(1).c(i).def_text(Character.toString(this.character_1.charAt(i)));
    this.u.c(1).c(i).text_h=this.txt_h;
  }
  
  for(int i=0;i<10;i++){
    this.u.c(2).add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(2).c(i).def_text(Character.toString(this.character_1.charAt(i+10)));
    this.u.c(2).c(i).text_h=this.txt_h;
  }

  for(int i=0;i<10;i++){
    this.u.c(3).add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(3).c(i).def_text(Character.toString(this.character_1.charAt(i+20)));
    this.u.c(3).c(i).text_h=this.txt_h;
  }
  
  for(int i=0;i<10;i++){
    this.u.c(4).add_in_(1,this.help.hor);
  }
  for(int i=0;i<10;i++){
    this.u.c(4).c(i).def_text(Character.toString(this.character_1.charAt(i+30)));
    this.u.c(4).c(i).text_h=this.txt_h;
  }
  
  }
  
  
  
  public void update(){
  this.u.update();
  this.v.update();
  
  for(int i=0;i<5;i++){
   this.u.c(i).update();   
   this.u.c(i).up_to_date();
  }
  
  for(int i=0;i<5;i++){
    for(int j=0;j<10;j++){
    this.u.c(i).c(j).update();
    this.u.c(i).c(j).up_to_date();
    this.u.c(i).c(j).ui_c(this.help.g);
    this.u.c(i).c(j).txt();
    if(this.help.mClick(this.u.c(i).c(j))){
    this.u.c(i).c(j).ui_c(this.help.r);
    if(help.mOnce()){
      if(this.u.c(i).c(j).default_text.equals("<")){
        this.character=this.character+"~";
      }else{
      this.character=character+this.u.c(i).c(j).default_text;
      }
    }
    }
    }
  }
  
  if(this.help.mClick(this.u.c(3).c(0))){
  for(int i=0;i<10;i++){
    this.u.c(1).c(i).def_text(Character.toString(this.character_2.charAt(i)));
    this.u.c(1).c(i).text_h=this.txt_h;
  }
  for(int i=0;i<10;i++){
    this.u.c(2).c(i).def_text(Character.toString(this.character_2.charAt(i+10)));
    this.u.c(2).c(i).text_h=this.txt_h;
  }
  for(int i=0;i<10;i++){
    this.u.c(3).c(i).def_text(Character.toString(this.character_2.charAt(i+20)));
    this.u.c(3).c(i).text_h=this.txt_h;
  }
  }else if(this.help.mClick(this.u.c(3).c(1))){
    
  for(int i=0;i<10;i++){
    this.u.c(1).c(i).def_text(Character.toString(this.character_1.charAt(i)));
    this.u.c(1).c(i).text_h=this.txt_h;
  }
  for(int i=0;i<10;i++){
    this.u.c(2).c(i).def_text(Character.toString(this.character_1.charAt(i+10)));
    this.u.c(2).c(i).text_h=this.txt_h;
  }
  for(int i=0;i<10;i++){
    this.u.c(3).c(i).def_text(Character.toString(this.character_1.charAt(i+20)));
    this.u.c(3).c(i).text_h=this.txt_h;
  }
  }
  
  
  if(this.help.mClick(this.v) && this.help.mOnce()){
    if(dis){
   this.u.h=0; 
   this.dis=false;
    }else{
   this.u.h=height/2; 
   this.dis=true;
    }
  }
  }
  
  public String character(){
   return this.character; 
  }
  
  
}



class normal{
  JSONObject j;
  ControlP5 c;
  String file;
  
  normal(String file,test o){
    this.c=new ControlP5(o);
    this.file=file;
    this.j=loadJSONObject("test.json");
  }
  
  public void update(test o){
    this.c=new ControlP5(o);
   try{
   initial(j);
   }catch(Exception e){
    
   }
  }
  
  public void initial(JSONObject j){
    Iterator k1=j.keyIterator();
    while(k1.hasNext()){
    Object o1=k1.next();
    String[] o2=((String)o1).split("-");
    switch(o2[1]){
      case "box":
      JSONObject p1=j.getJSONObject((String)o1);
      this.button(p1,o2[0]);
      break;
      case "bang":
      JSONObject p2=j.getJSONObject((String)o1);
      this.bang(p2,o2[0]);
      break;
      case "textarea":
      JSONObject p3=j.getJSONObject((String)o1);
      this.bang(p3,o2[0]);
      break;
      default:
     }
    }
  }


  public void button(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Button b=c.addButton(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group")));
        break;
      }
     }
  }


  public void bang(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Bang b=c.addBang(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group")));
        break;
      }
     }
  }
  
  
  public void textarea(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Textarea b=c.addTextarea(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group")));
        break;
      }
     }
  }

  


 public Controller getButton(String s){
   return this.c.getController(s);
 }
 
 public Controller getBang(String s){
   return this.c.getController(s);
 }


  
}
class ui{
  ArrayList<Float> child;
  ArrayList<ui> child_;
  float xPos,yPos,h,w;
  int c1;
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
   -> void write(String s,int[] pro,float x,float y)
   -> void write(String s,int[] pro,float x,float y,float w,float h)
   ->void add_in_(float weight,boolean vert)
   ->ui c(int i)*/
   
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
   
   public void update_child(){
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
   
   public void up_to_date(){
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
   
   private void self_c(int count){
     this.self_count=count;
   }
   
   private void parent(ui p){
     this.parent=p;
   }
   
   /* to provide color of the ui*/
   public void ui_c(int c){
     this.c1=c;
   }
   
  /* update the whole ui*/
  
  public void update(){
  push();
  fill(this.c1);
  rect(this.xPos,this.yPos,this.w,this.h);
  pop();
  }
  
  
  
  public void txt(float x1,float y1){
  int[] nn={};
  this.write(this.default_text,nn,x1,y1);
  }
  
  public void txt(){
   this.txt(this.w/2,this.h/2);
  }
  
  public void def_text(String txt){
    this.default_text=txt;
  }
  
  /*
  Here are some functions that user can access 
  ->c_X(float)and c_Y(float) to constrain a point coordinate within its layout dimensions
  ->weight() to change its weight
  */
  public float c_X(float x){
    return constrain(x,this.xPos,this.xPos+this.w);
  }
  
  public float c_Y(float y){
    return constrain(y,this.yPos,this.yPos+this.h);
  }
  
  public float weight(){
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
  
  public ui copy_(float weight,boolean vert){
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
  
  public boolean collision(float x,float y){
    if(x>this.xPos && x<this.xPos+this.w && y>this.yPos && y<this.yPos+this.h){
      return true;
    }
    return false;
  }
  
  public boolean collision_box(float x,float y,float w,float h){
    if(x>this.xPos && x+w<this.xPos+this.w && y>this.yPos && y+h<this.yPos+this.h){
      return true;
    }
    return false;
  }
  
  /*
  ->up_to_date(boolean) to update itself on a given condition and calls up_to_date() if condition is true
  ->write(String , int[], float, float) to start to write from (x,y) and restrict to layout(w,h)
    write(String , int[],float ,float, float, float) is used to restrict to acertain dimension (x,y,w,h)
  ->anim(boolean, float, float) to animate blinking on a condition, given time and for how much time
  */
  
public void anim(boolean b,float delt,float delw){
if(b){
  this.lay_weight(1+this.anim_frameCount);
  this.anim_frameCount+=0.1f*this.transition_dir;
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

public void up_to_date(boolean b){
if(b){
  this.up_to_date();
}else{
  this.up_to_date();

}
}


public void write(String s,int[] pro,float x,float y){
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

public void write(String s,int[] pro,float x,float y,float x1,float y1){
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

public boolean anim(float time,float del){
  int t_from_s=millis();
  if(t_from_s % time>del && t_from_s % time<time-del){
    return true;
  }
  return false;
}

/* void add_in_() to add new child
   ui c() returns reference to child*/

public void add_in_(float weight,boolean vert){
  this.copy_(weight,vert);
}

public ui c(int i){
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
  public void settings() {  size(300,400); }
}
