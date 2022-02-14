let u,v,w,t,g;
let ii=0,pp="";

function setup(){
   createCanvas(600,350);
  u = new ui().grid(5,5).c(125,0,125);
  v = u.copy().set_snap(0,0,4,5).grid(3,3).c(125,225,125);
  w = u.copy().set_snap(4,0,5,5).c(125,125,0);
  g =v.copy().set_snap(0,2,3,3).c(255,0,0);
  //w.set_clip(true);s
  w.set_text_color(color(255,0,255));
  //g.set_clip(true);
}


function draw(){
  background(125);
  u.draw();
  v.draw();
  w.draw();
  g.draw();
  v.set_str("Hover on red box and then try to type something.")
  if(u.clicked()){
    v.del_snap(0,0,-delx()/60,0,true);
    w.del_snap(-delx()/60,0,0,0,true);
    g.del_snap(0,-dely()/60,0,0,true);
  }
  
    g.set_str(pp);
  ii = ii+0.2;
  if(ii >= 255){
    ii = 0;
  }
  
}

function keyReleased(){
  if( g.hovered()){
    pp += key;
  }
}


function delx(){
  return  pmouseX - mouseX;
}


function dely(){
  return  pmouseY - mouseY;
}
