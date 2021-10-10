class vector{
 float x,y,z;
 
 vector(float x,float y,float z){
   this.x=x;
   this.y=y;
   this.z=z;
 }
 
 vector add(vector v){
  return new vector(this.x+v.x,this.y+v.y,this.z+v.z); 
 }
 
 vector sub(vector v){
   return new vector(this.x-v.x,this.y-v.y,this.z-v.z); 
 }
 
 vector scalar_mul(float k){
  return new vector(this.x*k,this.y*k,this.z*k); 
 }
 
 vector normalize(){
   float r=sqrt(this.x*this.x+this.y*this.y+this.z*this.z);
   if(r<0.00001){
    r=1; 
   }
   return new vector(this.x/r,this.y/r,this.z/r);
 }
 
 vector normalize(vector v){
   float r=sqrt(v.x*v.x+v.y*v.y+v.z*v.z);
   if(r<0.00001){
    r=1; 
   }
   return new vector(v.x/r,v.y/r,v.z/r);
 }
 
 float dot(vector v){
  return v.x*this.x+v.y*this.y+v.z*this.z; 
 }
  
 vector vec_mul(vector v){
 return new vector(this.y*v.z-this.z*v.y,this.z*v.x-this.x*v.z,this.x*v.y-this.y*v.x);
 }
 
 vector n(float x,float y,float z){
  return new vector(x,y,z); 
 }
 
 vector rotx(float x){
   float c=cos(x*180/PI);
   float d=sin(x*180/PI);
   return new vector(this.x,this.z*c-this.y*d,this.z*d+this.y*c);
 }
 
 
 vector roty(float y){
   float c=cos(y*180/PI);
   float d=sin(y*180/PI);
   return new vector(this.x*c-this.z*d,this.y,this.x*d+this.z*c);
 }
 
 vector rotz(float z){
   float c=cos(z*180/PI);
   float d=sin(z*180/PI);
   return new vector(this.x*c-this.y*d,this.x*d+this.y*c,this.z);
 }
 
 boolean equals(vector v){
   if(v.x==this.x && v.y==this.y && v.z==this.z){
     return true;
   }
   
   return false;
 }
 
 void apply(vector v){
 this.x=v.x;
 this.y=v.y;
 this.z=v.z;
 }
 
 String toString(){
  return Float.toString(this.x)+","+Float.toString(this.y)+","+Float.toString(this.z);
 }
 
 
}
