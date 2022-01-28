
function ui(ui_parent){
  this.x = 0;
  this.y = 0;
  this.width = width;
  this.height = height;
  this.n_row = 1;
  this.n_col = 1;
  this.color = 0;
  this.snaps = [0,0,1,1];
  this.p = ui_parent;
  this.angle = 0; // in degrees
  this.mx = 0;
  this.my = null;
  this.inp = null;
  
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
    if(!a){
    this.color = color(r,g,b);
    }else{
      this.color = color(r,g,b,a);
    }
    return this;
  }
  
  this.copy = function(){
    return new ui(this).set_snap(0,0,1,1).snap();
  }
  
  this.set_snap = function(a1,b1,a2,b2){
    this.snaps = [a1,b1,a2,b2];
    if(this.p !=null){
      this.snap();
    }
    return this;
  }
  
  this.del_snap = function(a1,b1,a2,b2,stric){
    this.snaps = [this.snaps[0]+a1,this.snaps[1]+b1,this.snaps[2]+a2,this.snaps[3]+b2];
    if(stric){
      this.snaps = [constrain(this.snaps[0],0,this.p.n_row),constrain(this.snaps[1],0,this.p.n_col),constrain(this.snaps[2],0,this.p.n_row),constrain(this.snaps[3],0,this.p.n_col)];
    }
    if(this.p !=null){
      this.snap();
    }
    return this;
  }
  
  this.set_angle = function(angle){
    this.angle = angle;
    if(this.angle >= 360){
      this.angle = this.angle - 360;
    }
    if(this.angle < 0){
      this.angle = 360 + this.angle;
    }
  }
  
  this.coord = function(){
    let a1 = sin(this.angle*PI/180);
    let a2 = sin(PI/2+this.angle*PI/180);
    let b1 = cos(this.angle*PI/180);
    let b2 = cos(PI/2+this.angle*PI/180);
    let c1 = [this.x,this.y];
    let c2 = [this.x+this.width*b1,this.y+this.width*a1];
    let c3 = [this.x+this.height*b2,this.y+this.height*a2];
    let c4 = [this.x+this.width*b1+this.height*b2,this.y+this.width*a1+this.height*a2];
    return [c1,c3,c4,c2];
  }
  
  
  
  this.draw = function(){
    if(this.p == null){
      push();
      noStroke();
      fill(this.color);
      translate(this.x,this.y);
      rotate(this.angle * PI/180);
      translate(-this.x,-this.y);
      if(this.inp != null){
        this.inp.position(this.x,this.y);
        this.inp.size(this.width,this.height);
        this.inp.style("transform","rotate("+this.angle+"deg)");
      }
      rect(this.x,this.y,this.width,this.height);
      pop();
    }else{
      push();
      this.snap();
      noStroke();
      fill(this.color);
      translate(this.x,this.y);
      rotate(this.angle * PI/180);
      translate(-this.x,-this.y);
      if(this.inp != null){
        this.inp.position(this.x,this.y);
        this.inp.size(this.width,this.height);
        this.inp.style("transform","rotate("+this.angle+"deg)");
      }
      rect(this.x,this.y,this.width,this.height);
      pop();
    }
  }
  
  this.repos = function(delx,dely,delw,delh){
      this.x += delx;
      this.y += dely;
      this.w += delw;
      this.h += delh;
  }
  
  
  //point inside
  this.point_in = function(x,y){
    
      
  if(this.angle == 0){
    if((this.x - x)*(this.x+this.width - x) < 0 && (this.y - y)*(this.y+this.height - y) < 0){
      return true;
  }else{return false;}
  }else if(this.angle == 90){
    if((this.x + x)*(this.x-this.width + x) < 0 && (this.y - y)*(this.y+this.height - y) < 0){
      return true;
  }else{return false;}
  }else if(this.angle == 180){
    if((this.x + x)*(this.x-this.width + x) < 0 && (this.y + y)*(this.y-this.height + y) < 0){
      return true;
  }else{return false;}
  }else if(this.angle == 270){
    if((this.x + x)*(this.x-this.width + x) < 0 && (this.y + y)*(this.y-this.height + y) < 0){
      return true;
  }else{return false;}
  }
    
    
    if(this.angle == 0 || this.angle == 180){
      this.mx = 0;
      this.my = null;
    }else if(this.angle == 90 || this.angle == 270){
      this.mx = null;
      this.my = 0;
    }
    this.mx = tan(this.angle * PI/180);
    this.my = tan(PI/2 + this.angle * PI/180);

    
    let c1 = (this.y - this.x*this.mx);
    let c2 = (this.y - this.x*this.my);
    c1*c1<0.0000001?c1 = 0:this.nothing();
    c2*c2<0.0000001?c2 = 0:this.nothing();
    //let sgn1 = this.angle < 90 ? 1: this.angle <180 ? -1 : this.angle < 270 ? -1 :1;
    //let sgn2 = this.angle < 90 ? 1: this.angle <180 ? 1 : this.angle < 270 ? -1 :-1;
    let sgn1 = cos(this.angle*PI/180) >= 0 ? 1:-1;
    let sgn2 = sin(this.angle*PI/180) >= 0 ? 1:-1; 
    let c3 = c1 + this.height*sgn1*sqrt(1+this.mx*this.mx);
    let c4 = c2 + this.width*sgn2*sqrt(1+this.my*this.my);
    c3*c3<0.0000001?c3 = 0:this.nothing();
    c4*c4<0.0000001?c4 = 0:this.nothing();
    let a1 = (y-this.mx*x-c1) * (y-this.mx*x-c3);
    let a2 = (y-this.my*x-c2) * (y-this.my*x-c4);
    //console.log("h1",this.x,this.y,this.width,this.height,this.mx,this.my,c1,c2,c3,c4,a1,a2,sgn1,sgn2);
    if(a1<0 && a2<0){
      return true;
    }else{
      return false;
    }
  
  }
  
  
  //inside
  this.hasinside = function(ui){
    let pp = ui.coord();
    let [[a1,a2],[b1,b2],[c1,c2],[d1,d2]] = pp;
    if(this.point_in(a1,a2) && this.point_in(b1,b2) && this.point_in(c1,c2) && this.point_in(d1,d2)){
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
    if(this.point_in(a1,a2) || this.point_in(b1,b2) || this.point_in(c1,c2) || this.point_in(d1,d2)){
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
  
  this.createInp = function(event){
    this.inp = createElement("textarea");
    this.inp.position(this.x,this.y);
    this.inp.style("padding","0");
    this.inp.style("border","0");
    this.inp.style("resize","none");
    this.inp.size(this.width,this.height);
    this.inp.style("transform-origin","0 0");
    this.inp.input(event);
    return this;
  }
  
  
}
