import java.util.regex.*;

class token{
  String s;
  StringDict tokens;
  IntList tokens_pos;
  StringList keys;
  String tok1 = "[a-zA-Z0-9]+";
  String tok2 = "[\\W]";
  
  token(){
    this.s=new String();
    tokens=new StringDict();
    this.tokens_pos=new IntList();
    keys=new StringList();
    this.cut(this.s);
  }
  
  token(String tok1,String tok2){
    this.s=new String();
    tokens=new StringDict();
    this.tokens_pos=new IntList();
    keys=new StringList();
    this.cut(this.s);
    this.tok1 = tok1;
    this.tok2 = tok2;
  }
  
  void cut(String s){
    Pattern p1=Pattern.compile(this.tok1);
    Matcher m1=p1.matcher(s);
    Pattern p2=Pattern.compile(this.tok2);
    Matcher m2=p2.matcher(s);
    StringDict tokens_test=new StringDict();
    while(m1.find()){
      if(!m1.group().equals("null")){
      int ppp=m1.start();
     tokens_test.set(Integer.toString(ppp),m1.group());
     this.tokens_pos.append(ppp);
      }
    }
    
    while(m2.find()){
      if(!m2.group().equals(" ") && !m2.group().equals("`")){
        int ppp=m2.start();
     tokens_test.set(Integer.toString(ppp),m2.group());
     this.tokens_pos.append(ppp);
      }
    }
    
    this.tokens_pos.sort();
    for(int i: tokens_pos){
      this.tokens.set(Integer.toString(i),tokens_test.get(Integer.toString(i)));
    }
    if(this.tokens.size()!=0){
    for(String i:this.tokens.keyArray()){
      this.keys.append(i);
    }
  }
    
  }
  
}




class ui_process{
  HashMap<String,ui> h;
  Table t;
  String file;
  
  /*
  "add":  //parms->id,orientation,x,y,width,height
  "child":  //parms->id,parent_ui,orientation,weight
  "update":  //update parm->id
  "upd":  //up_to_date parm->id
  "write":  //write parm->id,string_to_write
  "txt":   //write parm->id,xPos,yPos
  "bgcolor":  //background color parm->id,color
  "animation_touch":  //anim_ parm->id,ui_to touch,name_property,from_float,to_float,delt,delw
  
  Example
  
  */
  
  ui_process(String s){
    this.h=new HashMap();
    this.t=loadTable(s);
    this.file=s;
    this.process();
  }
  
  void add(String s,ui u){
   this.h.put(s,u); 
  }
  
 void add(String id,String orientation,float xPos,float yPos,float w,float h){
   boolean b=false;
   if(orientation.equals("vert")){
    b=true;
   }else{
     b=false;
   }
   ui u=new ui(b,xPos,yPos,w,h);
   this.add(id,u);
 }
 
 void add_c(String id,ui u,String orientation,float weight){
   boolean b=false;
   if(orientation.equals("vert")){
    b=true;
   }else{
     b=false;
   }
   ui child=u.add_in_(weight,b);
   this.add(id,child);
 }
  
  void process(){
   for(TableRow rows:this.t.rows()){
     String func=rows.getString(0);  // 0,1,2,3....
     switch(func){
       case "add":  //parms->id,orientation,x,y,width,height
       this.add(rows.getString(1),rows.getString(2),rows.getFloat(3),rows.getFloat(4),rows.getFloat(5),rows.getFloat(6)); //parm->id,orientation,xPos,y_pos,w,h
       break;
       case "child":  //parms->id,parent_ui,orientation,weight
       this.add_c(rows.getString(1),this.h.get(rows.getString(2)),rows.getString(3),rows.getFloat(4));
       break;
     }
   }
  }
  
  void search(String s,ui u,Object ...x){
    switch(s){
      case "update":  //update parm->u
      u.update();
      break;
      case "upd":  //up_to_date parm->u
      u.up_to_date();
      break;
      case "write":  //write parm->u,string_to_write
      u.write((String)x[0]);
      break;
      case "txt":   //write parm->u,xPos,yPos
      u.txt((Float)x[0],(Float)x[1]);
      break;
      case "bgcolor":  //background color parm->u,color
      u.ui_c((Integer)x[0]);
      break;
      case "animation_touch":  //anim_ parm->u,ui_to touch,name_property,from_float,to_float,delt,delw
      ui bb=this.h.get((String)x[0]);
      boolean b=bb.collision(mouseX,mouseY);
      u.anim_((String)x[1],b,(Float)(x[2]),(Float)x[3],(Float)x[4],(Float)x[5]);
      break;
      default:
    }
  }
  
  void update(){
    this.t=loadTable(this.file);
   for(TableRow rows:this.t.rows()){
     String func=rows.getString(0); //0,1,2,3,4,5,6,7...
     String id=rows.getString(1);
     ui u=new ui(true);
     if(!func.equals("add")){
      u=this.h.get(id);
     }
     switch(func){
       case "update":
       search("update",u);
       break;
       case "up_to_date":
       search("upd",u);
       break;
       case "write":
       search("write",u,rows.getString(2));
       break;
       case "txt":
       search("txt",u,rows.getFloat(2),rows.getFloat(3));
       break;
       case "bgcolor":
       search("bgcolor",u,rows.getInt(2));
       break;
       case "animation_touch":
       search("animation_touch",u,rows.getString(2),rows.getString(3),rows.getFloat(4),rows.getFloat(5),rows.getFloat(6),rows.getFloat(7));
       break;
     }
   }
  
  }
  
}
