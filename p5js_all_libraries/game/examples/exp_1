let p,s,u,v,t,w,ppp=0;

function setup() {
  createCanvas(400, 400);
  u = new component();
  u.add(0,new draw_rect());
  u.add(1,new draw_rect());
  u.get(0)[0].set_str("wow i am so damn good at these thing that i can't even imagine to say aye");
  u.del_move(50,20);
  u.get(1)[0].set_color(color(255,0,255));
  u.pos(1,10,10);
  v = new component();
  v.add(0,new draw_rect());
  t = new component();
  t.add(0,new draw_rect());
  t.get(0)[0].size(1,1).colli_r = 200;
  w = new world();
  w.add_camera_component(v,1);
  p = u.copy();
  p.del_move(50,50);
  w.add_other(0,p,0);
  w.add_other(2,u,0);
  let list = [color(255,0,0),color(0,255,0),color(0,0,255)];
  s = character("001001,010120,21201",15,list);
  w.add_other(1,s,2);
}

function draw() {
  background(0);
  if(v.collision(s)){
    v.get(0)[0].set_color(color(255,0,0));
  }else{
    v.get(0)[0].set_color(color(0,255,0));
  }
  t.move(mouseX,mouseY);
   if(mouseIsPressed && t.collision(s)){
     s.del_move(mouseX-pmouseX,mouseY-pmouseY);
     s.get(0)[0].set_color(color(255,255,0));
   }else{
     s.get(0)[0].set_color(color(255,255,255));
   }
  w.pos(forward,up);
  //w.del_pos(sin(ppp)*3,0);
  w.del_angle(0.1);
  w.draw();
  
  ppp++;
  if(ppp > width){
    ppp = 0;
  }
  p.draw();
  t.draw();
  controls();
}


