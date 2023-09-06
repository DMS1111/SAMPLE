//////////////////////////////////////////////////////////////////////////////////1
class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  void settings() {//карта
    size(1415, 745);
  }

  void setup() {
    background(150);
    windowMove(0, 70);
    surface.setTitle("Интерактивная карта");
     
     cp5 = new ControlP5(this);
     cp5.addButton("Create").setWidth(100).setHeight(25).linebreak();
  }

  void draw() {
    //ellipse(random(width), random(height), random(50), random(50));
  //background(255, 0, 0);
  //fill(255);
  
  if (keyq)  {
  image(logo2, 0, 0, width, height);
  stroke(200);
}
  else {
    image(logo, 0, 0, width, height);//image(logo, 0, 0, 1400, 740);
    stroke(50);
  }

//stroke(0);
if (keys){
   for ( int b = 0; b < 64; b++ ) {
    line(b * 50, 0, b * 50, height );
   for ( int y = 0; y < 48; y++ ) {
    line( 0, y * 50, width, y * 50 );
  }
  }
  }
  }

  void exit()
  {
    dispose();
    one = null;
  }
  void mousePressed() {
  }
}

  void keyPressed() {
  if (key == 'q' || key == 'Q') {
    keyq = !keyq;
  }
  }
  
