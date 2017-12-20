class PianoFactory {
  
  int keyMargin = 5;
  int wkeyWidth=19;
  int wkeyHeight=85;
  int bkeyWidth=10;
  int bkeyHeight=55;
  int keyBorderWidth=1;
  int numWhite = 52;
  int middleCPos = 39;
  int middleCValue = 60;
  int [] ablackPattern= { 1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,
                          1,1,0,1,1,1,0,0 };
  String [] noteNames = {"C","C#/Db","D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A","A#/b","H"};                        

  public int getMidiNoteByPos(int pos){
    return middleCValue+pos-middleCPos; 
  }
  
  public String getMidiNoteName(int pos){
    return noteNames[getMidiNoteByPos(pos)%12]; 
  }

  public int getPianoWidth() {
      return numWhite*wkeyWidth+2*keyBorderWidth+2*keyMargin;
  }

  public void setupKeys() {
    
    pianoKeys = new ArrayList<PianoKey>();
    PianoKey keyObj = null;
    PianoKey leftKey = null;
    int pos = 0;
    for(int i = 0; i < numWhite; i += 1) {
     
      keyObj = new PianoKey(i*wkeyWidth+keyMargin,height-wkeyHeight-keyMargin, wkeyWidth, wkeyHeight,false);

      if (leftKey!=null) {
        leftKey.rightKey = keyObj;
       }
       keyObj.leftKey=leftKey;
       keyObj.position = pos;
       pos++;
       pianoKeys.add(keyObj);
       leftKey= keyObj;
       if (ablackPattern[i]==1) {
         keyObj = new PianoKey(i*wkeyWidth+wkeyWidth/2+keyMargin+bkeyWidth/2,height-wkeyHeight-keyMargin, bkeyWidth, bkeyHeight,true);
         leftKey.rightKey = keyObj;     
         keyObj.leftKey=leftKey;
         keyObj.position = pos;
         pos++;
         pianoKeys.add(keyObj);
         leftKey= keyObj;       
       }
     
   }    
  }
}