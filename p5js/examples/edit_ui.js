let u,v,w,t,g,p,q;
let ii=0,pp="",keyi="";
let h;

function setup(){
   createCanvas(600,350);
  h = new help();
  u = new ui().grid(5,5).c(125,0,125);
  v = u.copy().set_snap(0,0,4,5).grid(3,3).set_color(h.dye_blue).set_text_color(h.white);
  w = u.copy().set_snap(4,0,5,5).set_color(h.dye_violet);
  g =v.copy().set_snap(0,1,2,2).set_color(h.l(h.grey_3,h.n_red));
  g.set_radius(1);
  q=g.copy().set_snap(0.2,0.2,0.8,0.8).set_text_color(h.l(h.grey_5,h.n_red));
  q.set_clip(true);
  //q.set_scroll(30,10);
  q.sc(0,0,0);
  q.set_text_style(1);
  
  t = new ui().setup([100,100,100,100]).grid(3,3).set_color(h.dye_light_pink);
  p= t.copy().set_snap(0,0,3,1).set_color(h.grey).set_text_color(h.white);
  p.set_align(1,0);
}


function draw(){
  background(125);
  u.draw();
  v.draw();
  w.draw();
  g.draw();
  q.draw();
  t.draw();
  p.draw();
  v.set_str("Hover on red box and then try to type something.");
  if(u.clicked()){
    v.del_snap_px(0,0,-h.delx(),0,true);
    w.del_snap_px(-h.delx(),0,0,0,true);
    g.del_snap_px(0,-h.dely(),0,0,true);
  }
  
  free_hover();
  if(t.clicked()){
    t.repos(-h.delx(),-h.dely());
  }
  
  p.set_str(h.time+"");
  if( g.hovered()){
    pp += keyi;
  }
    q.set_str(pp);
  ii = ii+0.2;
  if(ii >= 255){
    ii = 0;
  }
  
  keyi="";
}

function keyReleased(){
  keyi = key;
}

