let forward,up,still,forward_s,up_s,still_s;
    forward=up=still=forward_s=up_s=still_s=0;


function controls(){
  if(keyIsPressed){
  if(key == "a"){
    forward++;
  }else if(key == "d"){
    forward--;
  }
  if(key == "w"){
    up++;
  }else if(key == "s"){
    up--;
  }
  if(key == "j"){
    still++;
  }else if(key == "l"){
    still--;
  }
  if(key == "A"){
    forward_s++;
  }else if(key == "D"){
    forward_s--;
  }
  if(key == "W"){
    up_s++;
  }else if(key == "S"){
    up_s--;
  }
  if(key == "J"){
    still_s++;
  }else if(key == "L"){
    still_s--;
  }
  }
}

function character(str,size,colors_in_list){
  let trimmed = str.trim();
  let lists = trimmed.split(",");
  let comp = new component();
  lists.forEach(function(value,index){
    lists[index] = value.trim();
  });
  let y_val = lists.length;
  let k = 0;
  let max_x = 0;
  lists.forEach(function(value,index){
    let x_val = value.length;
    max_x = max_x < x_val ? x_val : max_x;
    for(let i=0 ; i< x_val ; i++){
      if(value[i] != " "){
      comp.add(k,new draw_rect());
      comp.get(k)[0].size(size,size);
      comp.pos(k,i*size,index*size);
      comp.get(k)[0].set_color(colors_in_list[parseInt(value[i])]);
      
      k++;
      }
    }
  });
  
  let midy = y_val*size/2;
  let midx = max_x*size/2;
  
  comp.move(-midx,-midy);
  return comp;
  
}


function level_editor(str_list,sprite_size,list_of_components){
  let k = 0;
  let comp = new world();
  str_list.forEach(function(stri,index1){
  let trimmed = stri.trim();
  let lists = trimmed.split(",");
  lists.forEach(function(value,index){
    lists[index] = value.trim();
  });
  let y_val = lists.length;
  let max_x = 0;
  lists.forEach(function(value,index){
    let x_val = value.length;
    max_x = max_x < x_val ? x_val : max_x;
    for(let i=0 ; i< x_val ; i++){
      if(value[i] != " "){
        let p = list_of_components[parseInt(value[i])].copy();
        p.move(i*sprite_size,index*sprite_size);
        comp.add_other(k,p,index1);
        k++;
      }
    }
  });
    
  });
  
  return comp;
}






