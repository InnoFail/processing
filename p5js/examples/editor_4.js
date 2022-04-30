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
  for(let i=0; i<n*m; i++){
    u.copy();
    let q = u.child(i).ui;
    q.set_color(h.white);//.set_stroke_color(h.black);
  }
  
  v = u.copy();
  v.ui.set_snap(20,45,40,50).set_color(h.n_yellow).set_str("Click to remove highlight").set_font_size(12).set_scroll(-v.ui.width/2+v.ui.get_text_width()/2,-v.ui.height/2+v.ui.lineh/2);
}


function draw(){
  //textFont(font);
  if(keyIsPressed){
    let keys = h.get_key();
    if(keys == "Shift"){
      
    }else if(keys == "CapsLock"){
      
    }else if(keys == "Backspace"){
      u_str = u_str.substring(0,u_str.length-1);
    }else{
      u_str += keys;
    }
    if(keys == " "){
      u_str += ";";
    }
  }
  for(let i=0; i<n*m; i++){
   let q = u.child(i).ui;
   
    if(q.hovered()){
      if(q.color != h.n_green){
     q.set_color(h.n_yellow);
      }
      if(q.clicked()){
     q.set_color(h.n_green);
   }
   }else if(q.color != h.n_green){
     q.set_color(h.white);
   }
  }
  if(v.ui.clicked()){
    for(let i=0; i<n*m; i++){
    let q = u.child(i).ui;
    q.set_color(h.white);
  }
  }
  u.ui.draw();
  v.ui.draw();
  let temp_s = 0,count = 0;
  let p = u_str.split(";");
  for(let i=0; i<n*m; i++){
    let q = u.child(i).ui;
    let pi = p[i] !== undefined ? p[i] : "an ";
    q.set_str(pi);
    let ss = pi === undefined ? 0:q.get_text_width();
    let ss1 = pi === undefined ? 0 :  q.lineh;
    q.set_snap_px(temp_s,ss1*count,temp_s+ss,ss1*count+ss1).draw();
    temp_s += ss;
    
    if(i!=0 && i-parseInt(i/n)*n==0){
      temp_s = 0;
      count ++ ;
    }
  }
}


