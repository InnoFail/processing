//Remember to include ui.js in same directory as sketch_1 in p5js online editor
//Alternatively you can also include js paths in index.html

let u,v,w,t,g;
let ii=0;

function setup(){
   createCanvas(600,350);
  u = new ui().setup([100,100,100,100]).grid(5,5).c(125,0,125);
  v = u.copy().set_snap(0.2,0,5-0.2,4).c(125,225,125);
  w = u.copy().set_snap(0.2,4,5-0.2,5).c(125,125,0);
  t = u.copy().set_snap(0,0,5,-1).c(255,0,0);
  g = new ui().setup([200,200,100,100]).grid(5,5).c(0,0,125);
  w.set_clip(true);
  w.set_text_color(color(255,0,255));
  g.set_clip(true);
}


function draw(){
  background(125);
  //image(kp,100,100);
  if(u.clicked()){
    //console.log(mouseX,mouseY);
    v.del_snap(0,0,0,-dely()/60,true);
    w.del_snap(0,-dely()/60,0,0,true);
  }
  if(t.clicked()){
    //console.log(mouseX,mouseY);
    u.repos(-delx(),-dely(),0,0);
  }
  
  if(g.clicked()){
    //console.log(mouseX,mouseY);
    g.repos(-delx(),-dely(),0,0);
  }
  
  
  g.c(0,0,125,ii);
  g.set_angle(ii);
  u.draw();
  v.draw();
  w.draw();
  t.draw();
  
  g.draw();
     g.set_str("Hesdfsffdsddsasasdffggdsdsdsasassdsfdfdffdsfdsfdsfsdfsdfsdfsdfsfsdfsfddfsflo");
  
  ii = ii+0.2;
  if(ii >= 255){
    ii = 0;
  }
  
}


function delx(){
  return  pmouseX - mouseX;
}


function dely(){
  return  pmouseY - mouseY;
}
