ArrayList<PianoKey> pianoKeys = new ArrayList<PianoKey>();
PianoFactory pf = new PianoFactory();
float mouseXOver = -1;
float mouseYOver = -1;
String note ="--";
String midiValue ="--";
//PFont f; 


void settings() {

  size(pf.getPianoWidth()+100, 600);
   
  pf.setupKeys();
  
}

void setup() {
 //f = createFont("Arial",16,true); 
}

void draw() {
  background(255);
  boolean drawBlack = false;
  note ="--";
  midiValue ="--";

  for (int j = 0; j<2;j++) {
  for (int i = 0; i<pianoKeys.size();i++) {
    if (pianoKeys.get(i).isBlack==drawBlack){ 
        pianoKeys.get(i).display(mouseXOver,mouseYOver);
    }
  }
  drawBlack = true;
  }
  fill(255);
  rect (pf.getPianoWidth(),height-100,98,98);
  fill(255,0,0);
  textSize(30);        
  text(note,pf.getPianoWidth()+(100-textWidth(note))/2,height-50);
  text(midiValue,pf.getPianoWidth()+(100-textWidth(midiValue))/2,height-20);
  
  
  
}

void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  mouseXOver = mouseX;
  mouseYOver = mouseY;
}