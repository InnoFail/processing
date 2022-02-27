function group(u){
  this.ui = u;
  this.childs = [];
  
  this.copy = function(){
    let p = new group(this.ui.copy());
    this.childs.push(p);
    return p;
  }
  this.child = function(index){
    return this.childs[index];
  }
}
