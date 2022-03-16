function string(i){
  return i.toString();
}

function world(){
  
  // note camera and surrounding variables expect component object
  this.camera = [];
  this.surrounding = {"start":null};
  this.camera_pos = createVector(0,0);
  this.rot = 0;
  this.layer = {"start":0,"__camera__":0};
  
  this.add_camera_component = function(c,l){
    if(this.camera.length < 1){
    this.camera.push(c);
    }
    this.camera[0].del_move(width/2,height/2);
    this.layer.__camera__ = l || 0;
    return this;
  }
  
  this.add_other = function(id,c,l){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    this.surrounding[p] = c;
    this.surrounding[p].del_move(width/2,height/2);
    this.layer[p] = l || 0 ;
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
    let that = this;
    let list = Object.keys(this.surrounding);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list.forEach(function(objs){
      let obj = that.surrounding[objs];
      obj.del_move(that.camera_pos.x,that.camera_pos.y);
    });
    this.camera_pos = createVector(a,b);
    
    list.forEach(function(objs){
      let obj = that.surrounding[objs];
      obj.del_move(-that.camera_pos.x,-that.camera_pos.y);
    });
    
    return this;
  }
  
  this.del_pos = function(a,b){
    let that = this;
    this.camera_pos.add(a,b);
    let list = Object.keys(this.surrounding);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list.forEach(function(objs){
      let obj = that.surrounding[objs];
      obj.del_move(-a,-b);
    });
    return this;
  }
  
  
  this.angle = function(angle){
    let that = this;
    let p1 = this.camera[0];
    let list = Object.keys(this.surrounding);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list.forEach(function(objs){
      let p2 = that.surrounding[objs];
      let p3 = p5.Vector.sub(p2.translate,p1.translate);
      p3.rotate(-that.rot*PI/180);
      p3.rotate(angle*PI/180);
      p2.move(p3.x+p1.translate.x,p3.y+p1.translate.y);
    });
    
    this.rot = angle;
    return this;
  }
  
  this.del_angle = function(angle){
    this.rot += angle;
    let that = this;
    let p1 = this.camera[0];
    let list = Object.keys(this.surrounding);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list.forEach(function(objs){
      let p2 = that.surrounding[objs];
      let p3 = p5.Vector.sub(p2.translate,p1.translate);
      p3.rotate(angle*PI/180);
      p2.move(p3.x+p1.translate.x,p3.y+p1.translate.y);
    });
    return this;
  }
  
  this.draw = function(){
    let that = this;
    
    
    let list = Object.keys(this.surrounding);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    let p = [];
    let list1 = Object.keys(this.layer);
    list1 = list1.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list1.forEach(function(value,index){
      let val = that.layer[value];
      if(p[val] == undefined || p[val] == null){
        p[val] = [];
      }
      p[val].push(value);
    });
    for(let i=0; i<p.length ; i++){
      for(let j=0; j<p[i].length;j++){
        if(p[i][j] != "__camera__"){
          let obj = that.surrounding[p[i][j]];
          obj.draw();
        }else if( p[i][j] == "__camera__"){
          if(this.camera.length > 0){
            this.camera[0].draw();
          }
        }
      }
    }
    
  }
}




function component(){
  this.shapes = {"start":null};
  this.pos_shapes = {"start":createVector(0,0)};
  this.vel_shapes = {"start":createVector(0,0)};
  this.rot_shapes = {"start":0};
  this.angle_rot = 0;
  this.translate = createVector(0,0);
  
  this.get = function(id){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    return [this.shapes[p],this.pos_shapes[p],this.vel_shapes[p],this.rot_shapes[p]];
  }
  
  this.add = function(id,shape){
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key is provided null or undefined");
      return;
    }
    this.shapes[p] = shape;
    this.pos_shapes[p] = createVector(0,0);
    this.vel_shapes[p] = createVector(0,0);
    this.rot_shapes[p] = 0;
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
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.pos_shapes[p] = createVector(a,b);
    return this;
    }
  
  this.del_pos = function(id,a,b){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.pos_shapes[p].add(a,b);
    return this;
  }


  this.vel = function(id,a,b){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.vel_shapes[p] =  createVector(a,b);
    return this;
    }
  
  this.del_vel = function(id,a,b){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.vel_shapes[p].add(a,b);
    return this;
    }
  
  this.angle = function(id,angle){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.rot_shapes[p] = angle;
    return this;
    }
  
  this.del_angle = function(id,angle){
    let list = Object.keys(this.shapes);
    let p = string(id);
    if(p == undefined || p == null){
      console.log("The key provided is null or undefined");
      return;
    }
    if(!list.includes(p)){
      console.log("provided key is not present");
      return;
    }
    this.rot_shapes[p] += angle;
    return this;
    }
  
  this.rot = function(a){
    this.angle_rot = a;
    return this;
  }
  
  this.del_rot = function(a){
    this.angle_rot += a;
    return this;
  }
  
  this.move = function(a,b){
    this.translate = createVector(a,b);
    return this;
  }
  
  this.del_move = function(a,b){
    this.translate.add(a,b);
    return this;
  }
  
  this.draw = function(){
    let list = Object.keys(this.shapes);
    list = list.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    push();
    translate(this.translate.x,this.translate.y);
    rotate(this.angle_rot*PI/180);
    let that = this;
    list.forEach(function(key){
      let p = that.pos_shapes[key];
      let q = that.vel_shapes[key];
      let r = that.rot_shapes[key];
      let s = that.shapes[key];
      push();
      let len = sqrt(p.x**2+p.y**2);
      let angle2 = atan2(p.y,p.x);
      let mp = -that.angle_rot*PI/180 + angle2;
      translate(len*(cos(mp)),len*(sin(mp)));
      rotate(r*PI/180);
      s.draw();
      pop();
      that.pos_shapes[key] = p5.Vector.add(p,q);
    });
      pop();
  }
  
  this.collision = function(other){
    let that = this;
    let final_answer = false;
    let list1 = Object.keys(this.shapes);
    list1 = list1.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list1.forEach(function(key){
      let p1 = that.pos_shapes[key];
      let s1 = that.shapes[key];
      let t1 = that.translate;
       let list2 = Object.keys(other.shapes);
      list2 = list2.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
        list2.forEach(function(key){
         let p2 = other.pos_shapes[key];
         let s2 = other.shapes[key];
         let t2 = other.translate;
         if(s1.colli_r != -1 || s2.colli.r != -1){
           let k1 = p1.x + t1.x - p2.x - t2.x;
           let k2 = p1.y + t1.y - p2.y - t2.y;
           let kf = sqrt(k1**2 + k2**2);
           if(s1.colli_r+s2.colli_r >= kf){
             let r = s1.collision(s1,createVector(p1.x+t1.x,p1.y+t1.y),s2,createVector(p2.x+t2.x,p2.y+t2.y));
             if(r[0] == true){
               final_answer = r[0];
               return;
             }
           }
         }else{
           let r = s1.collision(s1,p1,s2,p2);
           if(r[0] == true){
             final_answer = r[0];
               return;
           }
         }
          if(final_answer == true){
            return;
          }
       });
      if(final_answer == true){
        return;
      }
    });
    return final_answer || false;
  }
  
  this.copy = function(){
    let p = new component();
    let that = this;
    let list1 = Object.keys(this.shapes);
    list1 = list1.filter(function(value){
      if(value != "start"){
        return value;
      }
    });
    list1.forEach(function(key){
      let p1 = that.pos_shapes[key];
      let s1 = that.shapes[key];
      let q1 = that.vel_shapes[key];
      let r1 = that.rot_shapes[key];
      let t1 = that.translate;
      p.add(key,s1);
      p.pos(key,p1.x,p1.y);
      p.vel(key,q1.x,q1.y);
      p.angle(key,r1);
      p.rot(that.angle_rot);
      });
    return p;
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
  
  this.copy = function(){
    let p = new draw_rect();
    p.size(this.width,this.height);
    p.pos(this.x,this.y);
    p.set_color(this.color);
    p.set_stroke_color(this.stroke_color);
    p.set_text_color(this.text_color);
    p.set_str(this.str);
    p.resize_text(this.text_x,this.text_y,this.text_width,this.text_height,this.text_size);
    p.colli_r = this.colli_r;
    return p;
  }
  
}
