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
  
  
  
  void update(){
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
    this.u.c(i).c(j).write(this.u.c(i).c(j).default_text);
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
  
  String character(){
   return this.character; 
  }
  
  
}
