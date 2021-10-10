int box_num=2;
int fore,side;

void setup(){
 size(300,400,P3D);
 fore=side=0;
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
 move();
  camera(fore, side, 120.0, 50.0, 50.0, 0.0,0.0, 1.0, 0.0);
 //rect(0,0,100,100);
}


void move(){
  if(keyisp==true){
   switch(keyp){
    case "w":
    fore++;
    break;
    case "s":
    fore--;
    break;
    case "a":
    side--;
    break;
    case "d":
    side++;
    break;
   }
  }
}
