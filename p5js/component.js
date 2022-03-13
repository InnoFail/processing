

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
    this.button.child(0).ui.set_str(text).set_scroll(-this.padx[0],-this.pady[0])
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
  this.padx = [16,16];
  this.pady = [8,8];
  this.parent = u;

  this.button = this.parent.copy();
  this.button.copy();
  this.button.child(0).ui.c(255,255,255);
  
  this.create = function(){
    this.button.child(0).ui.set_str(text).set_scroll(-this.padx[0],-this.pady[0])
    this.button.ui.set_snap_px(0,0,this.button.child(0).ui.get_text_width()+this.padx[0]+this.padx[1],this.button.child(0).ui.lineh+this.pady[0]+this.pady[1]).c(255,255,255);
  
  
  }
  this.create();
  this.button.copy();
  
  this.shadow = function(a,b,c,d,col){
    let p = this.button.child(1).ui;
    let q = this.button.child(0).ui;
    let but = this.button.ui;
      p.set_snap_px(q.x-but.x-a,q.y-but.y-b,q.x-but.x+q.width-c,q.y-but.y+q.height-d).set_color(col);
    
  }
  
  this.draw = function(){
    this.button.ui.draw();
    this.button.child(1).ui.draw();
    this.button.child(0).ui.draw();
  }
}

function list(number,u_list,u){
  this.parent = u;
  this.list = this.parent.copy();
  this.u_list = u_list;
  this.n = number;
  this.count = 0;
  
  this.change = function(count,vert){
    this.count = count;
    let k = 0;
    for(let i=this.count; i<this.n + this.count; i++){
    this.list.add_child(u_list[i]);
    let p = i != this.count ? this.list.child(k-1).ui : this.list.ui;
    let q = this.list.child(k).ui;
      if(vert != true){
    q.set_snap_px(p.x,p.y+p.height,p.x+q.width,p.y+p.height+q.height);
      }else{
        q.set_snap_px(p.x+p.width,p.y,p.x+p.width+q.width,p.y+q.height);
      }
      k++;
  }
  }
  
  this.draw = function(){
    
    for(let i=0; i<this.n; i++){
    this.list.child(i).ui.draw();
  }
  }
}

