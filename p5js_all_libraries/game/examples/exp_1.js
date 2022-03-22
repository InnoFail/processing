

let c1,c2,c3;
let w;
let t;
let h;

function setup() {
  createCanvas(400, 400);
  frameRate(30);
  ele = new element(100);
  h = new help();
  c1 = sprite_editor([[0,0,0,0],[1,0,0,1],[0,0,0,0],[0,1,1,0]],[h.n_red,h.n_blue],50/4);
  c2 = new component();
  c2.add(0,0,50,50);
  c2.del_vel(1,1);
  c2.move(width/2,height/2);
  w = world_editor([[0,1,0],[1,1,1],[0,1,0]],[c1,c2],0,50);
  t = sprite_editor([[0,1,0],[1,1,1],[0,1,0]],[h.n_blue,h.n_yellow],5);
  
}

function draw() {
  background(220);
  w.move(-forward,-up);
  c2.move(-forward,-up);
  t.move(mouseX-t.center[0],mouseY-t.center[1]);
  w.draw();
  t.draw();
}
