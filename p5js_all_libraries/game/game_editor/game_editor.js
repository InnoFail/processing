

function world_editor(json,tile){ //don't be confused , both are json files
  // tile format is like [[x,y,tile],[x,y,tile],...]
  this.json = json;
  this.tile = tile;
  this.keys = Object.keys(this.json);
  this.selected_sprite = 0;
  this.selected_text = [];
  this.selected_pos = [];
  this.editor_colors = [];
  this.editor_size = 10;
  this.max_size = 20;
  this.x_off = 0;
  this.y_off = 0;
  this.h = new help();
  this.u = new group(new ui().set_color(this.h.brick_pink).grid(10,10));
  
  this.download = new button("Download",this.u);
  this.download.button.ui.set_snap(5,8.5,5+this.download.button.ui.snaps[2],8.5+this.download.button.ui.snaps[3]);
  this.u.add_child(this.download.button);
  
  this.u.copy();
  this.u.copy();
  this.u.child(2).ui.set_snap(1,8.5,2,9).set_str("<");
  this.u.child(3).ui.set_snap(4,8.5,5,9).set_str(">");
  this.u.copy();
  this.u.copy();
  this.u.child(4).ui.set_snap(2.5,8,3.5,8.5).set_str("up");
  this.u.child(5).ui.set_snap(2.5,9,3.5,9.5).set_str("down");
  
  this.sprite_place = this.u.copy();
  this.sprite_place.ui.set_snap(8,0,10,2*this.keys.length).set_color(this.h.n_green);
  this.sprite_place.ui.grid(1,this.keys.length);
  for(let i=0; i<this.keys.length; i++){
    this.sprite_place.copy();
    let p = this.sprite_place.child(i).ui;
    p.set_snap(0,i,1,i+1).set_stroke_color(this.h.black).set_str(this.json[this.keys[i]].name).set_scroll(p.get_text_width()/2-p.width/2,p.lineh/2-p.height/2);
  }
  
  this.nav_bar = this.u.copy();
  this.nav_bar.ui.set_snap(8,8,10,10).set_color(this.h.grey_1);
  for(let i=0; i<8 ; i++){
    this.selected_text.push([]);
    for(let j=0; j<8 ; j++){
      this.nav_bar.copy();
      this.nav_bar.child(i*8+j).ui.set_snap(j,i,j+1,i+1).set_stroke_color(this.h.grey_3);
      this.selected_text[i].push(i*8+j);
    }
  }
  
  this.main_editor = this.u.copy();
  this.main_editor.ui.set_snap(0,0,8,8).set_color(this.h.white).grid(this.editor_size,this.editor_size);
  for(let i=0; i<this.max_size ; i++){
    this.selected_pos.push([]);
    for(let j=0; j<this.max_size ; j++){
      this.main_editor.copy();
      this.main_editor.child(i*this.max_size+j).ui.set_snap(j,i,j+1,i+1).set_stroke_color(this.h.grey_3);
      this.selected_pos[i].push(i*this.max_size+j);
    }
  }
  
  for(let i=0; i<this.keys.length; i++){
    this.editor_colors.push(this.h.colors[10+i]);
  }
  
  
  
  
  this.draw = function(){
    this.u.ui.draw();
    this.u.child(2).ui.draw();
    this.u.child(3).ui.draw();
    if(this.u.child(2).ui.clicked()){
      this.u.child(2).ui.set_stroke_color(this.h.black);
      this.y_off-=0.1;
    }else{
      this.u.child(2).ui.set_stroke_color(this.h.clear);
    }
    if(this.u.child(3).ui.clicked()){
      this.u.child(3).ui.set_stroke_color(this.h.black);
      this.y_off+=0.1;
    }else{
      this.u.child(3).ui.set_stroke_color(this.h.clear);
    }
    this.u.child(4).ui.draw();
    this.u.child(5).ui.draw();
    if(this.u.child(4).ui.clicked()){
      this.u.child(4).ui.set_stroke_color(this.h.black);
      this.x_off-=0.1;
    }else{
      this.u.child(4).ui.set_stroke_color(this.h.clear);
    }
    if(this.u.child(5).ui.clicked()){
      this.u.child(5).ui.set_stroke_color(this.h.black);
      this.x_off+=0.1;
    }else{
      this.u.child(5).ui.set_stroke_color(this.h.clear);
    }
    this.download.draw();
    if(this.download.button.child(0).ui.clicked()){
      this.download.shadow(0,0,0,0,this.h.grey_1);
      createStringDict(this.tile).saveJSON("world.json");
    }else{
    this.download.shadow(2,2,2,2,this.h.grey_1);
    }
    
    this.world_sprite();
      this.main_editor.ui.draw();
      for(let i=0; i<this.editor_size ; i++){
        for(let j=0; j<this.editor_size ; j++){
          this.main_editor.child(this.selected_pos[i][j]).ui.draw();
          if(this.main_editor.child(this.selected_pos[i][j]).ui.clicked()){
            let not_ = false;
            for(let k=0 ; k<this.tile.str.length; k++){
              if( i == this.tile.str[k][0] && j == this.tile.str[k][1]){
                this.tile.str[k][2] = this.selected_sprite;
                not_ = true;
              }
            }
            if(!not_){
          this.tile.str.push([]);
            this.tile.str[this.tile.str.length-1][0] = i;
            this.tile.str[this.tile.str.length-1][1] = j;
          this.tile.str[this.tile.str.length-1][2] = this.selected_sprite;
            }
          }
        }
      }
    
    this.sprite_place.ui.draw();
    for(let i=0; i<this.sprite_place.childs.length; i++){
      this.sprite_place.child(i).ui.draw();
      if(this.sprite_place.child(i).ui.clicked()){
        this.selected_sprite = i;
        this.sprite_place.ui.del_snap_px(0,-this.h.dely(),0,-this.h.dely());
      }
      
    }
    
    this.draw_sprite(this.nav_bar,this.selected_sprite);
    this.nav_bar.ui.draw();
    for(let i=0 ; i<this.json[this.keys[this.selected_sprite]].size ; i++){
      for(let j=0 ; j<this.json[this.keys[this.selected_sprite]].size ; j++){
        this.nav_bar.child(this.selected_text[i][j]).ui.draw();
      }
    }
  }
  
  
  
  this.draw_sprite = function(u,selected){
    let obj = this.json[this.keys[selected]];
    if(this.obj > 8){
      console.log("Error:sprite size is larger than 10.");
      return;
    }
     u.ui.grid(obj.size,obj.size);
    for(let i=0 ; i<obj.size ; i++){
      for(let j=0 ; j<obj.size ; j++){
        u.child(this.selected_text[i][j]).ui.set_color(this.h.colors[obj.str[i][j]]);
      }
    }
  }
  
  this.world_sprite = function(){
    let obj = this.tile.str;
    let that = this;
    if(this.editor_size+this.x_off > this.max_size || this.x_off < 0 || this.editor_size+this.y_off > this.max_size || this.y_off < 0){
      this.x_off = 0;
      this.y_off = 0;
      console.log("Error:sprite size is larger than 10.");
      return;
    }
    for(let i=0; i<this.max_size ; i++){
    for(let j=0; j<this.max_size ; j++){
      this.main_editor.child(i*this.max_size+j).ui.set_stroke_color(this.h.grey_3).set_color(this.h.white);
    }
  }
    this.main_editor.ui.grid(this.editor_size,this.editor_size);
    obj.forEach((val,i)=>{
      that.main_editor.child(that.selected_pos[val[0]+parseInt(this.x_off)][val[1]+parseInt(this.y_off)]).ui.set_color(that.editor_colors[val[2]]);
    });
    
  }
  
  
}

function sprite_editor(json){
  this.json = json;
  this.keys = Object.keys(this.json);
  this.selected_sprite = 0;
  this.selected_color = 0;
  this.selected_text = [];
  this.h = new help();
  this.u = new group(new ui().set_color(this.h.brick_pink).grid(10,10));
  this.main_editor = this.u.copy();
  this.main_editor.ui.set_snap(2,2,8,8).set_color(this.h.grey_1);
  for(let i=0; i<8 ; i++){
    this.selected_text.push([]);
    for(let j=0; j<8 ; j++){
      this.main_editor.copy();
      this.main_editor.child(i*8+j).ui.set_snap(j,i,j+1,i+1).set_stroke_color(this.h.grey_3);
      this.selected_text[i].push(i*8+j);
    }
  }
  this.color_bar = this.u.copy();
  this.color_bar.ui.set_color(this.h.l(this.h.n_red,this.h.n_green));
  this.color_bar.ui.set_snap(0,2,2,8).set_color(this.h.white).grid(2,17);
  let k = 0;
  for(let i=0; i<2; i++){
    for(let j=0; j<17; j++){
      this.color_bar.copy();
      this.color_bar.child(k).ui.set_snap(i,j,i+1,j+1).set_color(this.h.colors[k]);
      k++;
    }
  }
  this.color_bar.child(0).ui.set_str("clear").set_stroke_color(this.h.black);
  this.sprite_place = this.u.copy();
  this.sprite_place.ui.set_snap(8,2,10,2*this.keys.length+2).set_color(this.h.n_green);
  this.sprite_place.ui.grid(1,this.keys.length);
  for(let i=0; i<this.keys.length; i++){
    this.sprite_place.copy();
    let p = this.sprite_place.child(i).ui;
    p.set_snap(0,i,1,i+1).set_stroke_color(this.h.black).set_str(this.json[this.keys[i]].name).set_scroll(p.get_text_width()/2-p.width/2,p.lineh/2-p.height/2);
  }
  
  this.nav_bar = this.u.copy();
  this.nav_bar.ui.set_snap(0,0,10,2).grid(4,3).set_color(this.h.brick_blue);
  this.nav_bar.copy();
  this.nav_bar.copy();
  this.nav_bar.copy();
  this.nav_bar_button = new button("Download",this.nav_bar);
  this.nav_bar.add_child(this.nav_bar_button.button);
  this.nav_bar.child(0).ui.set_snap(0.1,0,3,0.6).set_stroke_color(this.h.grey_4);
  this.nav_bar.child(1).ui.set_snap(0.1,0.6,3,1.2).set_stroke_color(this.h.grey_4);
  this.nav_bar.child(2).ui.set_snap(0.1,1.2,3,3).set_stroke_color(this.h.grey_4);
  this.nav_bar_button.button.ui.set_snap(3,1,4,2);
  
  
  
  this.draw = function(){
    this.u.ui.draw();
    
    this.sprite_place.ui.draw();
    for(let i=0; i<this.sprite_place.childs.length; i++){
      this.sprite_place.child(i).ui.draw();
      if(this.sprite_place.child(i).ui.clicked()){
        this.selected_sprite = i;
        this.sprite_place.ui.del_snap_px(0,-this.h.dely(),0,-this.h.dely());
      }
    }
    
    this.nav_bar.ui.draw();
    this.nav_bar.child(2).ui.set_str(this.json[this.keys[this.selected_sprite]].str.join("\n")).draw();
    if(this.nav_bar.child(2).ui.clicked()){
      let pp = this.nav_bar.child(2).ui;
      pp.set_scroll(pp.scrollx,pp.scrolly+this.h.dely());
    }
    
         this.nav_bar.child(0).ui.set_str(this.json[this.keys[this.selected_sprite]].name).draw();
    this.nav_bar.child(1).ui.set_str(this.json[this.keys[this.selected_sprite]].size).draw();
    this.nav_bar_button.draw();
    if(this.nav_bar_button.button.child(0).ui.clicked()){
      this.nav_bar_button.shadow(0,0,0,0,this.h.grey_1);
      createStringDict(this.json).saveJSON("sprites.json");
    }else{
    this.nav_bar_button.shadow(2,2,2,2,this.h.grey_1);
    }
    
    this.draw_sprite();
    this.main_editor.ui.draw();
    for(let i=0 ; i<this.json[this.keys[this.selected_sprite]].size ; i++){
      for(let j=0 ; j<this.json[this.keys[this.selected_sprite]].size ; j++){
        this.main_editor.child(this.selected_text[i][j]).ui.draw();
        if(this.main_editor.child(this.selected_text[i][j]).ui.clicked()){
          this.json[this.keys[this.selected_sprite]].str[i][j] = this.selected_color;
        }
      }
    }
    this.color_bar.ui.draw();
    for(let i=0 ; i<this.color_bar.childs.length; i++){
      this.color_bar.child(i).ui.draw();
      if(this.color_bar.child(i).ui.clicked()){
        this.selected_color = i;
      }
    }
    
    
  }
  
  
  this.draw_sprite = function(){
    let obj = this.json[this.keys[this.selected_sprite]];
    if(this.obj > 8){
      console.log("Error:sprite size is larger than 10.");
      return;
    }
     this.main_editor.ui.grid(obj.size,obj.size);
    for(let i=0 ; i<obj.size ; i++){
      for(let j=0 ; j<obj.size ; j++){
        this.main_editor.child(this.selected_text[i][j]).ui.set_color(this.h.colors[obj.str[i][j]]);
      }
    }
  }
  
  
}
