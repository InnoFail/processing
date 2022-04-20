function group(u){
  this.parent = null;
  this.ui = u;
  this.childs = [];
  
  this.copy = function(){
    let p = new group(this.ui.copy());
    p.parent = this;
    this.childs.push(p);
    return p;
  }
  
  this.add_child = function(ch){
    ch.parent = this;
    ch.ui.p = this.ui;
    this.childs.push(ch);
    return this;
  }
  
  
  this.remove_child = function(index){
    this.child(index).parent = null;
    let p = this.child(index);
    this.childs.splice(index,1);
    return p;
  }
  
  this.child = function(index){
    return this.childs[index];
  }
  
}
