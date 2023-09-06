//////////////////////////////////////////////////////////////////////////////////2

class PWindow2 extends PApplet {
  PWindow2() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

Capture cam;
    int tmr3 = millis();
    int cad=0;
    boolean mig=false;
    boolean kap=false;
    int y;
  String[] cameras = Capture.list();
  boolean recording = false;
  boolean foto = false;
  Movie movie;
  
  void settings() {//камера
    size(640, 480);//(480, 500)
  }

  void setup() {
    background(150);
    windowMove(1420, 0);
    surface.setTitle("ЦУП видео");
     
    if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }
  }

  void draw() {
   // ellipse(random(width), random(height), random(50), random(50));
       if (kap || millis() - tmr3 > 7000) {//отправка сигнала
    tmr3 = millis();
    cam.stop();
    mig=!mig;
    kap=false;
    if (mig){
    cad=1;
    } else {
    cad=0;
    }
        println("world.");
        println(mig);
        cam = new Capture(this, cameras[cad]);
    cam.start();
    }
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  
  textSize(24);
  line(45, 55, 165, 55);
  line(45, 30, 165, 30);
  fill(0, 408, 612);
  text("Камера -  " + cad, 105, 50);
  fill(0, 200, 0);
  textSize(35);
  text(nf(hour(), 2) + ":" + nf(minute(), 2) + ":"+ nf(second(), 2), 105, 400); 
  
    if (recording) {
    //saveFrame("output/frames####.png");
    movie = new Movie(this, "testmovie.avi");
  }
      if (foto) {
    saveFrame("output/framesFoto####.png");
    foto=false;
  }
    textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Нажми F для фото", width/2, height-24);
  } 
  else {
    text("Нажми r для остановки записи.", width/2, height-24);
  }
    stroke(255);
  if (recording || foto) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
  }

  void mousePressed() {

  }
  
  void keyPressed() {
  
  // If we press r, start or stop recording!
 /* if (key == 'r' || key == 'R') {
    recording = !recording;
  }*/
    if (key == 'f' || key == 'F') {
    foto = true;
  }
      if (key == '1') {
    cad=0;
    kap=true;
  }
      if (key == '2') {
    cad=1;
    kap=true;
  }
  
    if (key == 'q' || key == 'Q') {
    keyq = !keyq;
  }
}

  void exit()
  {
    dispose();
    two = null;
  }
}
