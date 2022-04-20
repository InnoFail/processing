function editor(u){
  this.parent = u;
  this.editor = this.parent.copy();
  this.editor.ui.set_snap_px(0,0,100,100).c(255,255,255).set_clip(true);
  this.temp_str = "";
  this.str = "";
  this.key_passed = "";
  this.bar_pos = 0;
  
  this.key = function(k){
    this.key_passed = k;
    return this;
  }
  
  this.draw = function(){
    if(this.editor.ui.focused()){
      if(this.editor.ui.clicked()){
        this.editor.ui.set_scroll(this.editor.ui.scrollx - mouseX+pmouseX,this.editor.ui.scrolly - mouseY+pmouseY);
      }
    if(this.key_passed == "Shift"){
      
    }else if(this.key_passed == "CapsLock"){
      
    }else if(this.key_passed == "ArrowRight"){
      if(this.str.length > this.bar_pos){
        this.bar_pos+=1;
      }
    }else if(this.key_passed == "ArrowLeft"){
      this.bar_pos-=1;
      if(this.bar_pos<0){
        this.bar_pos=0;
      }
    }else if(this.key_passed == "ArrowUp"){
      
    }else if(this.key_passed == "ArrowDown"){
      
    }else if(this.key_passed == "Backspace"){
      this.str = this.str.substring(0,this.bar_pos-1)+this.str.substring(this.bar_pos,this.str.length);
      this.bar_pos-=1;
      if(this.bar_pos<0){
        this.bar_pos=0;
      }
    }else if(this.key_passed == "Enter"){
      this.str += "\n";
      this.bar_pos+=1;
    }else{
      this.str += this.key_passed;
      if(this.key_passed != ""){
        this.bar_pos+=1;
      }
    }
    }
    this.temp_str = this.str.substring(0,this.bar_pos)+"|"+this.str.substring(this.bar_pos,this.str.length);
    this.editor.ui.set_str(this.temp_str);
   
    this.editor.ui.draw();
  }
  
  this.get_str = function(){
    return this.str;
  }
}

function slider(min,max,vert,u){
  this.parent = u;
  this.vert = vert;
    this.slider = this.parent.copy();
    this.slider.ui.c(255,255,255);
  
  this.bar = this.slider.copy();
  if(this.vert == true){
    this.bar.ui.set_snap(0,0,1,0.1);
  }else{
    this.bar.ui.set_snap(0,0,0.1,1);
  }
  this.bar.ui.c(125,125,125);
  
  
  this.draw = function(){
    if(this.bar.ui.clicked()){
      if(this.vert == true){
      this.bar.ui.del_snap_px(0,mouseY - pmouseY,0, mouseY - pmouseY,false,true);
      }else{
        this.bar.ui.del_snap_px(mouseX - pmouseX,0, mouseX - pmouseX,0,true,false);
      }
    }
    this.slider.ui.draw();
    this.bar.ui.draw();
  }
  
  this.get_value = function(){
    let p = this.bar.ui;
    let q = this.slider.ui;
    if(this.vert == true){
      return round(map(p.y + (p.height)/2,p.height/2,q.y+q.height-p.height/2,min,max));
    }else{
      return round(map(p.x + (p.width)/2,p.width/2,q.x+q.width-p.width/2,min,max));
    }
  }
}


function button(text,u){
  this.padx = [16,16];
  this.pady = [8,8];
  this.parent = u;

  

    this.button = this.parent.copy();
    this.button.copy();
    this.button.child(0).ui.c(255,255,255);
  
  this.create = function(){
    this.button.child(0).ui.set_str(text).set_scroll(-this.padx[0],-this.pady[0]);
    this.button.ui.set_snap_px(0,0,this.button.child(0).ui.get_text_width()+this.padx[0]+this.padx[1],this.button.child(0).ui.lineh+this.pady[0]+this.pady[1]).c(255,255,255);
  }
  this.create();
      this.button.copy();
    
  
  
  
  
  this.shadow = function(a,b,c,d,col){
    let q = this.button.child(1).ui;
    let p = this.button.child(0).ui;
    let but = this.button.ui;
      p.set_snap_px(q.x-but.x-a,q.y-but.y-b,q.x-but.x+q.width-c,q.y-but.y+q.height-d);
    q.set_color(col);
    
  }
  
  this.draw = function(){
    this.button.ui.draw();
    this.button.child(1).ui.draw();
    this.button.child(0).ui.draw();
  }
}


function div(text,u){
  this.parent = u;

  this.div = this.parent.copy();
  this.div.ui.set_snap(0,0,1,1);
  this.child = this.div.copy();
  this.div.child(0).ui.c(255,255,255);
  this.shade = this.div.copy();
  this.color = color(255);
  
  this.set_color = function(col){
    this.color = col;
    return this;
  }
  
  this.del_snap = function(a,b,c,d){
    this.div.ui.del_snap(a,b,c,d);
    return this;
  }
  
  this.del_snap_px = function(a,b,c,d){
    this.div.ui.del_snap_px(a,b,c,d);
    return this;
  }
  
  this.shadow = function(a,b,c,d,col){
    let p = this.div.child(1).ui;
    let q = this.div.child(0).ui;
    let but = this.div.ui;
      p.set_snap_px(q.x-but.x-a,q.y-but.y-b,q.x-but.x+q.width-c,q.y-but.y+q.height-d).set_color(col);
    
  }
  
    
  this.draw = function(){
    this.child.ui.set_color(this.color);
    //this.div.ui.draw();
    this.shade.ui.draw();
    this.child.ui.draw();
  }
}

function list(number,u_list,u){
  this.parent = u;
  this.list = this.parent.copy();
  this.u_list = u_list;
  this.n = number;
  this.count = 0;
  this.happened = false;
  
  this.change = function(count,vert){
    this.count = count;
    
      let x = 0,y=0;
    let mm = (this.happened == false)?this.u_list.length:this.n + this.count;
    let k = this.count;
    for(let i=this.happened?this.count:0; i< mm; i++){
    if(!this.happened){
    this.list.add_child(u_list[i]);
      }
      
    let q = this.list.child(k).ui;
      if(vert == true){
    q.set_snap_px(x,y,x+q.width,q.height+y);
        y += q.height;
      }else{
        q.set_snap_px(x,y,x+q.width,y+q.height);
        x += q.width;
      }
      k++;
  }
    this.happened = true;
  }
  
  this.draw = function(){
    
    for(let i=this.count; i<this.n+this.count; i++){
    this.list.child(i).ui.draw();
  }
  }
}

