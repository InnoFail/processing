let u,v;
let n=10,m = 10;
let h;
let u_str = ";You ;can ;say ;so ;as.";


function setup(){
   createCanvas(400,300);
  //font = loadFont("Roboto.ttf");
  h = new help();
  u = new group(new ui().set_color(h.n_red));
  u.ui.grid(50,50);
  v = u.copy();
  v.copy();
  let p = v.child(0).ui;
  p.set_str("Button").set_font_size(16);
  v.ui.set_snap_px(0,0,p.get_text_width()+32,p.lineh+16).set_radius_px(4);
  p.set_scroll(-16,-8).set_color(h.white).set_radius_px(4);
  v.ui.del_snap_px(100,100,100,100).set_color(h.opacity(h.black,125));
  p.del_snap_px(-3,-3,-3,-3);
  //v.ui.set_snap_px(0,0,100,100).set_color(h.white);
}


function draw(){
  //textFont(font);
  if(v.child(0).ui.clicked()){
    let p = v.child(0).ui;
    v.ui.set_color(h.opacity(h.black,0));
    p.set_snap_px(0,0,p.width,p.height);
  }else{
    let p = v.child(0).ui;
    v.ui.set_color(h.opacity(h.black,125));
    p.set_snap_px(-3,-3,p.width-3,p.height-3);
    
  }
  u.ui.draw();
  v.ui.draw();
  v.child(0).ui.draw();
}


