class generate{
  
  generate(){
    
  }
  
  
  public float[][] cs_vertex(float num,float r,float z){
    float p=6.28/num;
    float[][] a=new float[(int)num][3];
    for(int i=1;i<=num;i++){
      a[i-1][0]=r*cos((float)i*p);
      a[i-1][1]=r*sin((float)i*p);
      a[i-1][2]=z;
    }
    return a;
  }
  
  public float[][] lateral_vertex(float[][] p1,float [][] p2){
    
    float [][] p=new float[(int)(2*n+2)][3];
    for(int i=0;i<n;i++){
      p[2*i]=p1[i];
      p[2*i+1]=p2[i];
    }
    p[2*(int)n+0]=p1[0];
    p[2*(int)n+1]=p2[0];
    return p;
  }
  
  
  public void draw_cs_circum(float [][] p,color c1){
    stroke(c1);
    int num=p.length;
    for(int i=0;i<num-1;i++){
      line(p[i][0],p[i][1],p[i][2],p[i+1][0],p[i+1][1],p[i+1][2]);
    }
    line(p[0][0],p[0][1],p[0][2],p[(int)num-1][0],p[(int)num-1][1],p[(int)num-1][2]);
  }
  
  public void draw_cs(float [][] p,color c1){
     int num=p.length;
  fill(c1);
  beginShape();
  for(int i=0;i<num;i++){
      vertex(p[i][0],p[i][1],p[i][2]);
  }
  endShape(CLOSE);
  }
  
  public void draw_cs_hole(float [][] p1,float [][] p2,color c1){
     int num1=p1.length;
      int num2=p2.length;
      if(num1==num2){
        int num=num1;
    fill(c1);
  beginShape();
  for(int i=0;i<num;i++){
      vertex(p1[i][0],p1[i][1],p1[i][2]);
  }
  beginContour();
  for(int i=num-1;i>=0;i--){
      vertex(p2[i][0],p2[i][1],p2[i][2]);
  }
  endContour();
  endShape(CLOSE);
  }
  }
  
  public void draw_lateral(float [][] p,color c1){
     int num=p.length/2-1;
    fill(c1);
  beginShape(TRIANGLE_STRIP);
  for(int i=0;i<2*num+2;i++){
      vertex(p[i][0],p[i][1],p[i][2]);
  }
  endShape();
  }
  
}