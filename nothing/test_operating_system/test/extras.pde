import java.util.Iterator;

class edit{
 String edit_text;
 int x,y,bound_x,bound_y,pos;
 String cursor_ = "\u2195";
 int extra;
 color c;
 
 edit(){
  this.edit_text=new String(); 
  this.x=this.y=30;
  this.bound_x=width;
  this.bound_y=height;
  this.pos = this.edit_text.length();
  this.extra = 0;
  this.c = color(0,0,0);
 }
 
 void text_(){
   
    if(keycl){
   if(spkeycl.equals("backspace") && this.edit_text.length()!=0){
     this.edit_text = this.edit_text.substring(0,this.pos+this.extra-1)+this.edit_text.substring(this.pos+this.extra,this.edit_text.length());
     this.pos -= 1;
   }else if(spkeycl.equals("enter") && this.edit_text.length()!=0){
     this.edit_text = this.edit_text.substring(0,this.pos+this.extra)+"\n"+this.edit_text.substring(this.pos+this.extra,this.edit_text.length());
    
     this.pos += 1;
   }else if(spkeycl.equals("left")){
     this.pos -= 1;
   }else if(spkeycl.equals("right")){
     this.pos += 1;
   }else if(spkeycl.equals("up")){
     int k=0 ; 
     for(int i=this.pos+this.extra-1; i>=0 ; i--){
       k++;
       if( this.edit_text.charAt(i) == '\n'){
         break;
       }
     }
     this.pos -= k;
   }else if(spkeycl.equals("down")){
     int k=0 ; 
     for(int i=this.pos+this.extra-1<0?0:this.pos+this.extra-1; i<this.edit_text.length() ; i++){
       k++;
       if( this.edit_text.charAt(i) == '\n'){
         break;
       }
     }
     this.pos += k;
   }
   else{
    this.edit_text = this.edit_text.substring(0,this.pos+this.extra)+keyclp+this.edit_text.substring(this.pos+this.extra,this.edit_text.length());
    this.pos += 1;
   }
  }
  if(this.pos+this.extra < 0){
   this.pos = -this.extra; 
  }else if(this.pos+this.extra  > this.edit_text.length()){
    this.pos = this.edit_text.length()-this.extra;
  }
  String temp = this.edit_text.substring(0,this.pos+this.extra)+cursor_+this.edit_text.substring(this.pos+this.extra,this.edit_text.length());
     push();
     fill(c);
     text(temp,this.x,this.y,this.bound_x,this.bound_y);
     pop();
 }
  
}



  



class list<T> implements Iterable<T>{
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
  
  int bi_search(T element,int st_i,int end_i){
    int a,b,f,mid;
    mid=f=0;
    a=st_i;
    b=end_i;
    if(l[st_i].toString().equals(element.toString())){
      return st_i;
    }
    if(a>=b){
      return 0;
    }
    mid =(a+b)/2;
    a=bi_search(element,a,mid);
    b=bi_search(element,mid+1,b);
    f=a+b;
    return f;
  }

  
  int size(){
    return this.index;
  }
  
  public Iterator<T> iterator(){
    final list<T> that = this;
    Iterator<T> t = new Iterator<T>(){
      public int curr_val = -1;
      public boolean hasNext(){
        this.curr_val++;
        if(curr_val < that.index){
         return true; 
        }
        return false;
      }
      public T next(){
        return that.get(this.curr_val);
      }
      public void remove(){
        throw new UnsupportedOperationException();
      }
    };
    return t;
  }
  
  
}
