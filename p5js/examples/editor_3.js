let u,v,p,q,r,s,t,a,b;
let slider, bar;
let t1,t2,t3;
let h;
let v_txt="abcdefghijklmnopqrstuvwxyz";
let count = 0;

function setup(){
   createCanvas(400,300);
  h = new help();
  u = new group(new ui().set_color(h.n_red));
  u.ui.grid(1,3);
  for(let i=0; i< 7;i++){
    for(let j=2; j<6 ;j++){
      let a=0,b=0;
      let pp = u.ui.width;
      let ph = u.ui.height;
      u.copy();
      u.child(count).ui.set_snap(1/8*i,1/6*j,1/8*(i+1),1/6*(j+1)).set_color(h.n_green).set_stroke_color(h.black).set_str(v_txt.charAt(count)).set_scroll(-u.child(count).ui.width/2+u.child(count).ui.get_text_width()/2,-u.child(count).ui.height/2+u.child(count).ui.lineh/2).set_radius_px(10);
      count++;
  }
  }
  
  slider = u.copy();
  slider.ui.set_snap(0.95,0,1,1).set_color(h.white);
  bar = slider.copy();
  bar.ui.set_snap(0,0.1,1,0.2).set_color(h.grey);
}


function draw(){
  if(bar.ui.clicked()){
    bar.ui.del_snap_px(-h.delx(),-h.dely(),-h.delx(),-h.dely(),true,true);
  }
  
  u.ui.draw();
  slider.ui.draw();
  bar.ui.draw();
  if(u.ui.focused()){
      u.ui.set_color(h.alpha(h.n_red,225));
    }else if(!u.ui.hovered()){
      u.ui.set_color(h.n_red);
    }
  for(let i=0; i<count ;i++){
    let vi = u.child(i).ui;
    
    if(vi.hovered()){
      vi.set_color(h.n_blue);
    }else if(!vi.hovered()){
      vi.set_color(h.n_green);
    }
    if(vi.clicked()){
      vi.set_color(h.n_sky_blue);
    }else if(!vi.hovered() && !vi.clicked()){
      vi.set_color(h.n_green);
    }
    vi.draw();
  }
}


