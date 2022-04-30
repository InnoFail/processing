
function help(){
  this.time = 0;
  setInterval(()=>{this.time++;},10);
  
  this.clear = color(0,0,0,0);
  this.white = color(255);
  this.black = color(0,0,0);
  this.grey = color(80,80,80);
  
  this.grey_1 = color(189);
  this.grey_2 = color(159);
  this.grey_3 = color(105);
  this.grey_4 = color(66);
  this.grey_5 = color(45);
  
  this.n_red = color(249,59,47);
  this.n_blue = color(3,118,247);
  this.n_sky_blue = color(90,196,246);
  this.n_light_blue = color(52,166,214);
  this.n_yellow = color(252,200,3);
  this.n_green = color(78,213,95);
  this.n_orange = color(249,146,5);
  this.n_violet = color(87,82,208);
  this.n_pink = color(249,45,82);
  
  this.dye_blue = color(11,19,84);
  this.dye_sky_blue = color(22,91,170);
  this.dye_violet = color(161,85,185);
  this.dye_dark_pink = color(247,101,163);
  this.dye_pink = color(253,163,181);
  this.dye_light_pink = color(249,209,209);
  
  this.brick_dark_blue = color(88,100,146);
  this.brick_blue = color(118,171,187);
  this.brick_red = color(248,66,82);
  this.brick_violet = color(112,12,84);
  this.brick_pink = color(235,219,152);
  
  this.vb_orange = color(243,98,54);
  this.vb_blue = color(47,40,89);
  this.vb_aqua = color(26,154,140);
  this.vb_red = color(231,29,54);
  this.vb_yellow = color(231,213,76);
  
  this.colors = [this.white,this.black,this.grey,this.grey_1,this.grey_2,this.grey_3,this.grey_4,this.grey_5,this.n_red,this.n_blue,this.n_light_blue,this.sky_blue,this.n_yellow,this.green,this.orange,this.violet,this.pink,this.dye_blue,this.dye_sky_blue,this.dye_violet,this.dye_dark_pink,this.dye_pink,this.dye_light_pink,this.brick_red,this.brick_blue,this.brick_dark_blue,this.brick_violet,this.brick_pink,this.vb_orange,this.vb_blue,this.vb_aqua,this.vb_red,this.vb_orange];
  
  this.l = function(a,b){
    return lerpColor(a,b,0.5);
  }
  
  this.random_colors = function(){
    return this.colors[parseInt(random(this.colors.length))];
  }
  
  this.alpha = function(col,val){
    let r = red(col);
    let b = blue(col);
    let g = green(col);
    return lerpColor(col,color(val,val,val),0.1);
  }
  
  this.get_key_pressed = function(){
    return key_code_2;
  }
  
  this.delx = function(){
  return  pmouseX - mouseX;
}


  this.dely = function(){
  return  pmouseY - mouseY;
}

  
}
