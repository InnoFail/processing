class func{
  public list<list<String>> l; //// something like l = [["print","args"],["custom_func",call_func"print,args"]];
  public int index_of_key=-1,index_of_value=-1;
  public String curr_func = null;
  public list<list<Float>> mem;
  int maxx=5,maxy=5;
  public list<String> mem_s;
  int maxs = 15;
  public list<ui> u;
  public int u_index=-1;
  public ui curr_ui;
  public helper h;
  public boolean run_if = true, continue_if = false;
  public int run_if_pos = -1;
  
  
  public func(){
    this.l = new list<list<String>>();
    this.mem = new list<list<Float>>();
    for(int i=0 ; i<this.maxx ; i++){
      this.mem.add(new list<Float>());
      for(int j=0 ; j<this.maxy ; j++){
        this.mem.get(i).add(new Float(0));
      }
    }
    this.mem_s = new list<String>();
    for(int i=0 ; i<this.maxs ; i++){
      this.mem_s.add("");
    }
    this.u = new list<ui>();
    this.h = new helper();
  }
  
  public void set_mem(int x,int y,Float p){
    this.mem.get(x).replace(y,p);
  }
  
  public Float get_mem(int x , int y){
    return this.mem.get(x).get(y);
  }
  
  public void set_mem_s(int sx,String p){
    this.mem_s.replace(sx,p);
  }
  
  public String get_mem_s(int sx){
    return this.mem_s.get(sx);
  }
  
  public void print_mem(int x, int y){
    print(this.get_mem(x,y));
  }
  
  public void println_mem(int x, int y){
    println(this.get_mem(x,y));
  }
  
  public void print_mem_s(int sx){
    print(this.get_mem_s(sx));
  }
  
  public void println_mem_s(int sx){
    println(this.get_mem_s(sx));
  }
  
  public void func_new(String name){
    this.l.add(new list<String>());
    this.index_of_key++;
    this.l.get(this.index_of_key).add(name);
    this.index_of_value++;
    this.l.get(this.index_of_key).add("null");
    this.index_of_value++;
    this.curr_func = name;
  }
  
  public void func_def(String name,String args){
    this.l.add(new list<String>());
    this.index_of_key++;
    this.l.get(this.index_of_key).add(name);
    this.index_of_value++;
    this.l.get(this.index_of_key).add(args);
    this.index_of_value++;
  }
  
  public void call_func(String name,String args){
    if(this.curr_func != null){
      this.l.get(this.index_of_key).add(name);
      this.index_of_value++;
      this.l.get(this.index_of_key).add(args);
      this.index_of_value++;
    }else{
      this.func_execute(name,args);
    }
  }
  
  public void func_execute(String name,String args){
    if(args.equals("null")){
      if(this.run_if == false && name.equals("end_if")){
        this.run_if = true;
        return;
      }
      for(list<String> i : this.l){
        if(i.get(0).equals(name)){
          for(int j=2 ; j<i.size(); j+=2){ //<>//
            if(this.continue_if == true){
              j = this.run_if_pos;
              this.continue_if = false;
            }
            if(i.get(j).equals("check_if")){
             this.run_if_pos = j; 
            }
             this.call_func(i.get(j),i.get(j+1));
          }
        }
      }
    }else{
      if(this.run_if == false){
        return;
      }
      String[] s = args.split(",");
      switch(name){
        case "mem":
          if(s.length == 3){
            this.set_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Float.parseFloat(s[2]));
          }
          break;
        case "mem_s":
          if(s.length >= 2){
            if(s.length == 2){
              this.set_mem_s(Integer.parseInt(s[0]),s[1]);
            }else{
              println(s.length);
              String temp_s = s[1];
              for(int i=2; i<s.length-1 ; i++){
                if(s[s.length-1].equals("s")){
                  temp_s = temp_s + " " +  s[i];
                }else if(s[s.length-1].equals("n")){
                  temp_s = temp_s + "\n" +  s[i];
                }else{
                  temp_s = temp_s + s[s.length-1] +  s[i];
                }
              }
              this.set_mem_s(Integer.parseInt(s[0]),temp_s);
            }
          }
          break;
        case "print":
          if(s.length == 2){
            this.print_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "println":
          if(s.length == 2){
            this.println_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "print_s":
          if(s.length == 1){
            this.print_mem_s(Integer.parseInt(s[0]));
          }
          break;
        case "println_s":
          if(s.length == 1){
            this.println_mem_s(Integer.parseInt(s[0]));
          }
          break;
        case "add_s":
          if(s.length == 3){
            String a = this.get_mem_s(Integer.parseInt(s[1])) + this.get_mem_s(Integer.parseInt(s[2]));
            this.set_mem_s(Integer.parseInt(s[0]),a);
          }
          break;
        case "substring":
          if(s.length == 6){
            String temp_s = this.get_mem_s(Integer.parseInt(s[1]));
            Integer a = this.get_mem(Integer.parseInt(s[2]),Integer.parseInt(s[3])).intValue();
            Integer b = this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5])).intValue();
            this.set_mem_s(Integer.parseInt(s[0]),temp_s.substring(a,b));
          }
          break;
        case "add":
          if(s.length == 6){
            float a = this.get_mem(Integer.parseInt(s[2]),Integer.parseInt(s[3])) + this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5]));
            this.set_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]),a);
          }
          break;
        case "sub":
          if(s.length == 6){
            float a = this.get_mem(Integer.parseInt(s[2]),Integer.parseInt(s[3])) - this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5]));
            this.set_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]),a);
          }
          break;
        case "mul":
          if(s.length == 6){
            float a = this.get_mem(Integer.parseInt(s[2]),Integer.parseInt(s[3])) + this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5]));
            this.set_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]),a);
          }
          break;
        case "div":
          if(s.length == 6){
            if(this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5])) == 0){
              // need to print the error
              break;
            }
            float a = this.get_mem(Integer.parseInt(s[2]),Integer.parseInt(s[3])) / this.get_mem(Integer.parseInt(s[4]),Integer.parseInt(s[5]));
            this.set_mem(Integer.parseInt(s[0]),Integer.parseInt(s[1]),a);
          }
          break;
        case "new_ui":
          if(s.length == 2){
            this.new_ui(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_id":
          if(s.length == 1){
            this.ui_id(Integer.parseInt(s[0]));
          }
          break;
        case "ui_get_by_id":
          if(s.length == 1){
            this.ui_get_by_id(Integer.parseInt(s[0]));
          }
          break;
        case "ui_set_text":
          if(s.length == 1){
            this.ui_set_text(Integer.parseInt(s[0]));
          }
          break;
        case "ui_text":
          if(s.length == 4){
            this.ui_text(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]));
          }
          break;
        case "ui_c":
          if(s.length == 2){
            this.ui_c(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_copy":
          if(s.length == 2){
            this.ui_copy(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_draw":
          if(s.length == 2){
            this.ui_draw(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_child":
          if(s.length == 2){
            this.ui_child(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_weight":
          if(s.length == 2){
            this.ui_weight(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "ui_at":
          if(s.length > 0){
            this.ui_at(s);
          }
          break;
        case "ui_pos":
          if(s.length == 4){
            this.ui_pos(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]));
          }
          break;
        case "ui_size":
          if(s.length == 4){
            this.ui_size(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]));
          }
          break;
        case "mouse_pos":
           if(s.length == 4){
            this.mouse_pos(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]));
          }
          break;
        case "ui_collision":
           if(s.length == 6){
            this.ui_collision(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]),Integer.parseInt(s[4]),Integer.parseInt(s[5]));
          }
          break;
        case "compare_all":
           if(s.length == 6){
            this.compare_all(Integer.parseInt(s[0]),Integer.parseInt(s[1]),Integer.parseInt(s[2]),Integer.parseInt(s[3]),Integer.parseInt(s[4]),Integer.parseInt(s[5]));
          }
          break;
        case "check_if":
           if(s.length == 2){
            this.check_if(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
        case "continue_if":
           if(s.length == 2){
            this.if_continue(Integer.parseInt(s[0]),Integer.parseInt(s[1]));
          }
          break;
      }
    }
  }
  
  public void new_ui(int x,int y){
    int s = this.get_mem(x,y).intValue();
    if(s == 0){
      this.u.add(new ui(true,0,0,50,50));
      this.u_index++;
    }else if(s == 1){
      this.u.add(new ui(false,0,0,50,50));
      this.u_index++;
    }else if(s == 2){
      this.u.add(new ui(true));
      this.u_index++;
    }else if(s == 3){
      this.u.add(new ui(false));
      this.u_index++;
    }
    this.curr_ui = this.u.get(this.u_index);
  }
  
  public void ui_id(int sx){
    du.add(this.curr_ui,this.get_mem_s(sx),"");
  }
  
  public void ui_get_by_id(int sx){
    this.curr_ui = du.get_object_by_id(this.get_mem_s(sx));
  }
  
  public void ui_set_text(int sx){
    this.curr_ui.write(this.get_mem_s(sx));
  }
  
  public void ui_text(int x1,int y1,int x2, int y2){
    int s1 = this.get_mem(x1,y1).intValue();
    int s2 = this.get_mem(x2,y2).intValue();
    this.curr_ui.extraX = s1;
    this.curr_ui.extraY = s2;
  }
  
  public void ui_c(int x,int y){
    this.curr_ui.ui_c(this.h.colors[this.get_mem(x,y).intValue()]);
  }
  
  public void ui_copy(int x,int y){
    int s = this.get_mem(x,y).intValue();
    ui c = null;
    if(s == 0){
      c = this.curr_ui.add_in_(1,true);
    }else{
      c = this.curr_ui.add_in_(1,false);
    }
    this.curr_ui = c;
  }
  
  
  public void ui_draw(int x, int y){
    int s = this.get_mem(x,y).intValue();
    if(s == 1){
      this.curr_ui.update();
    }
  }
  
  public void ui_child(int x, int y){
    int s = this.get_mem(x,y).intValue();
    this.curr_ui = this.curr_ui.c(s);
  }
  
  public void ui_weight(int x, int y){
    int s = this.get_mem(x,y).intValue();
    this.curr_ui.weight = s;
    this.curr_ui.up_to_date();
  }
  
  public void ui_at(String[] s){
    for(int i=0 ; i<s.length ; i+=2){
      if(i == 0){
      this.curr_ui = this.u.get(this.get_mem(Integer.parseInt(s[i]),Integer.parseInt(s[i+1])).intValue());
      }else{
        this.curr_ui = this.curr_ui.c(this.get_mem(Integer.parseInt(s[i]),Integer.parseInt(s[i+1])).intValue());
      }
    }
  }
  
  public void ui_pos(int x1, int y1,int x2, int y2){
    int s1 = this.get_mem(x1,y1).intValue();
    int s2 = this.get_mem(x2,y2).intValue();
    this.curr_ui.pos(s1,s2);
  }
  
  public void ui_size(int x1, int y1,int x2, int y2){
    int s1 = this.get_mem(x1,y1).intValue();
    int s2 = this.get_mem(x2,y2).intValue();
    this.curr_ui.w = s1;
    this.curr_ui.h = s2;
  }
  
  public void mouse_pos(int x1, int y1,int x2, int y2){
    this.set_mem(x1,y1,(float)mouseX);
    this.set_mem(x2,y2,(float)mouseY);
  }
  
  public void ui_collision(int x , int y,int x1, int y1,int x2, int y2){
    int s1 = this.get_mem(x1,y1).intValue();
    int s2 = this.get_mem(x2,y2).intValue();
    boolean b = this.curr_ui.collision(s1,s2);
    if(b){
      this.set_mem(x,y,1.0);
    }else{
      this.set_mem(x,y,0.0);
    }
  }
  
  public void compare_all(int x, int y, int x1, int y1, int x2, int y2){
    float s1 = this.get_mem(x1,y1);
    float s2 = this.get_mem(x2,y2);
    if(s1>s2){
      this.set_mem(x,y,2.0);
    }else if(s1 == s2){
      this.set_mem(x,y,0.0);
    }else if(s1<s2){
      this.set_mem(x,y,1.0);
    }
  }
  
  public void check_if(int x, int y){
    int s1 = this.get_mem(x,y).intValue();
    if(s1 == 0){
     this.run_if = false; 
    }else{
      this.run_if = true;
    }
  }
  
  public void if_continue(int x, int y){
    int s1 = this.get_mem(x,y).intValue();
    if(s1 == 0){
     this.continue_if = false; 
    }else{
      this.continue_if = true;
    }
  }
  
  public void end(){
    this.curr_func = null;
  }
  
  
  
  public void run_code(func f,String[] s){
  //int apap = 0;
  for(int k=0 ; k<s.length ; k++){
    String i = s[k].trim();
    i = i.replace(" +"," ");
    //if(apap > 100){
    // return; 
    //}
    //apap++;
    if(i.equals("")){
     continue; 
    }
    String[] j= i.split(" ");
    if(j[0].equals("//")){
     continue; 
    }
    if(j.length == 1){
      if(j[0].equals("end")){
        f.end();
        //apap++;
        //println(apap,j[0]);
      }else{
        f.func_new(j[0]);
        //apap++;
        //println(apap,"new_func",j[0]);
      }
    }else if(j.length == 2){
      f.call_func(j[0],j[1]);
      //apap++;
      //println(apap,"call_func",j[0],j[1]);
    }
  }
}
  
}
