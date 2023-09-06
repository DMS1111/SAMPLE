//////////////////////////////////////////////////////////////////////////////////4
int tmr4 = millis();
int tmr5 = millis();
int newSensorReading = 0;
int newSensorReading2 = 0;

class PWindow4 extends PApplet {
  PWindow4() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  void settings() {//датчики
    //size(455, 220);
    size(705, 155);
  }

  void setup() {
    background(150);
    windowMove(0, 850);
    surface.setTitle("Датчики");
  }

  void draw() {
    background(150);
    
      textSize(80);
      
      text(newSensorReading, 500, 70);
      if (newSensorReading>150)   fill(250, 0, 0);
      else fill(0, 250, 0);
      
   m = new Meter(this, 0, 10);
   m.setMeterWidth(225); 
   m.setTitle("Напряжение питания");
   m.setMaxScaleValue(15.0);
   String[] scaleLabelsAV1 = {"0", "2.5", "5", "7.5", "9", "12", "15"};
   m.setScaleLabels(scaleLabelsAV1);
   m.setDisplayDigitalMeterValue(true);
   m.setLowSensorWarningActive(true);
   m.setLowSensorWarningValue((float)10.0);
   m.setHighSensorWarningActive(true);
   m.setHighSensorWarningValue((float)13);
  
    if (millis() - tmr4 > 1000) {//отправка сигнала
      tmr4 = millis();
      newSensorReading2 = (int)random(150, 240);
    }
   m.updateMeter(newSensorReading2);              
   ///////////////   
   av = new Meter(this, 225, 10);
   av.setMeterWidth(225);
   
   av.setTitle("Амперы");
   av.setMaxScaleValue(5.0);
   String[] scaleLabelsAV = {"0", "1", "2", "2.5", "3", "4", "5"};
   av.setScaleLabels(scaleLabelsAV);
   av.setDisplayDigitalMeterValue(true);
   av.setLowSensorWarningActive(true);
   av.setLowSensorWarningValue((float)2.0);
   av.setHighSensorWarningActive(true);
   av.setHighSensorWarningValue((float)3);

    if (millis() - tmr5 > 1000) {//отправка сигнала
      tmr5 = millis();
      newSensorReading = (int)random(100, 200);
   
    } 
   av.updateMeter(newSensorReading);    
   
   
   
/*   PFont mono;
// The font "andalemo.ttf" must be located in the 
// current sketch's "data" directory to load successfully
mono = loadFont("14-Segment-LED.ttf");
//background(0);
textFont(mono);
text("word", 48, 240);
   
  //   fill(0, 408, 612);
  //text("Камера -  ", 105, 50);*/
   
   }

  void mousePressed() {

  }

  void exit()
  {
    dispose();
    four = null;
  }
}
