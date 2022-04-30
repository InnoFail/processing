let u,v,p,q,r;
let t1,t2,t3;
let h;
let v_txt="";

function setup(){
   createCanvas(600,350);
  h = new help();
  u = new ui().grid(10,1).set_color(h.n_pink);
  r = u.copy().set_snap(2,0.02,6,0.08).set_color(h.l(h.n_blue,h.grey_3));
  v = u.copy().set_snap(0.1,0.1,8,0.9).set_color(h.l(h.grey_1,h.white));
  v.set_clip(true);
  p = u.copy().set_snap(8.5,0.1,9,0.9).grid(1,10);
  p.set_stroke_color(h.black);
  q = p.copy().set_snap(0,0,1,1).set_color(h.grey_4);
}


function draw(){
  background(125);
  if(q.clicked()){
    let dely = h.dely();
    if(q.t_end()){
     dely = 0;
     q.del_snap_px(0,1,0,1,true);
    }
    if(q.b_end()){
     q.del_snap_px(0,-1,0,-1,true);
     dely = 0;
    }
    q.del_snap_px(0,-dely,0,-dely,true);
    v.set_scroll(0,v.scrolly+dely);
  }
  
  if(q.hovered()){
    q.set_color(h.l(h.grey_4,h.grey_3));
  }else{
    q.set_color(h.grey_4);
  }
  
  if(v.focused()){
    v.set_color(h.white);
    let temp = h.get_key();
    if(temp == "Enter"){
      v_txt += "\n";
    }else if(temp == "Shift"){
      //v_txt += temp.charAt(0).toUpperCase();
    }else if(temp == "Backspace"){
      v_txt = v_txt.substring(0,v_txt.length-1);
    }else{
      v_txt += temp;
    }
  }else{
    v.set_color(h.l(h.grey_1,h.white));
  }
  r.set_str(" Click on white space and start typing");
  v.set_str(v_txt);
  u.draw();
  r.draw();
  v.draw();
  p.draw();
  q.draw();
}


