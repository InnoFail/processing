//It works finer than i thought
//If return value is in [360-delta,360+delta] then point lies inside the convex or concave shape.


let points = {
}
let hold = [];
let p = [150,150];

function setup() {
  createCanvas(400, 400);
  let radius = 100;
  for(let i=0,count = 0 ; i<360 ; i+=random(random(100)),count++){
    points[count] = [];
    points[count].push(width/2+random(radius)*cos(i*PI/180));
    points[count].push(height/2+random(radius)*sin(i*PI/180));
  }
  
  for(let k=0 ; k<width; k++){
    hold.push([]);
    for(let j=0; j<height ; j++){
      hold[k].push([]);
      hold[k][j] = 0;
    }
  }
  
  let s1 = 0;
  let keys = Object.keys(points);
  for(let i=0; i<keys.length; i++){
    let p1 = points[keys[i]];
    let p2 = points[keys[ i == keys.length-1 ? 0 : i+1]];
    circle(p1[0],p1[1],20);
    line(p1[0],p1[1],p2[0],p2[1]);
    let u1 = createVector(p1[0],p1[1]);
    let u2 = createVector(p2[0],p2[1]);
    let u = createVector(p[0],p[1]);
    let z1 = p5.Vector.sub(u1,u);
    let z2 = p5.Vector.sub(u2,u);
    let angle = z1.angleBetween(z2)*180/PI;
    s1 += angle;
    //console.log(angle);
    for(let k=0 ; k<width; k++){
    for(let j=0; j<height ; j++){
      let u3 = createVector(k,j);
      z1 = p5.Vector.sub(u1,u3);
      z2 = p5.Vector.sub(u2,u3);
      angle = z1.angleBetween(z2)*180/PI;
      hold[k][j] += angle;
    }
  }
  }
}

function draw() {
  background(220);
  s1 = polyDetection(points);
  fill(0,255,0);
  noStroke();
  for(let k=0 ; k<width; k++){
    for(let j=0; j<height ; j++){
      if(hold[k][j] == 0){
        circle(k,j,1);
      }
    }
  }
  fill(0);
  text(s1,p[0]-15,p[1]+25);
  [p[0],p[1]] = [mouseX,mouseY];
}

function polyDetection(points){
  fill(255,255,0);
  circle(p[0],p[1],20);
  fill(color(255,0,0));
  stroke(0);
  let s1 = 0;
  let keys = Object.keys(points);
  for(let i=0; i<keys.length; i++){
    let p1 = points[keys[i]];
    let p2 = points[keys[ i == keys.length-1 ? 0 : i+1]];
    circle(p1[0],p1[1],20);
    line(p1[0],p1[1],p2[0],p2[1]);
    let u1 = createVector(p1[0],p1[1]);
    let u2 = createVector(p2[0],p2[1]);
    let u = createVector(p[0],p[1]);
    let z1 = p5.Vector.sub(u1,u);
    let z2 = p5.Vector.sub(u2,u);
    let angle = z1.angleBetween(z2)*180/PI;
    s1 += angle;
    //console.log(angle);
  }
  return s1;
}



