

function sprite_editor(list,colors,size){ // list should be liske [[1,1],[1,2]] which is a square matrix
  let p = new component();
  
  list.forEach((value,i1)=>{
    value.forEach((val,i2)=>{
      p.add(i2*size,i1*size,size,size,colors[val]);
    });
  });
  return p;
}


function world_editor(list,sprites,layer,size){ // list should be liske [[1,1],[1,2]] which is a square matrix
  let p = new world();
  
  list.forEach((value,i1)=>{
    value.forEach((val,i2)=>{
      let q = sprites[val].copy();
      q.move(i1*size,i2*size);
      p.add(q,layer);
    });
  });
  return p;
}
