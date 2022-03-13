let u,v,s,t,w;
let n=10,m = 10;
let h;
let u_str = ";You ;can ;say ;so ;as.";


function setup(){
   createCanvas(400,300);
  //font = loadFont("Roboto.ttf");
  h = new help();
  u = new group(new ui().set_color(h.n_red));
  u.ui.grid(50,50);
  v = new slider(0,100,false,u);
  v.slider.ui.set_snap(0,46,50,50);
  u.copy();
  u.child(1).ui.set_snap(0,40,5,46).set_color(h.n_yellow);
  s = new button("Button",u);
  s.button.ui.set_snap(2,2,s.button.ui.snaps[2]+2,s.button.ui.snaps[3]+2);
  
  
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello1");
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello2");
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello3");
  t = new list(2,[u.child(3),u.child(4),u.child(5)],u);
  t.list.ui.set_snap(10,10,10,10);
  t.change(1,true);
}


function draw(){
  //textFont(font);
  if(s.button.ui.clicked()){ 
    s.shadow(0,0,0,0,h.grey);
    t.change(1,false);
  }else{
    s.shadow(3,3,3,3,h.grey);
    t.change(1,true);
  }
  u.child(1).ui.set_str(v.get_value()).set_scroll(-8,-8);
  u.ui.draw();
  v.draw();
  u.child(1).ui.draw();
  s.draw();
  t.draw();
}


