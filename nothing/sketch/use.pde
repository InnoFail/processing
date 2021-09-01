class use{
  private float x,y,z,x_angle,y_angle,z_angle;
  private boolean zoom,rotate;
  
  use(){
    this.x=this.y=this.z=this.x_angle=this.y_angle=this.z_angle=0;
    this.zoom=this.rotate=false;
  }
  
  public void update(){
    if(mouseY>=300 && mousePressed){
     if(mouseY>=350){
       this.rotate=true;
       this.zoom=false;
     }else{
      this.rotate=false;
      this.zoom=true;
     }
    }else if(mouseY<50 && mousePressed){
      this.rotate=false;
      this.zoom=false;
    }
    if(mousePressed && !zoom && !rotate){
    this.x+=mouseX-pmouseX;
    this.y+=mouseY-pmouseY; 
    }
    else if(this.zoom){
      if(mouseY>=300 && mouseY<=350 && mousePressed){
       this.z+=mouseX-pmouseX;
      }
    for(int i=0;i<=300;i++){
      for(int j=300;j<=350;j++){
       set(i,j,color(0,125,0));
      }
    }
   }
   else if(this.rotate){
      if(mouseY>=350 && mouseY<=400 && mousePressed){
       this.x_angle+=map(mouseX-pmouseX,-5,5,-0.5,0.5);
      }
      if(mouseX>=0 && mouseX<=50 && mousePressed){
       this.y_angle+=map(mouseY-pmouseY,-5,5,-0.5,0.5); 
      }

      for(int i=0;i<=50;i++){
      for(int j=0;j<=400;j++){
       set(i,j,color(0,0,125));
      }
    }
      for(int i=0;i<=300;i++){
      for(int j=350;j<=400;j++){
       set(i,j,color(0,0,125));
      }
    }
   }
    
  }
  
  public void draw(){

   pushMatrix();
   camera(0,0,400,0,0,0,0,1,0);
/*   translate(x,y,z);
   rotateX(x_angle);
   rotateY(y_angle);
   rotateZ(z_angle);*/
   fill(255);
   rect(-700,-900,700,900);
   translate(-350,-450);
   sphere(40);
   popMatrix();
   
  if(!this.zoom && !this.rotate){
    for(int i=0;i<=300;i++){
      for(int j=0;j<=50;j++){
       set(0+i,0+j,color(255,0,0));
      }
    }
    for(int i=0;i<=300;i++){
      for(int j=300;j<=350;j++){
       set(i,j,color(0,255,0));
      }
    }
    for(int i=0;i<=300;i++){
      for(int j=350;j<=400;j++){
       set(i,j,color(0,0,255));
      }
    }
    }
  }

  
  
}
