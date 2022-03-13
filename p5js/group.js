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
  this.child = function(index){
    return this.childs[index];
  }
  
}
