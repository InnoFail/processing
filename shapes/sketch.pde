
//local variable
float n=9;
generate g;
controls c;
ui u;
helper help;

void setup(){
  size(900,1200,P3D);
  noStroke();
  
  help=new helper();
  u=new ui(help.vert,0,height-300,width,300);
  u.ui_c(help.w);
  u.add_in_(1,help.hor);
  u.add_in_(1,help.hor);
  u.add_in_(1,help.hor);
  u.c(0).ui_c(help.r);
  u.c(1).ui_c(help.g);
  u.c(2).ui_c(help.b);
  g=new generate();
  c=new controls();
}

void draw(){
  background(0);
  world();
  c.control();
  
  }
  
  void world(){

  float [][] p1=g.cs_vertex(n,100,0);
  float [][] p2=g.cs_vertex(n,300,300);
  float [][] p3=g.cs_vertex(n,100,600);
  float [][] p=g.lateral_vertex(p1,p2);
  float [][] q=g.lateral_vertex(p2,p3);
    
  
  ui[] to={u,u.c(0),u.c(1),u.c(2)};
  help.update(to);
  
  pushMatrix();
  translate(c.x,c.y,c.z);
  if(mousePressed){
  if(mouseY>=u.c(2).yPos && mouseY<=(u.c(2).yPos+u.c(2).w)){
    c.ax+=c.angle;
  }
  else if(mouseY>=u.c(1).yPos && mouseY<u.c(2).yPos){
    c.ay+=c.angle;
  }
  else if(mouseY>=u.c(0).yPos && mouseY<u.c(1).yPos){
    c.az+=c.angle;
  }
  }
  rotateX(c.ax);
  rotateY(c.ay);
  rotateZ(c.az);
  stroke(0);
 strokeWeight(2);
 // generate_draw(p,p1,p2,255,125,125);
  //generate_draw(q,p2,p3,255,125,125);
  g.draw_cs_hole(g.cs_vertex(n,300,0),g.cs_vertex(n,100,0),255);
  g.draw_lateral(g.lateral_vertex(p1,p2),255);
  //g.draw_cs_circum(p1,125);
  popMatrix();
  }
  

  
  /*
  
  float[][] generate(float n,float r,float z2){
    float p=6.28/n;
    float[][] a=new float[(int)n][3];
    for(int i=1;i<=n;i++){
      a[i-1][0]=r*cos((float)i*p);
      a[i-1][1]=r*sin((float)i*p);
      a[i-1][2]=z2;
    }
    return a;
  }
  
  float[][] generate_final(float[][] p1,float [][] p2){
    
    float [][] p=new float[(int)(2*n+2)][3];
    for(int i=0;i<n;i++){
      p[2*i]=p1[i];
      p[2*i+1]=p2[i];
    }
    p[2*(int)n+0]=p1[0];
    p[2*(int)n+1]=p2[0];
    return p;
  }
  
  void generate_draw(float [][] p,float [][] p1,float [][] p2,color a,color b,color c){
  fill(a);
  beginShape(TRIANGLE_STRIP);
  for(int i=0;i<2*n+2;i++){
      vertex(p[i][0],p[i][1],p[i][2]);
  }
  endShape();
  
  fill(b);
  beginShape();
  for(int i=0;i<n;i++){
      vertex(p1[i][0],p1[i][1],p1[i][2]);
  }
  endShape(CLOSE);
  fill(c);
  beginShape();
  for(int i=0;i<n;i++){
      vertex(p2[i][0],p2[i][1],p2[i][2]);
  }
  endShape(CLOSE);
  }*/
  
  void touchStarted(){
    c.touchStarted();
  }
  
  void touchMoved(){
    c.touchMoved();
  }
  
  void touchEnded(){
    c.touchEnded();
  }
  
  