
ui u,v;
helper help;
float r,value=0;
int rows=4,columns=4,txt_h=30;
Boolean close=true;

void setup(){
  size(300,400);
  help=new helper();
  
  u=new ui(help.vert);
  u.add_in_(3,help.vert);
  u.add_in_(7,help.vert);
  u.c(0).ui_c(help.v);
  u.c(1).ui_c(help.g);
  for(int i=0;i<rows;i++){
  u.c(1).add_in_(1,help.hor);
  }
  for(int i=0;i<rows;i++){
    for(int j=0;j<columns;j++){
  u.c(1).c(i).add_in_(1,help.vert);
    }
  }
  int ppp=9;
  for(int i=0;i<rows-1;i++){
    for(int j=columns-2;j>=0;j--){
  u.c(1).c(i).c(j).def_text(String.valueOf(ppp));
  u.c(1).c(i).c(j).text_h=txt_h;
  ppp-=1;
    }
  }
  u.c(1).c(0).c(3).def_text("Del");
  u.c(1).c(0).c(3).text_h=txt_h-10;
  u.c(1).c(1).c(3).def_text("-");
  u.c(1).c(1).c(3).text_h=txt_h;
  u.c(1).c(2).c(3).def_text("*");
  u.c(1).c(2).c(3).text_h=txt_h;
  u.c(1).c(3).c(3).def_text("=");
  u.c(1).c(3).c(3).text_h=txt_h;
  
  u.c(1).c(3).c(0).def_text("0");
  u.c(1).c(3).c(0).text_h=txt_h;
  u.c(1).c(3).c(1).def_text("/");
  u.c(1).c(3).c(1).text_h=txt_h;
  u.c(1).c(3).c(2).def_text("+");
  u.c(1).c(3).c(2).text_h=txt_h;
  
  
  v=new ui(help.vert,width/6,height/40,width/2,height/4);
  v.ui_c(help.b);
  v.add_in_(3,true);
  v.add_in_(1,true);
  v.c(0).def_text("");
  v.c(1).def_text("Close");
  v.c(1).text_h=v.c(1).h-1;

}

void draw(){
background(255);
u.update();


u.c(0).update();
u.c(1).update();
for(int i=0;i<rows;i++){
  u.c(1).c(i).update();
  u.c(1).c(i).ui_c(help.t);
  }
for(int i=0;i<rows;i++){
    for(int j=0;j<columns;j++){
  u.c(1).c(i).c(j).update();
  u.c(1).c(i).c(j).ui_c(help.g);
  u.c(1).c(i).c(j).txt();
    }
  }
  

  for(int i=0;i<rows;i++){
  ui p=help.clicked(u.c(1).c(i).child_,true);
  if(p!=null && mousePressed){
  p.ui_c(help.r);
  if(help.mOnce()){
    switch(p.default_text){
      case "=":
      String ss=help.calculate(help.s);
      v.c(0).def_text("Ans is "+ss);
      close=false;
      break;
      case "Del":
      if(help.s.length()>=1){
        //print(help.s.substring(0,help.s.length()-1));
      help.s=new String(help.s.substring(0,help.s.length()-1));
      help.edit(u.c(0)," ",0,0);
      help.s=new String(help.s.substring(0,help.s.length()-1));
      }
      break;
      default:
      help.edit(u.c(0),p.default_text,0,0);
    }
  }
  }else if(!mousePressed){
   help.mouse_pressed=true; 
  }
  }
  

  if(help.mClick(v.c(1)) && mousePressed){
    v.c(1).ui_c(help.v);
    v.c(0).def_text("                                                        ");
    v.c(0).txt(0,0);
    close=true;
    }
if(!close){
  v.update();
  v.c(0).update();
  v.c(1).update();
  v.c(0).txt(0,0);
  v.c(1).txt(v.c(1).w/3,-v.c(1).h/3);
  v.c(1).ui_c(help.i);
  }
 
  help.edit(u.c(0),"",0,0);
}
