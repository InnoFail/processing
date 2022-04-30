ui u,menu,v,w,area,run;
helper h;
func f;
String[] code_func,code_draw;
boolean changed = true, code_run=true,already_run=true;
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
    v.ui_tc(h.n_red);
    w.ui_tc(h.black);
  }else if(!code_run){
    draw_str = area.write(draw_str);
    v.ui_tc(h.black);
    w.ui_tc(h.n_red);
  }
  
  
  
  h.update(new ui[]{menu,v,w});
  h.up_to_date(new ui[]{area,v,w,menu},true);
  v.txt(false);
  w.txt(false);
  
  
  if(code_run){
    if(already_run){
      f = new func();
      f.run_code(f,func_str.split("\n"));
      already_run = false;
    }else{
      f.run_code(f,draw_str.split("\n"));
    }
  }
  
  run.update();
  run.txt(false);
  if(h.mOnce()){
    if(v.collision(mouseX,mouseY)){
      changed = true;
    }else if(w.collision(mouseX,mouseY)){
      changed = false;
    }
    if(run.collision(mouseX,mouseY)){
      code_run = true;
      already_run = true;
    }else{
     code_run = false; 
    }
  }
  
 
  if(mouseroll){
    area.extraY -= scroll_num*8;
  }
  
  //text("30\u00B0", 150, 60);
  controls_update();
}
