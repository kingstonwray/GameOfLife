int numObj = 10;
ArrayList<IntObj> ObjAL;
void setup() {
  size(500,500);
    ObjAL = new ArrayList<IntObj>();
    for(int i = 0; i<numObj;i++){
      IntObj aObj = new IntObj();
      aObj.setValue((int)(Math.random()*(numObj+1)));
    }
}

void draw() {
  for(IntObj io: ObjAL){
    io.show();
  }
}
