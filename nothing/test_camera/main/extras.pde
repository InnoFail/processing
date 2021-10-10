class edit{
 String edit_text;
 int x,y,bound_x,bound_y;
 
 edit(){
  this.edit_text=new String(); 
  this.x=this.y=30;
  this.bound_x=width;
  this.bound_y=height;
 }
 
 void text(){
    if(keycl){
   if(spkeycl.equals("b") && this.edit_text.length()!=0){
     this.edit_text=this.edit_text.substring(0,this.edit_text.length()-1);
   }else if(spkeycl.equals("e") && this.edit_text.length()!=0){
     this.edit_text=this.edit_text+"`";
   }
   else{
    this.edit_text=this.edit_text+keyclp;
   }
  }
    edit(this.edit_text,this.x,this.y,this.bound_x,this.bound_y);
 }
  
}


void camera_p(){
  
 if(keyisp==true){
    if(mouseisp==false){
   switch(keyp){
    case "a":
    fore++;
    break;
    case "d":
    fore--;
    break;
    case "w":
    side++;
    break;
    case "s":
    side--;
    break;
    case "j":
    up--;
    break;
    case "k":
    up++;
    break;
   }
  }else{
   switch(keyp){
    case "w":
    alpha+=0.001;
    break;
    case "s":
    alpha-=0.001;
    break;
    case "a":
    beta-=0.001;
    break;
    case "d":
    beta+=0.001;
    break;
    case "j":
    gamma-=0.001;
    break;
    case "k":
    gamma+=0.001;
    break;
   }
  }
  }
  
  
 mediate.apply(mediate.n(fore,side,up));
 mediate.apply(mediate.rotx(alpha).roty(beta).rotz(gamma));
 eye.apply(eye.add(mediate));
 st_med.apply(st_med.rotx(alpha).roty(beta).rotz(gamma));
 to_view=eye.add(st_med.normalize().scalar_mul(10));
 println(alpha," ",beta," ",gamma);
 fore=side=up=0;
 st_med=new vector(0,1,0);
     //pushMatrix();
     //fill(0,255,0);
     //translate(100+eye.x,100+eye.y,100+eye.z);
     //box(10);
     //popMatrix();
     //pushMatrix();
     //fill(0,0,255);
     //translate(100+to_view.x,100+to_view.y,100+to_view.z);
     //box(10);
     //popMatrix();
 camera(eye.x, eye.y, eye.z, to_view.x,  to_view.y, to_view.z,0.0, 1.0, 0.0);
}



class list<T>{
  T[] l;
  int index,max;
  
  list(){
    this.max=10;
    this.l=(T[])new Object[this.max];
    this.index=0;
  }
  
  void add(T t ){
    this.l[this.index]=t;
    this.index++;
    if(this.index==this.max){
      this.max+=5;
      T[] p=(T[])new Object[this.max];
      for(int i=0;i<this.l.length;i++){
        p[i]=this.l[i];
      }
      this.l=p;
    }
  }
  
  void exchange(int i1,int i2){
    T s=this.l[i1];
    this.l[i1]=this.l[i2];
    this.l[i2]=s;
  }
  
  T get(int i){
    if(i>=this.max){
      return null;
    }
    return this.l[i];
  }
  
  void replace(int index,T s){
    if(!(index>=this.max)){
         this.l[index]=s;
    }
  }
  
  int size(){
    return this.index;
  }
  
  
}
