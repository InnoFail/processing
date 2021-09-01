class graph2d{
 ArrayList<Point> p; 
 boolean axes,vertex=true,curve=false;
 int n_id;
 Dict pushed;
 
  
 graph2d(){
   this.p=new ArrayList<Point>();
   this.axes=true;
   this.n_id=0;
   this.pushed=new Dict();
 }
 
 graph2d coord(Point p){
   this.p.add(p);
   return this;
 }
 
 void draw_axes(Point origin){
   pushMatrix();
   if(this.axes==true){
    line(0,origin.y,width,origin.y);
    line(origin.x,0,origin.x,height);
   }
   popMatrix();
 }
 
 void draw_p(Point origin,color c){
   pushMatrix();
   translate(origin.x-width/2,origin.y-height/2);
   for(Point p1: this.p){
     set((int)p1.x,(int)p1.y,c);
   }
   popMatrix();
 }
 
 void draw_pi(Point origin){
   pushMatrix();
   translate(origin.x-width/2,origin.y-height/2);
   for(Point p1: this.p){
     point((int)p1.x,(int)p1.y);
   }
   popMatrix();
 }
 
 void draw_c(Point origin,boolean vertex){
   pushMatrix();
   translate(origin.x-width/2,origin.y-height/2);
   beginShape();
   if(vertex){
   for(Point p1: this.p){
     vertex(p1.x,p1.y);
   }
   }else if(p.size()!=0){
     curveVertex(p.get(0).x,p.get(0).y);
   for(Point p1: this.p){
     curveVertex(p1.x,p1.y);
   }
   curveVertex(p.get(p.size()-1).x,p.get(p.size()-1).y);
   }
   endShape();
   popMatrix();
 }
 
 Point p(float x,float y){
  return new Point(x+width/2,height/2-y); 
 }
 
 ArrayList<Point> p_array(Object o){
   ArrayList<Point> new_point=(ArrayList<Point>)o;
  return new_point; 
 }
 
 int push(){
   this.pushed.add(this.p,this.n_id);
   this.p=new ArrayList<Point>();
   return this.n_id++;
 }
 
 ArrayList<Point> get(int id){
   return this.pushed.get(id);
 }
  
  
  class Point{
    float x,y;
    Point(float x,float y){
     this.x=x;
     this.y=y;
    }  
  }
  
  class Dict{
    ArrayList<ArrayList<Point>> i; 
    ArrayList<Integer> id;
   Dict(){
     this.i=new ArrayList();
     this.id=new ArrayList();
   }
   
   void add(ArrayList<Point> i,int id){
     this.i.add(i);
     this.id.add(id);
   }
   
   ArrayList<Point> get(int id){
    return this.i.get(this.id.get(id)); 
   }
  }
  
}
