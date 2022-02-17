let u,v,p,q,r,s,t,a,b;
let t1,t2,t3;
let h;
let v_txt="";

function setup(){
   createCanvas(400,300);
  h = new help();
  u = new ui().grid(16,10).set_color(h.vb_orange);
  v = u.copy().set_snap(1,1,5,5).set_color(h.vb_blue);
  p = u.copy().set_snap(1,6,5,9).set_color(h.vb_yellow);
  
  r = u.copy().set_snap(6,4,9,6).grid(1,3).set_color(h.clear);
  s = r.copy().set_font_size(16).set_str("Scroll").set_no_edit(true);
  
//making button with s and t using v as a container to make calculations
//after making v , we make s with snap_px to have more control over pixel and then applying googles material design principle we make a container s with text "scroll" and font size 16px 
//and the (0,0) size of(text_width+padding_left+padding_right,text_height+padding_top+padding_bottom)
//we do not display s texts since we want to position it to center so we make t ui
//t with position (padding_left_of_s,padding_top_of_s) and bottom_left corner coordinates as (s.width - padding_right_of_s,s.height - padding_bottom_of_s)
   s.set_snap_px(0,0,s.get_text_width()+16,s.get_line_height()+16).set_text_color(h.black).set_stroke_color(h.white);
  t = s.copy().set_snap_px(8,8,s.width-8,s.height-8).set_str("Scroll");
  // a is a component of s with no parent
  // b is component of t with parant a
  a = s.component(null).repos(120,0,120,0);
  b = t.component(a);
}


function draw(){
  //console.log(s.snaps,s.height);
  if(s.clicked()){
    s.set_color(h.vb_aqua);
    t.set_text_color(h.white);
  }else{
    s.set_color(h.clear);
    t.set_text_color(h.black);
  }
  u.draw();
  v.draw();
  p.draw();
  r.draw();
  s.draw();
  t.draw();
  a.draw();
  b.draw();
}
