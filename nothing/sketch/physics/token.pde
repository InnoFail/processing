import java.util.regex.*;

class token{
  String s;
  StringDict tokens;
  IntList tokens_pos;
  StringList keys;
  
  token(){
    this.s=new String();
    tokens=new StringDict();
    this.tokens_pos=new IntList();
    keys=new StringList();
    this.cut(this.s);
  }
  
  void cut(String s){
    Pattern p1=Pattern.compile("[a-zA-Z0-9]+");
    Matcher m1=p1.matcher(s);
    Pattern p2=Pattern.compile("[\\W]");
    Matcher m2=p2.matcher(s);
    StringDict tokens_test=new StringDict();
    while(m1.find()){
      if(!m1.group().equals("null")){
      int ppp=m1.start();
     tokens_test.set(Integer.toString(ppp),m1.group());
     this.tokens_pos.append(ppp);
      }
    }
    
    while(m2.find()){
      if(!m2.group().equals(" ") && !m2.group().equals("`")){
        int ppp=m2.start();
     tokens_test.set(Integer.toString(ppp),m2.group());
     this.tokens_pos.append(ppp);
      }
    }
    
    this.tokens_pos.sort();
    for(int i: tokens_pos){
      this.tokens.set(Integer.toString(i),tokens_test.get(Integer.toString(i)));
    }
    if(this.tokens.size()!=0){
    for(String i:this.tokens.keyArray()){
      this.keys.append(i);
    }
  }
    
  }
  
}
