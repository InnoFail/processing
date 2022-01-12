/*import controlP5.*;
import java.util.Iterator;

class normal{
  JSONObject j;
  ControlP5 c;
  String file;
  
  normal(String file,test o){
    this.c=new ControlP5(o);
    this.file=file;
    this.j=loadJSONObject("test.json");
  }
  
  void update(test o){
    this.c=new ControlP5(o);
   try{
   initial(j);
   }catch(Exception e){
    
   }
  }
  
  void initial(JSONObject j){
    Iterator k1=j.keyIterator();
    while(k1.hasNext()){
    Object o1=k1.next();
    String[] o2=((String)o1).split("-");
    switch(o2[1]){
      case "box":
      JSONObject p1=j.getJSONObject((String)o1);
      this.button(p1,o2[0]);
      break;
      case "bang":
      JSONObject p2=j.getJSONObject((String)o1);
      this.bang(p2,o2[0]);
      break;
      case "textarea":
      JSONObject p3=j.getJSONObject((String)o1);
      this.bang(p3,o2[0]);
      break;
      default:
     }
    }
  }


  void button(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Button b=c.addButton(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group")));
        break;
      }
     }
  }


  void bang(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Bang b=c.addBang(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group"))); //<>//
        break;
      }
     }
  }
  
  
  void textarea(JSONObject p,String s){
       Iterator k2=p.keyIterator();
       Textarea b=c.addTextarea(s);
      while(k2.hasNext()){
        Object o2=k2.next();
      switch((String)o2){
       case "b-color":
       JSONArray array=p.getJSONArray("b-color");
       b.setColorBackground(color(array.getInt(0),array.getInt(1),array.getInt(2)));
       break;
       case "f-color":
       JSONArray rray=p.getJSONArray("f-color");
       b.setColorForeground(color(rray.getInt(0),rray.getInt(1),rray.getInt(2)));
       break;
       case "width":
       b.setWidth(p.getInt("width"));
       break;
       case "height":
       b.setHeight(p.getInt("height"));
       break;
       case "pos":
       JSONArray arr=p.getJSONArray("pos");
       b.setPosition(arr.getFloat(0),arr.getFloat(1));
       break;
       case "size":
       JSONArray arra=p.getJSONArray("size");
       b.setSize(arra.getInt(0),arra.getInt(1));
       break;
        case "hide":
        b.setVisible(!p.getBoolean("hide"));
        break;
        case "group":
        b.moveTo(this.c.getGroup(p.getString("group")));
        break;
      }
     }
  }

  


 Controller getButton(String s){
   return this.c.getController(s);
 }
 
 Controller getBang(String s){
   return this.c.getController(s);
 }


  
}*/
