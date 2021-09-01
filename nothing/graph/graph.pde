
curve c;
int p;

void setup(){
  size(300,400);
  stroke(255);
  noFill();
  c=new curve();
  c.g.p=c.g.p_array(c.get_y(-100,100,2,100));
  c.g.axes=true;
}

void draw(){
  background(0);
  c.g.draw_axes(c.g.p(0,0));
  c.g.draw_c(c.g.p(0,0),false);
  //rect(0,0,width,height);
}

class curve{
  graph2d g;
  
  curve(){
    this.g=new graph2d();
  }
  
  Object get_y(int x1,int x2,int power,int width_mul){
    for(int i=x1;i<=x2;i++){
     g.coord(g.p(i,pow(i,power)/width_mul)); 
    }
    int i=g.push();
    return g.get(i);
  }
  
  
}
