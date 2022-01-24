class controls{
  float x,y,z,angle,ax,ay,az;
boolean zoom,rotate;
float del_touch_dist,prev_dist;
boolean is_touched;
float [][] prev,now;

controls(){
  this.x=this.y=this.z=this.angle=this.ax=this.ay=this.az=this.del_touch_dist=0;
  this.zoom=this.rotate=this.is_touched=false;
  this.now=new float[2][2];
  this.prev=new float[2][2];
}

 public void control(){
    if(this.zoom){
    //z+=mouseX-pmouseX;
    
   this.z+=this.del_touch_dist;
  }
  if(this.rotate){
    this.angle=map(mouseX-pmouseX,-5,5,-0.05,0.05);
    
  }
  if(mouseY<=height-300){
    this.zoom=true;
  }else{
    this.zoom=false;
  }
  if(mouseY>=height-300){
    this.rotate=true;
  }else{
    this.rotate=false;
  }
  if(mousePressed && !(this.rotate)){
  this.x+=mouseX-pmouseX;
  this.y+=mouseY-pmouseY;
  }
  }

  public void touchStarted(){
    if(touches.length==2){
    this.prev[0][0]=touches[0].x;
    this.prev[0][1]=touches[0].y;
    this.prev[1][0]=touches[1].x;
    this.prev[1][1]=touches[1].y;
    this.is_touched=true;
   }else{
     this.is_touched=false;
   }
  }
  
  public void touchMoved(){
    float l1,l2;
    l1=l2=0;
    if(touches.length==2){
    this.now[0][0]=touches[0].x;
    this.now[0][1]=touches[0].y;
    this.now[1][0]=touches[1].x;
    this.now[1][1]=touches[1].y;
    
    l1=sqrt(pow(this.prev[0][0]-this.prev[1][0],2)+pow(this.prev[0][1]-this.prev[1][1],2));
    l2=sqrt(pow(this.now[0][0]-this.now[1][0],2)+pow(this.now[0][1]-this.now[1][1],2));
    
    this.prev[0][0]=this.now[0][0];
    this.prev[0][1]=this.now[0][1];
    this.prev[1][0]=this.now[1][0];
    this.prev[1][1]=this.now[1][1];
    }
    this.del_touch_dist=-50*(l1-l2);
    
  }
  
  public void touchEnded(){
    this.prev[0][0]=this.prev[0][1]=this.prev[1][0]=this.prev[1][1]=this.now[0][0]=this.now[0][1]=this.now[1][0]=this.now[1][1]=0;
    this.del_touch_dist=0;
    this.is_touched=false;
  }
  
  

}