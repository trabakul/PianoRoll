class PianoKey {
  float x, y,pkWidth,pkHeight; // X-coordinate, y-coordinate  
  boolean isBlack; // Used to define the tilt
  int position;
  PianoKey leftKey,rightKey;
  boolean isAllreadyPressed = false;
  long fcStart=-1;
  long fcEnd =-1; 
  int speed = 40;
  ArrayList<RollBar> rollBars = new ArrayList<RollBar>();
   

  PianoKey(float xpos, float ypos, float pkWidth, float pkHeight,boolean isBlack) {
    x = xpos;
    y = ypos;
    this.pkWidth = pkWidth;
    this.pkHeight =pkHeight;
    this.isBlack = isBlack;
    
  }

  boolean isInsideShape(float xm, float ym,boolean border) {
    if (border)
      return xm>=x && ym>=y && xm<=x+pkWidth && ym<=y+pkHeight;
    return xm>=x+1 && ym>=y-1 && xm<=x+pkWidth && ym<=y+pkHeight;
  }
  void drawBar(){
    
    //for (int i = 0; i<rollBars.size();i++) {
      for (RollBar p : rollBars) {
        p.y = p.y - speed/frameRate;
        if (!p.isEnd) {
          p.height = p.height + speed/frameRate;
        }
        //noFill();
        fill(70,0,0);
        rect(p.x, p.y,p.width,p.height,4,4,4,4);
        
      }
    
  }
  void endAll() {
           for (RollBar p : rollBars) {
           p.isEnd = true;
         }
         isAllreadyPressed = false;
  }

  void display(float mouseXOver,float mouseYOver) {
    noFill();
    
    if (mousePressed && isInsideShape(mouseX,mouseY,false)) {
      if (!((leftKey != null && leftKey.isBlack && leftKey.isInsideShape(mouseX,mouseY,false)) ||
        (rightKey != null && rightKey.isBlack && rightKey.isInsideShape(mouseX,mouseY,false)))){
          
          fill(0,70,0);
          note =pf.getMidiNoteName(position);
          midiValue =pf.getMidiNoteByPos(position)+"";
          if (!isAllreadyPressed)
            rollBars.add(new RollBar(x,y-5,pkWidth,5));
          isAllreadyPressed = true;
          midiValue = rollBars.size()+""; 
        } else {
          endAll();          
        }
    } else if (isInsideShape(mouseXOver,mouseYOver,false)) {
      if (!((leftKey != null && leftKey.isBlack && leftKey.isInsideShape(mouseXOver,mouseYOver,false)) ||
        (rightKey != null && rightKey.isBlack && rightKey.isInsideShape(mouseXOver,mouseYOver,false))))
      fill(70);
      endAll();
    } else if (isBlack) {
      fill(0);
      endAll();
    } else {
      noFill();
      endAll();
    }
    rect(x, y,pkWidth,pkHeight,0,0,4,4);
    drawBar();
    
  }
}