# Simple And Elegent UI
***UI library*** is simple to learn and easy to use and yet a very powerful library in terms of making 2D ui. It is applicable to p5.js library and can be used to make 2d-ui for games either 2d or 3d games . I has provided some beautiful themes in help.js file , simply include it into your html file and you are good to go. UnFortunately , it supports no rotations .
  
### ***Topics***
- Constructors
- Setter functions
  * public usable setter functions
  * private setter functions
 - Getter functions
   * public getter functions
   * private getter functions
   * using variables to get values
   * functions that returns this object
 - Other functions
    * all other functions are private and are deprected to be used driectly in the code 
 - Miscellaneous
   * variables held by ui.js file
   * colors and themes in help.js file
   * wonders of group.js
   * wonders of component.js
  - Examples
 - Summary
  
  ## Descriptions
### ***Constructors***
--> To remember
 : There are two constructor available in ui.js file and that is ui()` and `ui(ui_parent)` without any parameters.
   __ui()__ is only for public use while __ui(ui_parent)__ is a private construct used by copy() function behind the back.
   
 ---------------------------------------
### ***Setters***
#### private setters
- snap()
- edit(str)
- createInp(event)
#### public setters
- setup( size )
	--> size can be [x,y] describing top left position, width and height are the size of canvas by deafult
	--> size can be [x,y,w,h] describing top left position and  width and height of ui 
	**Note : This is only for parents.**
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]);
	v = new ui().setup([200,200,100,100]);
}
function draw(){
	u.draw();
	v.draw(); 
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- grid(n_row ,n_col)
---> n_row and n_col describe the partition of the box like a grid for holding child ui. The grid is 1 by 1 by default.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5);
	v = u.copy();
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- c(r , g ,b)
---> r , g and b are red , green and blue respectively ranging from 0 to 255.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- c(r ,g ,b ,a)
--->  r , g , b and a are red , green , blue and alpha respectively ranging from 0 to 255.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_snap(x1,y1,x2,y2)
---> x1,y1 nad x2,y2 gives top-left and bottom-right  respectively position of child ui on grid of parent
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- del_snap(delx1,dely1,delx2,dely2,stricx,stricy)
---> delx1,dely1,delx2,dely2 affect the top-left and bottom-right corner of grid coordinate and values are in weight and stricx and stricy can be ether true or false to determine if ui should be restricted to grow within parents.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
}
function draw(){
	if(v.clicked()){
	v.del_snap(0,(mouseX-pmouseX)/60,0,0,true);//mouseX and pmouseX are variables in p5
	}
	u.set_str("Hello world");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- del_snap_px(delx1,dely1,delx2,dely2,stricx,stricy)
---> delx1,dely1,delx2,dely2 affect the top-left and bottom-right corner of grid coordinate and values are in pixel and stricx and stricy can be ether true or false to determine if ui should be restricted to grow within parents.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
}
function draw(){
	if(v.clicked()){
	v.del_snap_px(0,(mouseX-pmouseX),0,0,true);//mouseX and pmouseX are variables in p5 and stricx is set to true to confine it in x axis within parent
	}
	u.set_str("Hello world");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
-  set_str(text)
---> text is text to be displayed
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
}
function draw(){
	u.set_str("Hello world");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```

- set_clip(clipped)
---> This is only for text content. By default clipped = false.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_clip(true);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- repos(delx,dely,delw,delh)
---> sets a change in top-left position and on size of ui if and only if ui has no parent, that is it is a parent.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	u.repos(100,100);
	v.repos(50,50,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_align(a,b)
---> first arg: 0->left ,1->center ,2->right 
---> second arg: 0->top ,1->bottom ,2->baseline ,3->center
__Note : The align property is for single line over the width only , and for line height only.__
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_align(1,0);
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_line_height(height)
--->height is in px
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_line_height(50);
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_text_color(color)
---> color() function of p5 is accepted by this function as argument.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_text_color(color(255,0,0));
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_wrap(wrap)
---> wrap:  0-> word , 1-> letters
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_wrap(0);//italic
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_font_size(size)
---> size in pixel
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_size(25);//italic
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_text_style(style)
---> style: 0->normal,1->italic,2->bold,3->boldItalic
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_text_style(1);//italic
}
function draw(){
	v.set_str("Menu");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- free_hover()
---> frees the last_hover variable. It is necessary when different parents come across each other while hovering
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	let col = color(255,0,0);
	u = new ui().setup([100,100]).grid(5,5).set_color(col);
	v = new ui().setup([150,150,100,100).c(255,255,0).sc(0,0,0);
}
function draw(){

	free_hover();
	if(v.hovered()){
	v.c(0,0,255);
	}else{
	v.c(255,255,0);
	}
	free_hover();
	if(u.hovered()){
	u.c(0,255,0);
	}else{
	u.c(255,0,0);
	}
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_stroke_color(color)
---> color() is p5 function and parameter color accepts its value
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	let col = color(255,0,0);
	u = new ui().setup([100,100]).grid(5,5).set_color(col);
	v = u.copy().c(255,0,0).set_stroke_color(color(0,0,0));
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_color(color)
---> color() is p5 function and parameter color accepts its value
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	let col = color(255,0,0);
	u = new ui().setup([100,100]).grid(5,5).set_color(col);
	v = u.copy().c(255,0,0).sc(0,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- sc(r ,g ,b)
---> r , g and b are red , green and blue respectively ranging from 0 to 255.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().c(255,0,0).sc(0,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- sc(r ,g ,b ,a)
---> r , g , b and a are red , green , blue and alpha respectively ranging from 0 to 255.
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().c(255,0,0).sc(0,0,0,125);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_radius(radius)
---> function sets corner to same radius in weight value with respect to parent width(to max 1) ranging from 0 to 1 but greater than 1 is fine which gives radius larger value
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,1,4,4).set_radius(0.5).c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_radius_i(tl,tr,bl,br)
---> function sets corner tl(top left), tr(top right), bl(bottom left), and br(bottom right) in weight value with respect to parent width(to max 1) ranging from 0 to 1 but greater than 1 is fine which gives radius larger value
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,1,4,4).set_radius_i(0.5,0.2,0.2,0.3).c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_radius_px(radius)
---> function sets corner to same radius in pixel value with respect to parent width
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,1,4,4).set_radius_px(50).c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_radius_i_px(tl,tr,bl,br)
---> function sets corner tl(top left), tr(top right), bl(bottom left), and br(bottom right) in pixelvalue with respect to parent width
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,1,4,4).set_radius_i_px(50,50,100,100).c(255,0,0);
}
function draw(){
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- set_scroll(x,y)
---> x,y is in pixel, and this function is to scroll text content inside ui
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_clip(true);
	v.set_scroll(30,40);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```

----------------------------------------------------------------
### ***Getters***
#### private getters
--> To remember
: There are no private getter functions
#### public getters
- x_to_weight(a)
---> a is in pixel, is converted on the basis of parent ui width
`let x = u.x_to_weight(5);`
- y_to_weight(a)
---> a is in pixel, is converted on the basis of parent ui height
`let y = u.y_to_weight(5);`
- weight_to_x(a)
---> a is in weight value form 0 to1 or can be greater than 1 representing greater value than parent width, is converted on the basis of parent ui width
`let x = u.weight_to_x(5);`
- weight_to_y(a)
---> a is in weight value form 0 to1 or can be greater than 1 representing greater value than parent width, is converted on the basis of parent ui height
`let y = u.weight_to_y(5);`
-  coord()
`let coordinates = u.coord();`
- hovered()
---> only use free_hover() function if the ui you are using free_hover() is not a child of any other ui.
```javascript
let u,v,w;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = new ui().setup([100,100,100,100]).c(255,0,255);
	w = v.copy().set_snap(0,0,0.5,0,5).c(0,255,0);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	free_hover();
	if(v.hovered()){
		v.set_str("hovered");
	}
	if(w.hovered()){
		v.set_str("w_hovered");
	}
	u.draw();
	v.draw();
	w.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- clicked()
---> only use free_hover() function if the ui you are using free_hover() is not a child of any other ui.
```javascript
let u,v,w;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = new ui().setup([100,100,100,100]).c(255,0,255);
	w = v.copy().set_snap(0,0,0.5,0,5).c(0,255,0);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	free_hover();
	if(v.clicked()){
		v.set_str("hovered");
	}
	if(w.clicked()){
		v.set_str("w_hovered");
	}
	u.draw();
	v.draw();
	w.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- focused()
---> only use free_hover() function if the ui you are using free_hover() is not a child of any other ui.
```javascript
let u,v,w;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = new ui().setup([100,100,100,100]).c(255,0,255);
	w = v.copy().set_snap(0,0,0.5,0,5).c(0,255,0);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	free_hover();
	if(v.focused()){
		v.set_str("hovered");
	}
	if(w.focused()){
		v.set_str("w_hovered");
	}
	u.draw();
	v.draw();
	w.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- point_inside(x,y)
---> difference between point_in and point_inside is nothing if rotation is not applied.
`let bool_ = ui.point_inside(mouseX,mouseY);`
- hasinside(ui)
`let bool_ = u.has_inside(v);\\ that_is does v is inside u;`
- collision(ui)
`let bool_ = ui.collision(v);\\ if v and u are touching`
- get_line_height()
`let h = u.get_line_height()`
#### using variables to get values
```javascript
let u,v;
function setup(){
	createCanvas(600,350);
	u = new ui().setup([100,100]).grid(5,5).c(255,0,0);
	v = u.copy().set_snap(0,0,5,4).c(255,0,0);
	v.set_clip(true);
	v.set_scroll(30,40);
}
function draw(){
	v.set_str("Wow this is lamang and I am very hostile to see you here , how will you like to play football with me.");
	let v_position_width = v.width;
	let v_position_height = v.height;
	console.log("width of v",v_position_width );
	console.log("height of v",v_position_height );
	u.draw();
	v.draw();
	// Note the rendering is done in the order the draw calls are made , as in above example u is rendered first then v , so v is on the top of u.
}
```
- get_text_width()
#### functions that return this object
- __Note: All setter functions return this.__
-------------------------------------------------------------
### ***Others***
#### public functions
- copy()
- component(ui_parent)
---> returns exact copy of itself but with different parent. See the example section.
- draw()
- createInp() **-->Has been deprecated<--**
 **Note**
	---> Every ui are rendered in the order they are placed in draw call in p5.
- nothing()
-----------------------------------------------------------
### ***Miscellaneous***
#### Variables held by ui.js
The variables inside ui.js are not to be modified directly in user code , only getters and setters functions are to be used to modify then .
But reading them is fine.
| SN |    variables   |    default_value   | getters and setters |
|----|---------------|-----------------|----------|
|1| canvas| createGraphics(width,height)| none |
|2| clipped| false| set_clip() |
|3| x| 0| snap(),del_snap(),del_snap_px()|
|4| y| 0| snap(),del_snap(),del_snap_px()|
|5| width| width| snap(),del_snap(),del_snap_px()|
|6| height| height| snap(),del_snap(),del_snap_px()|
|7| tl_radius| 0| set_radius(),set_radius_i(),set_radius_px(),set_radius_i_px()|
|8| tr_radius| 0| set_radius(),set_radius_i(),set_radius_px(),set_radius_i_px()|
|9| bl_radius| 0| set_radius(),set_radius_i(),set_radius_px(),set_radius_i_px()|
|10| br_radius| 0| set_radius(),set_radius_i(),set_radius_px(),set_radius_i_px()|
|11| n_row| 1| grid(),copy()|
|12| n_col| 1| grid(),copy()|
|13| color| 0| set_color(),c()|
|14| stroke_color|  color(0,0,0,0)| set_stroke_color(),sc()|
|15| snaps| [0,0,1,1]| set_snap()|
|16| wrap| 1| set_wrap()|
|17| fontSize| 14| set_font_size()|
|18| txtCol| 0| set_text_color()|
|19| str| ""| set_str()|
|20| align| [0,0]| set_align()|
|21| lineh| 14| set_line_height()|
|22| txtStyle| 0| set_text_style()|
|23| | | |
|24| | | |
|25| | | |
|26| last_clicked| false| clicked()|
|27| p| ui_parent| copy()|
|28| | | |
|29| scrollx| 0| set_scroll()|
|30| scrolly| 0| set_scroll()|
|31| last_hover| null| hovered()|
|32| last_focus| null| focued(),clicked()|
|33| no_edit| false| set_no_edit()|
#### colors and themes in help.js file
 help.js contains fourthemes that is normal(n), dye, brick and vb(vibrant). 
 There are two functions :
 - l(color1,color2) ---> mixes two color
 ```javascript
 let h = new help();
 let c = h.l(h.grey_5,h.n_green);
 let u = new ui().set_color(c);
```
- alpha(colour1,value) ---> changes opacity of a color, value ranges from 0 to 1000;
 ```javascript
 let h = new help();
 let c = h.alpha(h.grey_5,125);
 let u = new ui().set_color(c);
```
 - get_key() ---> returns key_code after key is released
 `let code = h.get_key();`
 - delx() ---> returns small change in mouse position_x while moving
 - dely() ---> returns small change in mouse position_y while moving
 - get_key_pressed() returns the key after pressed and before released, as long as key is pressed.
 - get_key_released() is same as get_key() and returns same value
 The colors are:
 - clear
 - white
 - black
 - grey
 - grey_1
 - grey_2
 - grey_3
 - grey_4
 - grey_5
 - n_red
 - n_blue
 - n_sky_blue
 - n_light_blue
 - n_yellow
 - n_green
 - n_orange
 - n_violet
 - n_pink
 - dye_blue
 - dye_sky_blue
 - dye_violet
 - dye_dark_pink
 - dye_pink
 - dye_light_pink
 - brick_dark_blue
 - brick_blue
 - brick_red
 - brick_violet
 - brick_pink
 - vb_orange
 - vb_blue
 - vb_aqua
 - vb_red
 - vb_yellow
 
 #### Wonders of group.js
 - variables
	 - ui ---> contains the current ui created by group(ui) function
	 - childs ---> contains list of childs created directly by copy() function
	 - parent ----> its every child has ui as its parent
 - functions
   - group(ui) ---> constructor
   - copy() ---> functions that produces new child and adds an instance in childs list variable
   - child(index) ---> returns child at that index
- example
```javascript
// making a keyboard and a slider
let u,v,p,q,r,s,t,a,b;
let slider, bar;
let t1,t2,t3;
let h;
let v_txt="abcdefghijklmnopqrstuvwxyz";
let count = 0;

function setup(){
   createCanvas(400,300);
  h = new help();
  u = new group(new ui().set_color(h.n_red));
  for(let i=0; i< 7;i++){
    for(let j=2; j<6 ;j++){
      let a=0,b=0;
      let pp = u.ui.width;
      let ph = u.ui.height;
      u.copy();
      u.child(count).ui.set_snap(1/8*i,1/6*j,1/8*(i+1),1/6*(j+1)).set_color(h.n_green).set_stroke_color(h.black).set_str(v_txt.charAt(count)).set_scroll(-u.child(count).ui.width/2+u.child(count).ui.get_text_width()/2,-u.child(count).ui.height/2+u.child(count).ui.lineh/2).set_radius_px(10);
      count++;
  }
  }
  
  slider = u.copy();
  slider.ui.set_snap(0.95,0,1,1).set_color(h.white);
  bar = slider.copy();
  bar.ui.set_snap(0,0.1,1,0.2).set_color(h.grey);
}


function draw(){
  if(bar.ui.clicked()){
    bar.ui.del_snap_px(-h.delx(),-h.dely(),-h.delx(),-h.dely(),true,true);
  }
  
  u.ui.draw();
  slider.ui.draw();
  bar.ui.draw();
  if(u.ui.focused()){
      u.ui.set_color(h.alpha(h.n_red,225));
    }else if(!u.ui.hovered()){
      u.ui.set_color(h.n_red);
    }
  for(let i=0; i<count ;i++){
    let vi = u.child(i).ui;
    
    if(vi.hovered()){
      vi.set_color(h.n_blue);
    }else if(!vi.hovered()){
      vi.set_color(h.n_green);
    }
    if(vi.clicked()){
      vi.set_color(h.n_sky_blue);
    }else if(!vi.hovered() && !vi.clicked()){
      vi.set_color(h.n_green);
    }
    vi.draw();
  }
}



```

 #### Wonders of component.js
  Functions:
- slider(min,max,vert,ui) = ui belongs to group object in group.js ,has variables : --- parent,vert,slider,bar and functions are draw() and get_value(). Note parent,slider and bar are group objects
 - button(text,ui) = ui belongs to group object in group.js ,has variables : --- parent,padx,pady,button,shadow and functions are draw() shadow(a,b,c,d,colour), and create(). Note parent,button and shadow are group objects
- div(text,ui) = ui belongs to group object in group.js ,has variables : --- parent,button,child,shade and functions are draw() , set_color(c), del_snap(a,b,c,d),del_snap_px(a,b,c,d),shadow(a,b,c,d,colour). Note parent,button and shadow are group objects. Difference between div and button is shadow in div works on shadow variable while shadow on button works on button variable.
 - list(number,ui_list,u) = ui belongs to group object in group.js ,has variables : --- parent, list,n,u_list,count and functions draw(),change(count_number,vert)
- editor(ui) =  ui belongs to group object in group.js ,has variables : --- parent, list,n,u_list,count and functions draw(),get_str()
	--Example
```javascript
let u,v,s,t,w,l;
let n=10,m = 10;
let h;
let u_str = ";You ;can ;say ;so ;as.";
let ed;


function setup(){
   createCanvas(400,300);
  //font = loadFont("Roboto.ttf");
  h = new help();
  u = new group(new ui().set_color(h.n_red));
  u.ui.grid(50,50);
  v = new slider(0,100,false,u);
  v.slider.ui.set_snap(0,46,50,50);
  v.bar.ui.set_str("Slide me");
  u.copy();
  u.child(1).ui.set_snap(0,40,5,46).set_color(h.n_yellow);
  s = new button("Button",u);
  s.button.ui.set_snap(2,2,s.button.ui.snaps[2]+2,s.button.ui.snaps[3]+2);
  
  
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello1");
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello2");
  u.copy().ui.set_color(h.white).set_snap(0,0,5,2).set_str("hello3");
  t = new list(2,[u.child(3),u.child(4),u.child(5)],u);
  t.list.ui.set_snap(10,10,10,10);
  t.change(0,true);
  l = new ui().setup([100,100,100,60]).set_color(h.white).set_str("Hello I am so exhausted right now that i can,t even say now than all done i can freely").set_scroll(30,30);
  l.set_clip(true);
  l.set_text_color(h.n_green);
  ed = new editor(u);
  ed.editor.ui.del_snap(30,10,30,10);
}


function draw(){
  //textFont(font);
  if(s.button.ui.clicked()){ 
    s.shadow(0,0,0,0,h.grey);
    t.change(0,false);
  }else{
    s.shadow(3,3,3,3,h.grey);
    t.change(1,true);
  }
  u.child(1).ui.set_str(v.get_value()).set_scroll(-8,-8);
  u.ui.draw();
  v.draw();
  u.child(1).ui.draw();
  s.draw();
  t.draw();
  l.draw();
  ed.key(h.get_key());
  ed.draw();
}





```


------------------------------------------------------------------
### Summary
#### All the available functions :
| SN | Name | Description of parameters |
|--------|-------------------------|------|
|1| ui()   | constructor function without parameters|
|2| ui(ui_parent)  | constructor function that takes parent ui object as parameter|
|3| setup(size) | takes size as [x,y] or [x,y,w,h] as parameter where (x,y) is top left position and (w,h) are width and height of bounding box. |
|4| snap() | without parameter that helps compute the position and (height,width) of the box|
|5| grid(n_row,n_col) | sets the size of grid |
|6| c(r,g,b) | sets fill color in (red,green,blue) and all parameters ranges from 0 to 255 .|
|7| c(r,g,b,a) | sets fill color in (red,green,blue,alpha) and all parameters ranges from 0 to 255 .|
|8| copy() | without parameters produces a child of its own and returns the object |
|9| set_snap(x1,y1,x2,y2) | (x1,y1) and (x2,y2) is the top left and bottom right coordinate of child in parents grid |
|10| del_snap(delx1,dely1,delx2,dely2,stricx,stricy) | changes the snap by adding del amount in weight of each and the stricx and stricy parameter defines if the child exceeds the parent| 
|11| del_snap_px(delx1,dely1,delx2,dely2,stricx,stricy) | changes the snap by adding del amount in px rather than weight of each and the stricx and stricy parameter defines if the child exceeds the parent| 
|12| set_str(text) | sets text to be shown while displaying text in ui element |
|13| | |
|14| coord() | returns the coordinates after applying rotations|
|15| set_clip(clipped) | boolean value clipped if set true will clip any text content outside the rectangular box|
|16| draw() | without parameters and should be called every time a ui is drawn |
|17| repos(delx,dely,delw,delh) | all parameters affects at pixel sizing and this function helps in translation of element, but using repos(delx,dely) is just fine |
|18| |  |
|19| point_inside(x,y) | checks if a point is in an unrotated rectangle or not , this function is only to increase performance|
|20| hasinside(ui) | to determine if a ui is totally inside another ui either rotated or not | 
|21| collision(ui) | to check if the provided ui object collides with this ui or not either rotated or unrotated|
|22| nothing() | function that does nothing |
|23| edit(text) | displays text on ui|
|24| | |
|25| set_align(a,b) | sets alignment where a, b has meaning and values as described in upper chapters|
|26| set_line_height(height)| sets the text line height|
|27| get_line_height() | returns line height|
|28| set_text_color(color) | sets color of text|
|29| set_text_style(style)| sets style of text like bold , italic as described above|
|30| hovered() | returns if the lastest object hovered is this|
|31| clicked() | returns if the object is clicked or not|
|32| free_hover()| frees hover u variable , it is used when different parents comes on top of the other.|
|33| set_stroke_color(color)| sets stroke color|
|34| set_color(color)| sets color|
|35| sc(r,g,b)| similar to c(r,g,b) ,sets stroke color|
|36| sc(r,g,b,a)| similar to sc(r,g,b,a) ,sets stroke color|
|37| set_radius(radius)| sets the radius of all corners of the box , radius is in weight|
|38| set_radius_i(tl,tr,bl,br)| sets individual radius of four corners, all parameters are in weight| 
|39| set_radius_px(radius)| sets the radius of all corners of the box , radius is in pixels|
|40| set_radius_i_px(tl,tr,bl,br)| sets individual radius of four corners, all parameters are in pixels|
|41| x_to_weight(a)| returns the weight value of a(in pixel) with respect to width of parent|
|42| y_to_weight(a)| returns the weight value of a(in pixel) with respect to heightof parent|
|43| weight_to_x(a)| returns the pixel value of a(in weight) with respect to width of parent|
|44| weight_to_y(a)| returns the pixel value of a(in weight) with respect to height of parent|
|45| set_scroll(a,b)| sets scrollx and scrolly for text scrolling|
|46| set_wrap(a)| sets wrap|
|47| set_font_size(a)| sets font size|
|48| set_no_edit(bool)| sets if text should be displayed or not|
|49| get_text_width()| returns text width|

-----------------------------------------------------------



