int box_num=2;

void setup(){
 size(300,400,P3D);
 camera_setup();
}

void draw(){
  background(0);
  //for(int i=-box_num;i<box_num;i++){
  //  for(int j=-box_num;j<box_num;j++){
  //    for(int k=-box_num;k<box_num;k++){
  //      pushMatrix();
  //  translate(i*100,j*100,k*100);
  //  fill(255);
  //  box(10);
  //  popMatrix();
  //}}}
  camera_p();
}
