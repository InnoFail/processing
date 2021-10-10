int box_num=2;
float fore,side,up;
float alpha,beta,gamma;
vector eye,to_view,mediate,st_med;

void setup(){
 size(300,400,P3D);
 fore=side=up=0;
 alpha=beta=gamma=0;
 eye=new vector(0,0,0);
 to_view=new vector(0,0,0);
 mediate=new vector(0,0,0);
 st_med=new vector(0,1,0);
}

void draw(){
  background(0);
 for(int i=-box_num;i<=box_num;i++){
  for(int j=-box_num;j<=box_num;j++){
   for(int k=-box_num;k<=box_num;k++){
     pushMatrix();
     fill(255,0,0);
     translate(100*i,100*j,100*k);
     box(10);
     popMatrix();
   }
  }
 }
 camera_p();
}
