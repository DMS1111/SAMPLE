//////////////////////////////////////////////////////////////////////////////////5

class PWindow5 extends PApplet {
  PWindow5() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  void settings() {//информация
    size(705, 155);
  }
  
  Println console;
  int tmr6=0;

  void setup() {
    background(150);
    windowMove(710, 850);
    surface.setTitle("Консоль");
    
      cp5 = new ControlP5(this);
  cp5.enableShortcuts();
  frameRate(50);
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(10, 10)
                  .setSize(400, 140)
                  .setFont(createFont("", 10))
                  .setLineHeight(14)
                  .setColor(color(200))
                  .setColorBackground(color(0, 100))
                  .setColorForeground(color(255, 100));
  ;

  console = cp5.addConsole(myTextarea);//
  
  cp5.addButton("Пауза").setWidth(80).setHeight(25).setPosition(420,10);
  cp5.addButton("Старт").setWidth(80).setHeight(25).setPosition(505,10);
  cp5.addButton("Разблок").setWidth(80).setHeight(25).setPosition(420,45);
  cp5.addButton("Блокировать").setWidth(80).setHeight(25).setPosition(505,45);
  cp5.addButton("Очистить").setWidth(80).setHeight(25).setPosition(420,115);
    cp5.setFont(createFont("", 10));//задается шрифт и размер
  
    
  }

  void draw() {
    background(150);
    
  if (millis() - tmr6 > 300) {
    tmr6 = millis();
     println(random(0,255)+" - "+random(0,255)+" - "+random(0,255)+"  -  "+random(0,255)); 
  }
    
/*    textSize(24);
    fill(100, 408, 612);
    text("Ver 0.04", 50, 100);
    textSize(44);
    fill(100, 100, 100);
    text("Шоу Макет", 150, 50);*/
  }
  
    void Пауза() {
console.pause(); 
}

  void Старт() {
    console.play(); 
}

  void Разблок() {
    console.setMax(-1); 
}

  void Блокировать() {
    console.setMax(10);
}

  void Очистить() {
    console.clear();
}


  void mousePressed() {

  }

  void exit()
  {
    dispose();
    five = null;
  }
}
