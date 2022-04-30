let forward=0,up=0;
let ele;
let speed = 5;


function element(w){
  this.ele = createElement("p");
  this.ele.html("Hello");
  this.ele.style("position","absolute");
  this.ele.style("top","0");
  this.ele.style("left",width+"px");
  this.ele.style("background-color","white");
  this.ele.style("width",w+"px");
  
  this.text = function(text){
    this.ele.html(this.ele.html()+"\n"+text);
  }
  
  this.retext = function(text){
    this.ele.html(text);
  }
}

function keyPressed(){
  if(key == "a"){
    forward += speed;
  }else if(key == "d"){
    forward -= speed;
  }
  if(key == "w"){
    up += speed;
  }else if(key == "s"){
    up -= speed;
  }
}

function keyReleased(){
  forward = 0;
  up = 0;
}

function world(){
  this.comps = {};
  this.ids = [];
  
  this.add = function(comp,layer){
    if(this.comps[layer] == undefined || this.comps[layer] ==null){
      this.comps[layer] = [];
      this.ids.push(layer || 0);
    }
    this.comps[layer].push(comp);
  }
  
  this.draw = function(){
    this.ids.forEach((val)=>{
      this.comps[val].forEach((value)=>{
        if(value.isInside()){
          value.draw();
        }else{
          value.move(value.vel[0],value.vel[1]);
        }
      });
    });
  }
  
  this.move = function(a,b){
    this.ids.forEach((val)=>{
      this.comps[val].forEach((value)=>{
        value.move(-a,-b);
      });
    });
  }
  
}

function behaviour(comp){
  this.mass = 10;
  this.e = 1;
  this.comp = comp;
  
  this.set_mass = function(m){
    if(m <= 0.0000000001){
      this.mass = 0.0000000001;
    }else{
      this.mass = m;
    }
  }
  
  this.set_e = function(e){
    if(e>1 || e<0){
      return;
    }else{
      this.e = e;
    }
  }
  
  this.final_vel = function(other){ //other is a behaviour
    let e_mean = (this.e+other.e)/2;
    let u1x = this.comp.vel[0];
    let u1y = this.comp.vel[1];
    let u2x = other.comp.vel[0];
    let u2y = other.comp.vel[1];
    let v2x = (-e_mean*(u2x-u1x)+(this.mass*u1x+other.mass*u2x)/this.mass)/(1+other.mass/this.mass);
    let v2y = (-e_mean*(u2y-u1y)+(this.mass*u1y+other.mass*u2y)/this.mass)/(1+other.mass/this.mass);
    let v1x = v2x + e_mean*(u2x-u1x);
    let v1y = v2y + e_mean*(u2y-u1y);
    this.comp.vel[0] = v1x;
    this.comp.vel[1] = v1y;
    other.comp.vel[0] = v2x;
    other.comp.vel[1] = v2y;
  }
}

function component(){
  this.shapes = [];
  this.vel = [0,0];
  this.radius = 50;
  this.center = [0,0];
  
  this.add = function(x,y,w,h,c){
    let p = new draw_rect();
    p.x = x;
    p.y = y;
    p.w = w;
    p.h = h;
    p.color = c || p.color;
    this.shapes.push(p);
    this.calculate_center_and_radius();
    return this;
  }
  
  this.calculate_center_and_radius = function(){
    let r1 = 0;
    let r2 = 0;
    let q1 = 0;
    let q2 = 0;
    this.shapes.forEach((val)=>{
      r1 += (val.x+val.w)+val.x;
      r2 += (val.y+val.h)+val.y;
    });
    this.center[0] = r1/this.shapes.length*0.5;
    this.center[1] = r2/this.shapes.length*0.5;
    this.shapes.forEach((val)=>{
      q1 = q1-this.center[0] > q1-(val.x) ? (val.x):q1;
      q2 = q2-this.center[1] > q2-(val.y) ? (val.y):q1;
      q1 = q1-this.center[0] > q1-(val.x+val.w) ? (val.x+val.w):q1;
      q2 = q2-this.center[1] > q2-(val.y+val.h) ? (val.y+val.h):q1;
    });
    this.radius = sqrt((this.center[0]-q1)**2+(this.center[1]-q2)**2)*2;
  }
  
  this.draw = function(){
    this.shapes.forEach((val)=>{
      val.draw();
    });
    // fill(255,255,0,125);
    // circle(this.center[0],this.center[1],this.radius);
    this.move(this.vel[0],this.vel[1]);
  }
  
  this.copy = function(){
    let p = new component();
    this.shapes.forEach((val)=>{
      p.shapes.push(val.copy());
    });
    p.vel[0] = this.vel[0];
    p.vel[1] = this.vel[1];
    p.center[0] = this.center[0];
    p.center[1] = this.center[1];
    p.radius = this.radius;
    return p;
  }
  
  this.move = function(a,b){
    this.shapes.forEach((val)=>{
      val.move(a,b);
    });
    this.center[0] += a;
    this.center[1] += b;
  }
  
  this.del_vel = function(a,b){
    this.vel[0] += a;
    this.vel[1] += b;
  }
  
  this.collision = function(other){
    let p = false;
    if(sqrt((this.center[0]-other.center[0])**2+(this.center[1]-other.center[1])**2) <= (this.radius+other.radius)*2/3){
    this.shapes.forEach((val1)=>{
      other.shapes.forEach((val2)=>{
        if(val1.collision(val1,val2)[0]){
         p =  p || true; 
          return;
        }
      });
      if(p == true){
        return;
      }
    });
    }
    return p;
  }
  
  this.isInside = function(){
    let p1 = this.center[0] + this.radius/2;
    let p2 = this.center[1] + this.radius/2;
    let q1 = this.center[0] - this.radius/2;
    let q2 = this.center[1] - this.radius/2;
    if((p1<width*5/4 && p2<height*5/4) && (q1>-width*1/4 && q2>-height*1/4) && (q1>-width*1/4 && p2<height*5/4) && (p1<width*5/4 && q2>-height*1/4)){
      return true;
    }
    return false;
  }
}

function draw_rect(){
  this.x = 0;
  this.y = 0;
  this.w = 50;
  this.h = 50;
  this.color = color(255,255,255);
  
  this.draw = function(){
    push();
    fill(this.color);
    rect(this.x,this.y,this.w,this.h)
    pop();
  }
  
  this.copy = function(){
    let p = new draw_rect();
    p.x = this.x;
    p.y = this.y;
    p.w = this.w;
    p.h = this.h;
    p.color = this.color;
    return p;
  }
  
  
  this.move = function(a,b){
    this.x += a;
    this.y += b;
  }
  
  
  this.collision = function(rect1,rect2){
    let a1 = rect1.x, b1 = rect1.y;
    let a2 = rect2.x, b2 = rect2.y;
    let c1 = rect1.w, d1 = rect1.h;
    let c2 = rect2.w, d2 = rect2.h;
    let ds = [];
    
    if(a1 >= a2 && b1 >= b2){
      ds.push(["1","top","left"]);
    }else if(a1 <= a2 && b1 <= b2){
      ds.push(["2","top","left"]);
    }
    if(a1 + c1 <= a2 +c2 && b1 >= b2 ){
      ds.push(["1","top","right"]);
    }else if(a1 + c1 >= a2 +c2 && b1 <= b2){
      ds.push(["2","top","right"]);
    }
    if(a1 >= a2 && b1 + d1 <= b2 + d2){
      ds.push(["1","bottom","left"]);
    }else if(a1 <= a2 && b1 + d1 >= b2 + d2){
      ds.push(["2","bottom","left"]);
    }
    if(a1 + c1 <= a2 + c2 && b1 + d1 <= b2 + d2){
      ds.push(["1","bottom","right"]);
    }else if(a1 + c1 >= a2 + c2 && b1 + d1 >= b2 + d2){
      ds.push(["2","bottom","right"]);
    }
    
    
    if(this.inside_box(rect1,a2,b2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,a2,b2+d2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,a2+c2,b2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,a2+c2,b2+d2)){
      return [true,ds];
    }
    if(this.inside_box(rect2,a1,b1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,a1,b1+d1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,a1+c1,b1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,a1+c1,b1+d1)){
      return [true,ds];
    }
    
    return [false,ds];
  }
  
  this.inside_box = function(rect,a,b){
    if(rect.x <= a && rect.x+rect.w >= a && rect.y <= b && rect.y+rect.h>=b){
      return true;
    }
    return false;
  }
  
  this.is_inside = function(a,b){
    
    if(this.x < a && this.x+this.w > a && this.y < b && this.y+this.h>b){
      return true;
    }
    return false;
  }
  
}
