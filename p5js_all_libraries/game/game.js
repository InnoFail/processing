

function world(){
  this.camera = [];
  this.surrounding = {"start":null};
  this.camera_pos = createVector(0,0);
  this.rot = 0;
  
  this.add_camera_component = function(c){
    if(this.camera.length < 1){
    this.camera.push(c);
    }
    return this;
  }
  
  this.add_other = function(id,c){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    this.surrounding[p] = c;
    return this;
  }
  
  this.remove_surrounding = function(id){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    let q = this.surrounding[p];
    delete this.surrounding[p];
    return q;
  }
  
  this.pos = function(a,b){
    this.camera_pos = createVector(a,b);
    return this;
  }
  
  this.angle = function(angle){
    this.rot = angle;
    return this;
  }
  
  this.draw = function(){
    push();
    if(this.camera.length > 0){
      this.camera[0].draw();
    }
    
    translate(-this.camera_pos.x,-this.camera_pos.y);
    rotate(this.rot*PI/180);
    let list = Object.keys(this.surrounding);
    list.shift();
    list.forEach(function(objs){
      objs.draw();
    });
    pop();
  }
}




function component(){
  this.shapes = {"start":null};
  this.pos_shapes = {"start":createVector(0,0)};
  this.vel_shapes = {"start":createVector(0,0)};
  this.rot_shapes = {"start":0};
  
  this.add = function(id,shape){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    this.shapes[p] = shape;
    this.pos_shapes[p] = createVector(0,0);
    this.vel_shapes[p] = createVector(0,0);
    return this;
  }
  
  this.remove = function(id){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    let q = [this.shapes[p],this.pos_shapes[p],this.pos_shapes[p],this.pos_shapes[p]];
    delete this.shapes[p];
    delete this.pos_shapes[p];
    delete this.vel_shapes[p];
    delete this.rot_shapes[p];
    return q;
  }
  
  this.pos = function(id,a,b){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.inclides(p)){
      console.log("provided key is not present");
      return;
    }
    this.pos_shapes[p] = createVector(a,b);
    return this;
    }


  this.vel = function(id,a,b){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.inclides(p)){
      console.log("provided key is not present");
      return;
    }
    this.vel_shapes[p] =  createVector(a,b);
    return this;
    }
  
  this.angle = function(id,angle){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.inclides(p)){
      console.log("provided key is not present");
      return;
    }
    this.rot_shapes[p] = angle;
    return this;
    }
  
  this.draw = function(){
    let list = Object.keys(this.shapes);
    list.shift();
    list.forEach(function(key){
      let p = this.pos_shapes[key];
      let q = this.vel_shapes[key];
      let r = this.rot_shapes[key];
      let s = this.shapes[key];
      push();
      translate(p.x,p.y);
      rotate(r*PI/180);
      s.draw();
      pop();
      this.pos_shapes[key] = p5.Vector.add(p,q);
    });
  }
  
  this.collision = function(other){
    let list1 = Object.keys(this.shapes);
    list1.shift();
    list1.forEach(function(key){
      let p1 = this.pos_shapes[key];
      let s1 = this.shapes[key];
       let list2 = Object.keys(other.shapes);
       list2.shift();
       list2.forEach(function(key){
         let p2 = this.pos_shapes[key];
         let s2 = this.shapes[key];
         if(s1.colli_r != -1 || s2.colli.r != -1){
           let k1 = p1.x - p2.x;
           let k2 = p1.y - p2.y;
           let kf = sqrt(k1**2 + k2**2);
           if(s1.colli_r+s2.colli_r >= kf){
             let r = s1.collision(s1,p1,s2,p2);
             if(r[0] == true){
               return r[0];
             }
           }
         }else{
           let r = s1.collision(s1,p1,s2,p2);
           if(r[0] == true){
             return r[0];
           }
         }
       });
    });
    return false;
  }
  
  
}

function draw_rect(){
  this.x = 0;
  this.y = 0;
  this.width = 50;
  this.height = 50;
  this.colli_r = this.width;
  this.max_val = 3;
  this.color = color(255,255,255);
  this.stroke_color = color(255,255,255);
  this.str = "";
  this.text_size = 12;
  this.text_x = this.x;
  this.text_y = this.y;
  this.text_width = this.width;
  this.text_height = this.height;
  this.text_color = color(0,0,0);
  
  this.size = function(a,b){
    this.width = a;
    this.height = b;
    this.colli_r = this.width >= this.height ? this.width : this.height;
    if(this.height > this.max_val*this.width || this.height*this.max_val < this.width){
      this.colli_r = -1;
    }
    return this;
  }
  
  this.pos = function(a,b){
    this.x = a;
    this.y = b;
    return this;
  }
  
  this.set_color = function(a){
    this.color = a;
    return this;
  }
  
  this.set_stroke_color = function(a){
    this.stroke_color = a;
    return this;
  }
  
  this.set_text_color = function(a){
    this.text_color = a;
    return this;
  }
  
  this.set_str = function(a){
    this.str = a;
    return this;
  }
  
  this.resize_text = function(a,b,c,d,size){
    this.text_x = a;
    this.text_y = b;
    this.text_width = c || this.text_width;
    this.text_height = d || this.text_height;
    this.text_size = size || this.text_size;
    return this;
  }
  
  this.del = function(a,b,c,d){
    this.x += a;
    this.y += b;
    this.width += c || 0;
    this.height += d || 0;
    return this;
  }
  
  this.draw = function(){
    fill(this.color);
    stroke(this.stroke_color);
    rect(this.x,this.y,this.width,this.height);
    fill(this.text_color);
    textWrap(WORD);
    textSize(this.text_size);
    text(this.str,this.text_x,this.text_y,this.text_width,this.text_height);
  }
  
  this.collision = function(rect1,rect1_pos,rect2,rect2_pos){
    let a1 = rect1_pos.x, b1 = rect1_pos.y;
    let a2 = rect2_pos.x, b2 = rect2_pos.y;
    let c1 = rect1.width, d1 = rect1.height;
    let c2 = rect2.width, d2 = rect2.height;
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
      ds.push(["2","bottom","left"]);
    }else if(a1 <= a2 && b1 + d1 >= b2 + d2){
      ds.push(["2","bottom","left"]);
    }
    if(a1 + c1 <= a2 + c2 && b1 + d1 <= b2 + d2){
      ds.push(["2","bottom","right"]);
    }else if(a1 + c1 >= a2 + c2 && b1 + d1 >= b2 + d2){
      ds.push(["2","bottom","right"]);
    }
    
    
    
    if(this.inside_box(rect1,rect1_pos,a2,b2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,rect1_pos,a2,b2+d2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,rect1_pos,a2+c2,b2)){
      return [true,ds];
    }
    if(this.inside_box(rect1,rect1_pos,a2+c2,b2+d2)){
      return [true,ds];
    }
    if(this.inside_box(rect2,rect2_pos,a1,b1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,rect2_pos,a1,b1+d1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,rect2_pos,a1+c1,b1)){
      return [true,ds];
    }
    if(this.inside_box(rect2,rect2_pos,a1+c1,b1+d1)){
      return [true,ds];
    }
    
    return [false,ds];
  }
  
  this.inside_box = function(rect,rect_pos,a,b){
    
    if(rect_pos.x <= a && rect_pos.x+rect.width >= a && rect_pos.y <= b && rect_pos.y+rect.height>=b){
      return true;
    }
    return false;
  }
  
  this.is_inside = function(a,b){
    
    if(this.x < a && this.x+this.width > a && this.y < b && this.y+this.height>b){
      return true;
    }
    return false;
  }
  
}
