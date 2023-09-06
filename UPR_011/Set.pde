//////////////////////////////////////////////////////////////////////////////////1
class PWindow6 extends PApplet {
  PWindow6() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
//  String portName;
 // int speed = 115200;
  
  void settings() {//карта
    size(800, 600);
  }

  void setup() {
    background(150);
    windowMove(150, 150);
    surface.setTitle("Настройки");
    
      setupGUI();        // инициализация интерфейса
     
     cp5 = new ControlP5(this);
     cp5.addButton("Create1").setWidth(100).setHeight(25).linebreak();
  }
  
  void setupGUI() {
  cp5 = new ControlP5(this);
  cp5.setFont(createFont("Calibri", 16));  // сделаем шрифт побольше
  
    cp5.addButton("open").setPosition(350, 10).setSize(80, 30);
  cp5.addButton("close").setPosition(420, 10).setSize(80, 30).linebreak();
    // выпадающий список
  cp5.addScrollableList("com")
    .setPosition(150, 10)
    .setSize(180, 100)
    .setBarHeight(30)
    .setItemHeight(30)
    .close()
    .addItems(Serial.list());
  ;
  }
  
    void draw() {
      background(150);
    }
    
    // список портов
void com(int n) {
  portName = Serial.list()[n];  // запоминаем выбранный порт в portName
}

// кнопка открыть порт
void open() {
  if (portName != null && serial == null) {     // если выбран порт и сейчас он закрыт
    serial = new Serial(this, portName, speed); // открываем portName
  }
 // if (portN) ЕСЛИ ПОРТ НЕ РАВЕН НАЛЛ И СЕРИАЛ НЕ РАВЕН НАЛЛ СЕРИАЛ = НЕВ СЕРИАЛ ВЗИС И ТД...
}

// кнопка закрыть порт
void close() {
  if (serial != null) { // если порт открыт
    serial.stop();      // закрываем portName
    serial = null;      // serial выключен
  }
}
    
  void exit(){
    dispose();
    six = null;
  }
  
}
