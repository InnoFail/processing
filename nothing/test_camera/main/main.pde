int box_num=2;
list<Integer> l;
int ppp=0;

void setup(){
 size(300,400,P3D);
 camera_setup();
 l=new list();
 for(int i=0;i<51;i++){
 l.add(new Integer(i));
 }
 
  int ll=l.bi_search(new Integer(49),0,l.size()-1);
  print(ll);
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
  //camera_p();
}
