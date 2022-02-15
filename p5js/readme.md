<details> 
<summary> Click me </summary>
<p>
Just for texting collapsable in github
</p>
</details>

# Simple And Elegent UI
***UI library*** is simple to learn and easy to use and yet a very powerful library in terms of making 2D ui. It is applicable to p5.js library and can be used to make 2d-ui for games either 2d or 3d games . I has provided some beautiful themes in help.js file , simply include it into your html file and you are good to go.
  
### ***Topics***
- Constructors
- Setter functions
  * public usable setter functions
  * private setter functions
 - Getter functions
   * public getter functions
   * private getter functions
   * functions that returns this object
 - Other functions
    * all other functions are private and are deprected to be used driectly in the code 
 - Miscellaneous
   * variables held by ui.js file
   * colors and themes in help.js file
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
- del_snap(delx1,dely1,delx2,dely2,stric)
- del_snap_px(delx1,dely1,delx2,dely2,stric)
-  set_str(text)
-  set_angle(angle)
- set_clip(clipped)
- repos(delx,dely,delw,delh)
- set_align(a,b)
- set_line_height(height)
- set_text_color(color)
- set_text_style(style)
- free_hover()
- set_stroke_color(color)
- set_color(color)
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
----------------------------------------------------------------
### ***Getters***
#### private getters
--> To remember
: There are no private getter functions
#### public getters
- x_to_weight(a)
- y_to_weight(a)
- weight_to_x(a)
- weight_to_y(a)
-  coord()
- hovered()
- clicked()
- point_in(x,y)
- point_inside(x,y)
- hasinside(ui)
- collision(ui)
- get_line_height()
#### functions that return this object
-------------------------------------------------------------
### ***Others***
#### public functions
- copy()
- draw()
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
|1| canvas| createGraphics(width,height)| |
|2| clipped| false| |
|3| x| 0| |
|4| y| 0| |
|5| width| width| |
|6| height| height| |
|7| tl_radius| 0| |
|8| tr_radius| 0| |
|9| bl_radius| 0| |
|10| br_radius| 0| |
|11| n_row| 1| |
|12| n_col| 1| |
|13| color| 0| |
|14| stroke_color|  color(0,0,0,0)| |
|15| snaps| [0,0,1,1]| |
|16| wrap| 1| |
|17| fontSize| 14| |
|18| txtCol| 0| |
|19| str| ""| |
|20| align| [0,0]| |
|21| lineh| 14| |
|22| txtStyle| 0| |
|23| angle| 0| |
|24| mx| 0| |
|25| my| null| |
|26| last_clicked| false| |
|27| p| ui_parent| |
|28| inp| null| |
|29| scrollx| 0| |
|30| scrolly| 0| |

---------------------------------------------------------------------
### Examples


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
|10| del_snap(delx1,dely1,delx2,dely2,stric) | changes the snap by adding del amount in weight of each and the stric parameter defines if the child exceeds the parent| 
|11| del_snap_px(delx1,dely1,delx2,dely2,stric) | changes the snap by adding del amount in px rather than weight of each and the stric parameter defines if the child exceeds the parent| 
|12| set_str(text) | sets text to be shown while displaying text in ui element |
|13| set_angle(angle) | sets angle for rotation, where angle is in degrees |
|14| coord() | returns the coordinates after applying rotations|
|15| set_clip(clipped) | boolean value clipped if set true will clip any text content outside the rectangular box|
|16| draw() | without parameters and should be called every time a ui is drawn |
|17| repos(delx,dely,delw,delh) | all parameters affects at pixel sizing and this function helps in translation of element |
|18| point_in(x,y) | checks if a point is in the rotated or unrotated rectangle or not |
|19| point_inside(x,y) | checks if a point is in an unrotated rectangle or not , this function is only to increase performance|
|20| hasinside(ui) | to determine if a ui is totally inside another ui either rotated or not | 
|21| collision(ui) | to check if the provided ui object collides with this ui or not either rotated or unrotated|
|22| nothing() | function that does nothing |
|23| edit(text) | displays text on ui|
|24| createInp(event)| ***deprecated function***|
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

-----------------------------------------------------------





