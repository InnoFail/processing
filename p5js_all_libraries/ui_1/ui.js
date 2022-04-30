let last_hover = null;
let last_focus = null;

function free_hover(){
  last_hover = null;
}

function free_focus(){
  last_focus = null;
}

function ui(ui_parent){
  this.canvas = createGraphics(width,height);
  this.clipped = false;
  this.x = 0;
  this.y = 0;
  this.width = width;
  this.height = height;
  this.tl_radius = 0;
  this.tr_radius = 0;
  this.bl_radius = 0;
  this.br_radius = 0;
  this.n_row = 1;
  this.n_col = 1;
  this.color = 0;
  this.stroke_color = color(0,0,0,0);
  this.snaps = [0,0,1,1];
  this.p = ui_parent;
  this.wrap = 0; // 0-> word , 1-> letters
  this.fontSize = 14;
  this.txtCol = 0;
  this.str = '';
  this.scrollx = 0;
  this.scrolly = 0;
  this.no_edit = false;
  this.align = [0,0]; //first arg 0->left ,1->center ,2->right ; second arg 0->top ,1->bottom ,2->baseline ,3->center
  this.lineh = 14;
  this.txtStyle = 0; // 0->normal,1->italic,2->bold,3->boldItalic
  
  //for determining click
  this.last_clicked = false;
  
  this.setup = function(size){
    if(this.p == null){
    if(size.length == 2){
      [this.x,this.y] = size;
    }
    else if(size.length == 4){
      [this.x,this.y,this.width,this.height] = size;
    }
    }
    return this;
  }
  
  this.snap = function(){
    this.x = this.p.x + this.p.width * this.snaps[0]/this.p.n_row;
    this.y = this.p.y + this.p.height * this.snaps[1]/this.p.n_col;
    this.width = this.p.width * (this.snaps[2]-this.snaps[0])/this.p.n_row;
    this.height = this.p.height * (this.snaps[3]-this.snaps[1])/this.p.n_col;
    return this;
  }
    
  this.grid = function(n_row,n_col){
    if(n_row != 0){
      this.n_row = n_row;
    }else{
      this.n_row = 0.00001;
    }
    if(n_col != 0){
    this.n_col = n_col;
    }else{
      this.n_col = 0.00001;
    }
    return this;
  }
  
  this.c = function(r,g,b,a){
    if(a == undefined || a == null){
    this.color = color(r,g,b);
    }else{
      this.color = color(r,g,b,a);
    }
    return this;
  }
  
  this.set_color = function(c){
    this.color = c;
    return this;
  }
  
   this.sc = function(r,g,b,a){
    if(!a){
    this.stroke_color = color(r,g,b);
    }else{
      this.stroke_color = color(r,g,b,a);
    }
    return this;
  }
  
  this.set_stroke_color = function(c){
    this.stroke_color = c;
    return this;
  }
  
  this.copy = function(){
    return new ui(this).set_snap(0,0,1,1).snap().set_color(this.color).set_line_height(this.lineh).set_font_size(this.fontSize).set_text_color(this.txtCol).set_text_style(this.txtStyle);
  }
  
 
  
  this.set_snap = function(a1,b1,a2,b2){
    this.snaps = [a1,b1,a2,b2];
    if(this.p !=null){
      this.snap();
    }
    return this;
  }
  
  this.set_snap_px = function(a1,b1,a2,b2){
    let px = a1/this.p.width*this.p.n_row;
    let py = b1/this.p.height*this.p.n_col;
    let qx = a2/this.p.width*this.p.n_row;
    let qy = b2/this.p.height*this.p.n_col;
    this.snaps = [px,py,qx,qy];
    if(this.p !=null){
      this.snap();
    }
    return this;
  }
  
  this.del_snap = function(a1,b1,a2,b2,stricx,stricy){
    
    if(stricx || stricy){
    let cx = constrain(this.snaps[0]+a1,0,this.p.n_row);
    let cy = constrain(this.snaps[1]+b1,0,this.p.n_col);
    let cw = constrain(this.snaps[2]+a2,0,this.p.n_row);
    let ch = constrain(this.snaps[3]+b2,0,this.p.n_col);
    if(stricx && !stricy){
      if(cx != 0 && cw != this.p.n_row){
        this.snaps = [cx,this.snaps[1]+b1,cw,this.snaps[3]+b2];
      }else{
        this.snaps = [this.snaps[0],this.snaps[1]+b1,this.snaps[2],this.snaps[3]+b2];
      }
    }
    if(stricy && !stricx){
      if(cy != 0 && ch != this.p.n_col){
        this.snaps = [this.snaps[0]+a1,cy,this.snaps[2]+a2,ch];
      }else{
        this.snaps = [this.snaps[0]+a1,this.snaps[1],this.snaps[2]+a2,this.snaps[3]];
      }
    }
    if( stricx && stricy){
      if(cy != 0 && ch != this.p.n_col && cx != 0 && cw != this.p.n_row){
        this.snaps = [cx,cy,cw,ch];
      }
      if(cx != 0 && cw != this.p.n_row && !(cy != 0 && ch != this.p.n_col)){
        this.snaps = [cx,this.snaps[1],cw,this.snaps[3]];
      }else if(!(cx != 0 && cw != this.p.n_row) && (cy != 0 && ch != this.p.n_col)){
        this.snaps = [this.snaps[0],cy,this.snaps[2],ch];
      }
    }
    }
    else{
      this.snaps = [this.snaps[0]+a1,this.snaps[1]+b1,this.snaps[2]+a2,this.snaps[3]+b2];
    }
    if(this.p !=null){
      this.snap();
    }
    return this;
  }
  
  
  
  
  this.del_snap_px = function(a1,b1,a2,b2,stricx,stricy){
    if(this.p != null && this.p.width > 1 && this.p.height > 1){
      let px = a1/this.p.width*this.p.n_row;
      let py = b1/this.p.height*this.p.n_col;
      let qx = a2/this.p.width*this.p.n_row;
      let qy = b2/this.p.height*this.p.n_col;
      this.del_snap(px,py,qx,qy,stricx,stricy);
    }
    return this;
  }
  
  
  
  this.set_str = function(str){
    this.str = str;
    return this;
  }

  
  this.set_radius_i_px = function(tl,tr,bl,br){
    this.tl_radius = tl;
    this.tr_radius = tr;
    this.bl_radius = bl;
    this.br_radius = br;
    return this;
  }
  
  this.set_radius_px = function(r){
    this.set_radius_i_px(r,r,r,r);
    return this;
  }
  
  this.x_to_weight = function(p){
    return p*this.p.n_row/this.p.width;
  }
  
  this.y_to_weight = function(p){
    return p*this.p.n_col/this.p.height;
  }
  
  this.weight_to_x = function(q){
    return q*this.p.width/this.p.n_row;
  }
  
  this.weight_to_y = function(q){
    return q*this.p.height/this.p.n_col;
  }
  
  this.set_radius_i = function(tl,tr,bl,br){
    this.tl_radius = this.weight_to_x(tl);
    this.tr_radius = this.weight_to_x(tr);
    this.bl_radius = this.weight_to_x(bl);
    this.br_radius = this.weight_to_x(br);
    return this;
  }
  
  this.set_radius = function(r){
    this.set_radius_i(r,r,r,r);
    return this;
  }
  
  this.set_scroll = function(a,b){
    this.scrollx = a;
    this.scrolly = b;
    return this;
  }
  
  this.set_align = function(a,b){
    this.align = [a,b];
    return this;
  }
  
  this.set_line_height = function(a){
    this.lineh = a;
    return this;
  }
  
  this.get_line_height = function(){
    return this.lineh;
  }
  
  this.set_text_style = function(a){
    this.txtStyle = a;
    return this;
  }
  this.set_text_color = function(a){
    this.txtCol = a;
    return this;
  }
  
  this.set_clip = function(a){
    this.clipped = a;
    return this;
  }
  
  this.set_wrap = function(a){
    this.wrap = a;
    return this;
  }
  
  this.set_font_size = function(a){
    this.fontSize = a;
    return this;
  }
  
  this.get_text_width = function(){
    textSize(this.fontSize);
    return textWidth(this.str);
  }
  
  this.set_no_edit = function(bool){
    this.no_edit = bool;
    return this;
  }
  
  
  
  this.draw = function(){
    if(this.p == null){
      
      push();
      stroke(this.stroke_color);
      fill(this.color);
      rect(this.x,this.y,this.width,this.height,this.tl_radius,this.tr_radius,this.bl_radius,this.br_radius);
      
      pop();
      if(!this.no_edit){
      this.edit(this.str);
      }
    }
    
    else{
      
      push();
      this.snap();
      stroke(this.stroke_color);
      fill(this.color);
      rect(this.x,this.y,this.width,this.height,this.tl_radius,this.tr_radius,this.bl_radius,this.br_radius);
      pop();
      if(!this.no_edit){
      this.edit(this.str);
      }
      
    }
  }
  
  
  
  
  this.repos = function(delx,dely,delw,delh){
      this.x += delx;
      this.y += dely;
      this.width += delw;
      this.height += delh;
      return this;
  }
  

  
  this.point_inside = function(x,y){

      if((this.x - x)*(this.x+this.width - x) < 0 && (this.y - y)*(this.y+this.height - y) < 0){
        return true;
      }
      
    return false;
    
  }
  
  
  //inside
  this.hasinside = function(ui){
    let pp = ui.coord();
    let [[a1,a2],[b1,b2],[c1,c2],[d1,d2]] = pp;
    if(this.point_inside(a1,a2) && this.point_inside(b1,b2) && this.point_inside(c1,c2) && this.point_inside(d1,d2)){
      return true;
    }
    return false;
  }
  
  this.collision = function(ui,already){
    let [[a1,a2],[b1,b2],[c1,c2],[d1,d2]] = ui.coord(); 
    let p11 = false;
    let p22 = false;
    if(already == null){
      p11 = ui.collision(this,true);
    }
    if(this.point_inside(a1,a2) || this.point_inside(b1,b2) || this.point_inside(c1,c2) || this.point_inside(d1,d2)){
      p22 = true;
    }
    if(p11 || p22){
      return true;
    }else{
      return false;
    }
  }
  
  
  
  this.nothing = function(){
    
  }
  
  
  
  this.edit = function(str){
    if(this.clipped == false){
    if(str == ""){
      return;
    }
    fill(this.txtCol);
    textSize(this.fontSize);
    if(this.wrap == 0){
    textWrap(WORD);
    }else if(this.wrap == 1){
      textWrap(CHAR);
    }
    if(this.align[0] == 0){
      if(this.align[1] == 0){
        textAlign(LEFT,TOP);
      }else if(this.align[1] == 1){
        textAlign(LEFT,BOTTOM);
      }else if(this.align[1] == 2){
        textAlign(LEFT,BASELINE);
      }else if(this.align[1] == 3){
        textAlign(LEFT,CENTER);
      }
    }else if(this.align[0] == 1){
      if(this.align[1] == 0){
        textAlign(CENTER,TOP);
      }else if(this.align[1] == 1){
        textAlign(CENTER,BOTTOM);
      }else if(this.align[1] == 2){
        textAlign(CENTER,BASELINE);
      }else if(this.align[1] == 3){
        textAlign(CENTER,CENTER);
      }
    }else if(this.align[0] == 2){
      if(this.align[1] == 0){
        textAlign(RIGHT,TOP);
      }else if(this.align[1] == 1){
        textAlign(RIGHT,BOTTOM);
      }else if(this.align[1] == 2){
        textAlign(RIGHT,BASELINE);
      }else if(this.align[1] == 3){
        textAlign(RIGHT,CENTER);
      }
    }
    textLeading(this.lineh);
    if(this.txtStyle == 0){
      textStyle(NORMAL);
    }else if(this.txtStyle == 1){
      textStyle(ITALIC);
    }else if(this.txtStyle == 2){
      textStyle(BOLD);
    }else if(this.txtStyle == 3){
      textStyle(BOLDITALIC);
    }
    
    translate(this.x,this.y);
    text(str,-this.scrollx,-this.scrolly,this.width+this.scrollx);
    translate(-this.x,-this.y);
    }
    
    else{
      
      
      if(str == ""){
      return;
    }
    this.canvas.background(this.color);
    this.canvas.fill(this.txtCol);
    this.canvas.textSize(this.fontSize);
    if(this.wrap == 0){
    this.canvas.textWrap(WORD);
    }else if(this.wrap == 1){
      this.canvas.textWrap(CHAR);
    }
    if(this.align[0] == 0){
      if(this.align[1] == 0){
        this.canvas.textAlign(LEFT,TOP);
      }else if(this.align[1] == 1){
        this.canvas.textAlign(LEFT,BOTTOM);
      }else if(this.align[1] == 2){
        this.canvas.textAlign(LEFT,BASELINE);
      }else if(this.align[1] == 3){
        this.canvas.textAlign(LEFT,CENTER);
      }
    }else if(this.align[0] == 1){
      if(this.align[1] == 0){
        this.canvas.textAlign(CENTER,TOP);
      }else if(this.align[1] == 1){
        this.canvas.textAlign(CENTER,BOTTOM);
      }else if(this.align[1] == 2){
        this.canvas.textAlign(CENTER,BASELINE);
      }else if(this.align[1] == 3){
        this.canvas.textAlign(CENTER,CENTER);
      }
    }else if(this.align[0] == 2){
      if(this.align[1] == 0){
        this.canvas.textAlign(RIGHT,TOP);
      }else if(this.align[1] == 1){
        this.canvas.textAlign(RIGHT,BOTTOM);
      }else if(this.align[1] == 2){
        this.canvas.textAlign(RIGHT,BASELINE);
      }else if(this.align[1] == 3){
        this.canvas.textAlign(RIGHT,CENTER);
      }
    }
    this.canvas.textLeading(this.lineh);
    if(this.txtStyle == 0){
      this.canvas.textStyle(NORMAL);
    }else if(this.txtStyle == 1){
      this.canvas.textStyle(ITALIC);
    }else if(this.txtStyle == 2){
      this.canvas.textStyle(BOLD);
    }else if(this.txtStyle == 3){
      this.canvas.textStyle(BOLDITALIC);
    }
    this.canvas.text(str,0,0,this.width);
    }
    let capture = this.canvas.get(this.scrollx,this.scrolly,this.width,this.height);
    if(capture.height > 1 && capture.width > 1){
    translate(this.x,this.y);
    image(capture,0,0);
    translate(-this.x,-this.y);
    }
    return this;
  }
  

  
  //hover and click
  this.hovered = function(){
    if(this.point_inside(mouseX,mouseY) && (last_hover == null || last_hover == this || this.p!=null && this.p.hovered())){
      last_hover = this;
    }
    else if(last_hover == null || last_hover == this){
      last_hover = null;
    }
    if(last_hover == this){
      return true;
    }
    return false;
  }
  
  this.clicked = function(){
    this.hovered(mouseX,mouseY);
    if(mouseIsPressed && this.point_inside(mouseX,mouseY) && last_hover == this){
      this.last_clicked = true;
      last_focus = this;
    }else{
      this.last_clicked = false;
    }
    return this.last_clicked;
  }
  
  this.focused = function(){
    this.clicked();
    if(this == last_focus){
      return true;
    }
    return false;
  }
  
  const del = 3;
  this.t_end = function(){
    if(this.y <= this.p.y+del && this.y >= this.p.y-del){
      return true;
    }
    return false;
  }
  
  this.l_end = function(){
    if(this.x <= this.p.x+del && this.x >= this.p.x-del){
      return true;
    }
    return false;
  }
  
  this.r_end = function(){
    if(this.x+this.width <= this.p.x+this.p.width+del && this.x+this.width >= this.p.x+this.p.width-del){
      return true;
    }
    return false;
  }
  
  this.b_end = function(){
    if(this.y+this.height <= this.p.y+this.p.height+del && this.y+this.height >= this.p.y+this.p.height-del){
      return true;
    }
    return false;
  }
  
  
  
}
