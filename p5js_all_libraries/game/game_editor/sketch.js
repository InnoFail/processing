let sp_edit,tile_edit;
let json,tile;
let toggle_button,toggled = true;

function preload(){
  json = loadJSON("./sprites.json");
  tile = loadJSON("./tile.json");
}

function setup() {
  createCanvas(400, 400);
  sp_edit = new sprite_editor(json);
  tile_edit = new world_editor(json,tile);
  toggle_button = new group(new ui());
  toggle_button.ui.setup([30,height-20,90,height]);
  toggle_button.copy();
  toggle_button.copy();
  toggle_button.child(0).ui.set_snap(0,0,0.5,1).set_str("tile").set_scroll(-8,-8);
  toggle_button.child(1).ui.set_snap(0.5,0,1,1).set_str("world").set_scroll(-8,-8);
}

function draw() {
  if(toggle_button.child(0).ui.clicked()){
    toggled = false;
  }
  if(toggle_button.child(1).ui.clicked()){
    toggled = true;
  }
  if(toggled){
    tile_edit.draw();
    toggle_button.child(0).ui.set_color(color(0,255,255)).set_stroke_color(color(0,0));
    toggle_button.child(1).ui.set_color(color(255,255,0)).set_stroke_color(color(0));
  }else{
    sp_edit.draw();
    toggle_button.child(1).ui.set_color(color(0,255,255)).set_stroke_color(color(0,0));
    toggle_button.child(0).ui.set_color(color(255,255,0)).set_stroke_color(color(0));
  }
  toggle_button.ui.draw();
  toggle_button.child(0).ui.draw();
  toggle_button.child(1).ui.draw();
}
