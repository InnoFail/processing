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
