class PianoKey {
  float x, y,pkWidth,pkHeight; // X-coordinate, y-coordinate  
  boolean isBlack; // Used to define the tilt
  int position;
  PianoKey leftKey,rightKey;

  // Constructor
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

  void display(float mouseXOver,float mouseYOver) {
    noFill();
  
    if (mousePressed && isInsideShape(mouseX,mouseY,false)) {
      if (!((leftKey != null && leftKey.isBlack && leftKey.isInsideShape(mouseX,mouseY,false)) ||
        (rightKey != null && rightKey.isBlack && rightKey.isInsideShape(mouseX,mouseY,false)))){
          fill(0,70,0);
          note =pf.getMidiNoteName(position);
          midiValue =pf.getMidiNoteByPos(position)+"";
        }
    } else if (isInsideShape(mouseXOver,mouseYOver,false)) {
      if (!((leftKey != null && leftKey.isBlack && leftKey.isInsideShape(mouseXOver,mouseYOver,false)) ||
        (rightKey != null && rightKey.isBlack && rightKey.isInsideShape(mouseXOver,mouseYOver,false))))
      fill(70);
    } else if (isBlack) {
      fill(0);
    } else {
      noFill();
    }
    rect(x, y,pkWidth,pkHeight,0,0,4,4);
  }
}