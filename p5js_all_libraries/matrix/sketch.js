let coord = [];

function setup() {
  createCanvas(400, 400);
  for(let i=0; i<100 ; i++){
    coord.push(new m());
    for(let j=0; j<100 ; j++){
      coord[i].add_point(random(100),random(100));
    }
    coord[i].translate(random(200),random(200));
  }
}

function draw() {
  background(220);
  for(let i=0; i<100 ; i++){
    coord[i].push();
    coord[i].scale(1.001);
    coord[i].rotate(random(5));
    coord[i].translate(random(10),random(10));
    fill(color(255,i,i));
    circle(coord[i].final_origin[0],coord[i].final_origin[1],20);
    for(let j=0; j<100 ; j++){
      fill(color(j,255,j));
      let p = coord[i].get_point(j);
      circle(p[0],p[1],20);
    }
    coord[i].pop();
  }
}



function m(){
  this.final_origin = [0,0];
  this.points = [];
  this.history = [];
  this.mat = new matrix();
  this.count = 0;
  this.pushed_origin = [0,0];
  this.pushed_points = [];
  this.pushed_mat = new matrix();
  this.kk = 0;
  
  this.add_point = function(a,b){
    this.points.push([a,b]);
    this.pushed_points.push([0,0]);
    this.count++;
  }
  
  this.get_point = function(index){
    return this.points[index];
  }
  
  this.push = function(){
    this.pushed_origin[0] = this.final_origin[0];
    this.pushed_origin[1] = this.final_origin[1];
    for(let i=0; i<this.count; i++){
      this.pushed_points[i][0] = this.points[i][0];
      this.pushed_points[i][1] = this.points[i][1];
    }
    this.pushed_mat.ix = this.mat.ix;
    this.pushed_mat.iy = this.mat.iy;
    this.pushed_mat.jx = this.mat.jx;
    this.pushed_mat.jy = this.mat.jy;
  }
  
  this.pop = function(){
    this.final_origin[0] = this.pushed_origin[0];
    this.final_origin[1] = this.pushed_origin[1];
    for(let i=0; i<this.count; i++){
      this.points[i][0] = this.pushed_points[i][0];
      this.points[i][1] = this.pushed_points[i][1];
    }
    this.mat.ix = this.pushed_mat.ix;
    this.mat.iy = this.pushed_mat.iy;
    this.mat.jx = this.pushed_mat.jx;
    this.mat.jy = this.pushed_mat.jy;
  }
  
  this.translate = function(a,b){
    this.history.push({translate:[a,b]});
    let prev0 = this.final_origin[0];
    let prev1 = this.final_origin[1];
    this.final_origin[0] += this.mat.ix*a+this.mat.iy*a;
    this.final_origin[1] += this.mat.jx*b+this.mat.jy*b;
    for(let i=0; i<this.points.length; i++){
      this.points[i][0] += this.final_origin[0] - prev0;
      this.points[i][1] += this.final_origin[1] - prev1;
    }
  }
  
  this.rotate = function(angle){
    this.history.push({rotate:[angle]});
    for(let i=0; i<this.points.length; i++){
      let a1 = this.points[i][0] - this.final_origin[0] ;
      let a2 = this.points[i][1] - this.final_origin[1] ;
      [a1,a2] = this.mat.apply_inverse(a1,a2);
      this.mat.rotate(angle);
      [a1,a2] = this.mat.rotate_point(a1,a2);
      this.points[i][0] = this.final_origin[0] + a1;
      this.points[i][1] = this.final_origin[1] + a2;
    }
  }
  
  this.scale = function(a,b){
    this.history.push({scale:[a,b]});
    for(let i=0; i<this.points.length; i++){
      let a1 = this.points[i][0] - this.final_origin[0] ;
      let a2 = this.points[i][1] - this.final_origin[1] ;
      [a1,a2] = this.mat.apply_inverse(a1,a2);
      this.mat.scale(a,a);
      [a1,a2] = this.mat.transform(a1,a2);
      this.points[i][0] = this.final_origin[0] + a1;
      this.points[i][1] = this.final_origin[1] + a2;
    }
  }
}


function matrix(){
  this.ix = 1;
  this.iy = 0;
  this.jx = 0;
  this.jy = 1;
  
  this.set = function(a,b,c,d){
    this.ix = a;
    this.iy = b;
    this.jx = c;
    this.jy = d;
  }
  
  this.apply_matrix = function(ax,ay,bx,by,a,b){
    let a1 = a*ax+b*bx;
    let a2 = a*ay+b*by;
    return [a1,a2];
  }
  
  this.transform = function(a,b){
    let a1 = a*this.ix+b*this.jx;
    let a2 = a*this.iy+b*this.jy;
    return [a1,a2];
  }
  
  
  this.rotate = function(angle){
    let angle1 = angle*PI/180;
    let c1 = cos(angle1);
    let s1 = sin(angle1);
    let a1 = c1*this.ix-s1*this.iy;
    let a2 = c1*this.jx-s1*this.jy;
    let b1 =  s1*this.ix+c1*this.iy;
    let b2 =  s1*this.jx+c1*this.jy;
    this.ix = a1;
    this.jx = a2;
    this.iy = b1;
    this.jy = b2;
  }
  
  this.rotate_point = function(a,b){
    let a1 = a*this.ix+b*this.jx;
    let a2 = a*this.iy+b*this.jy;
    return [a1,a2];
  }
  
  this.scale = function(s1,s2){
    this.ix *= s1;
    this.iy *= s1;
    this.jx *= s2;
    this.jy *= s2;
  }
  
  
  this.apply_inverse = function(a,b){
    let mag = this.ix*this.jy - this.jx*this.iy;
    let ax = this.jy;
    let ay = -this.iy;
    let bx = -this.jx;
    let by = this.ix;
    if(mag == 0){
      console.log("Sorry , determinant is zero");
      return [a,b];
    }
    let a1 = a*ax+b*bx;
    let a2 = a*ay+b*by;
    a1 /= mag;
    a2 /= mag;
    return [a1,a2];
  }
}
