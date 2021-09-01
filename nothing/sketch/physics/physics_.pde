
class play{
  
  float gravity,accn,velocity,time;
  float x,y;
  boolean stop=false;
  
  play(float x,float y){
    this.x=x;
    this.y=y;
    this.gravity=1;
    this.accn=0;
    this.velocity=0;
    this.time=0;
  }
  
 void update(){
   if(!this.stop){
   this.x+=this.accn*this.time*this.time;
   this.y+=this.gravity*this.time*this.time;
   this.time+=0.1;
 }
 }
 
 void stop(){
  this.stop=true; 
 }
 
 void start(){
  this.stop=false; 
 }
 
 
 boolean collision(list<Float> x,list<Float> y,float c_x,float c_y,float x_check,float y_check){
   if(x.size()==y.size()){
     for(int i=0;i<x.size()-1;i++){
      float p1=x.get(i)-x.get(i+1);
      float p2=y.get(i)-y.get(i+1);
      float p3=x.get(i)-c_x; 
      float p4=y.get(i)-c_y; 
      float p5=x.get(i)-x_check; 
      float p6=y.get(i)-y_check; 
      float a1=p1*p4-p2*p3;
      float a2=p1*p6-p2*p5;
      if(!((a1>0 && a2>0) || (a1<0 && a2<0))){
        return false;
      }
     }
     return true;
   }
   return false;
 }
 
 
  
}
